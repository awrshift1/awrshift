# Quick Mode

**3 phases. For known problems with known fixes.**

---

## When to Use

- Bug with a known cause
- Config change, environment variable update
- Copy-paste from documentation
- Typo fixes, minor refactoring
- Routine tasks you've done before

**Rule of thumb:** If you can explain the fix in one sentence, use Quick mode.

---

## The 3 Phases

### 1. IDENTIFY (Name the problem)

State the problem in one sentence.

```
Problem: [What's broken/missing]
Fix:     [What needs to change]
Risk:    [Low / None]
```

No research needed -- you already know the answer.

### 2. IMPLEMENT (Build it)

Make the change. Keep it minimal.

- One logical change per commit
- Don't refactor surrounding code
- Don't add "improvements" beyond the fix

### 3. TEST (Run the checks)

Verify it works.

- Run existing tests
- Manual smoke test if no automated tests exist
- Confirm the original problem is resolved

**Done.** No evaluation, no decision checkpoint. Ship it.

---

## Upgrade Triggers

If any of these happen during Quick mode, **level up to Standard:**

| Signal | Action |
|--------|--------|
| Fix doesn't work | Level up -- you need RESEARCH (Find the evidence) |
| Root cause is unclear | Level up -- you need IDENTIFY (Name the problem) + RESEARCH (Find the evidence) |
| Multiple possible fixes | Level up -- you need HYPOTHESIZE (Pick your best guess) |
| Change affects other systems | Level up -- you need VERIFY (Fact-check the plan) |
| You're guessing | Level up -- you need evidence |

Leveling up is not failure. It's recognizing that the problem is harder than expected.

---

## Example

```
IDENTIFY:  Login button returns 404 after deploy
           -> Fix: Route was renamed in last PR, update the endpoint
           -> Risk: Low (isolated change)

IMPLEMENT: Update route from /api/auth/login to /api/v2/auth/login

TEST:      Login works. Existing auth tests pass.

DONE.
```

---

*Quick mode is the entry point. Most problems start here. Level up when they need to.*
