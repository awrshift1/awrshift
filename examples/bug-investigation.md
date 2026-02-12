# Example: Bug Investigation — Quick → Standard Escalation

**Scenario:** Users report that file uploads fail intermittently. Sometimes works, sometimes returns a 500 error. Support tickets increasing.

**Outcome:** Quick fix failed -- memory limit increase didn't solve upload crashes. Escalation to Standard found the real cause: a refactor replaced streaming with buffering. Fixed in 1 day.

---

## Start: Quick Mode

### IDENTIFY (Name the problem)

```
Problem:  File uploads fail intermittently with 500 error.
Fix:      Unknown — need to check logs.
Risk:     Medium (user-facing, but not data loss).
```

### IMPLEMENT (Build it) — attempt

Check server logs → find error: `ENOMEM: not enough memory`

Try the obvious fix: increase upload memory limit from 10MB to 50MB.

### TEST (Run the checks)

Deploy fix → uploads still fail for files >20MB.

**Escalation trigger:** Fix didn't work. Root cause unclear. Unknown territory.

→ **Escalate to Standard mode.**

---

## Escalate: Standard Mode

### Phase 1: IDENTIFY (Name the problem) — refined

```
Problem:  File uploads >20MB fail with ENOMEM despite 50MB memory limit.
Current:  Server crashes on large uploads. Error rate: ~15% of uploads.
Target:   100% upload success for files up to 100MB.
Gap:      Memory management during upload is broken. Need to understand why.
Unknowns: Is this a buffering issue? Streaming issue? Server config?
```

### Phase 2: FORMULATE (Ask the right questions) ← Human Gate

Research questions:
1. How does our upload handler process files? (buffering vs streaming?)
2. What memory profile do uploads create? (can we reproduce in dev?)
3. What are best practices for large file uploads in our framework?

**Human adds:** "Also check if this started after the last deploy — might be a regression."

### Phase 3: RESEARCH (Find the evidence)

Findings:
- **Upload handler:** Uses `multer` with default settings → **buffers entire file in memory**
- **Regression:** Yes — previous version used `busboy` with streaming. Last deploy replaced it with `multer` during a "cleanup refactor"
- **Best practice:** Stream uploads directly to storage (S3/disk), never buffer in memory
- **Memory profile:** 20MB file = 40MB+ memory (base64 encoding overhead)

Root cause found: the "cleanup refactor" replaced streaming with buffering.

### Phase 4: HYPOTHESIZE (Pick your best guess) ← Human Gate

```
H1: If we revert to busboy streaming uploads directly to S3,
    then memory usage drops to <5MB per upload regardless of file size,
    because streaming processes chunks without buffering the whole file.
```

**Human:** "Only one reasonable fix. Standard mode, H1 only."

### Phase 5: EVAL-DESIGN (Set the bar) ← Human Gate

| Metric | Threshold |
|--------|-----------|
| Memory per upload | < 10MB regardless of file size |
| Upload success rate | 100% for files up to 100MB |
| Upload speed | No regression from current (when it works) |
| Existing tests | All pass |

### Phase 6: PLAN (Map it out) ← Human Gate

```
1. Revert upload handler to busboy streaming
2. Add memory monitoring middleware
3. Add upload size validation (100MB max, clear error message)
4. Regression test: upload 1MB, 20MB, 50MB, 100MB files
```

### Phase 7: VERIFY (Fact-check the plan)

- [x] Research confirms streaming is the fix
- [x] No conflicts — busboy was the original approach
- [x] Feasible — revert + tests, 1 day max
- [x] No security risk — busboy is well-maintained

**Verdict: PASS**

### Phase 8: IMPLEMENT (Build it)

Reverted to busboy streaming. Added size validation. Added memory monitoring.

### Phase 9: TEST (Run the checks)

| Test | Result |
|------|--------|
| Upload 1MB | ✅ Success, 3MB memory |
| Upload 20MB | ✅ Success, 4MB memory |
| Upload 50MB | ✅ Success, 5MB memory |
| Upload 100MB | ✅ Success, 6MB memory |
| Upload 150MB | ✅ Rejected with clear error |
| Existing tests | ✅ All pass |

### Phase 10: EVALUATE (Score against the bar)

| Metric | Threshold | Actual | Pass? |
|--------|-----------|--------|-------|
| Memory per upload | < 10MB | 3-6MB | ✅ |
| Success rate | 100% up to 100MB | 100% | ✅ |
| Upload speed | No regression | Same | ✅ |
| Existing tests | All pass | All pass | ✅ |

### Phase 11: DECIDE (Ship, iterate, or rollback) ← Human Gate

**Outcome: SUCCESS**

Ship to production. Add monitoring alert for memory spikes. Document the root cause (refactor regression) so the team knows not to replace streaming with buffering again.

**Post-mortem action:** Add upload stress test to CI pipeline to catch this class of regression.

---

## Key Takeaway

This example shows natural escalation:

1. **Quick mode** — tried the obvious fix (increase memory limit)
2. **Escalation** — fix didn't work, unknowns emerged
3. **Standard mode** — research found the root cause (buffering regression), systematic fix

Escalation cost: ~30 minutes extra. Value: found and fixed the actual problem instead of applying a band-aid.

---

*Start Quick. Escalate when you need to. The framework adapts to the problem.*
