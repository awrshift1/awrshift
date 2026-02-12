# Scientific Mode

**13 phases. For high-stakes decisions where "it works" isn't enough.**

---

## When to Use

- Product naming or positioning (hard to change later)
- Architecture choices that affect years of development
- Multiple viable approaches and no clear winner
- Stakeholders disagree, and you need data to resolve it
- The cost of choosing wrong is significantly higher than the cost of testing multiple options

**Rule of thumb:** If someone asks "why did you pick H1?" and your answer is "it seemed right" -- you need Scientific mode.

---

## The 13 Phases

```
IDENTIFY (Name the problem) -> FORMULATE (Ask the right questions) -> RESEARCH (Find the evidence) -> HYPOTHESIZE (Pick your best guess)
  -> EVAL-DESIGN (Set the bar -- research metrics, same criteria for all hypotheses)
  -> [H1: PLAN (Map it out) -> VERIFY (Fact-check the plan) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> EVALUATE (Score against the bar)]
  -> [H2: PLAN (Map it out) -> VERIFY (Fact-check the plan) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> EVALUATE (Score against the bar)]
  -> [H3: PLAN (Map it out) -> VERIFY (Fact-check the plan) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> EVALUATE (Score against the bar)]
  -> COMPARE (Pick the winner) -> DECIDE (Ship, iterate, or rollback)
```

### How It Differs from Standard

| Aspect | Standard | Scientific |
|--------|----------|------------|
| Hypotheses tested | 1 (primary only) | All (H1, H2, H3+) |
| EVAL-DESIGN depth | Key metrics only | Comprehensive + cross-hypothesis fairness |
| Decision basis | "Does it meet the bar?" | "Which meets it best?" |
| Time investment | 1x | 2-3x (worth it for high stakes) |
| Independent reviews | Optional | Recommended at 3 checkpoints |

---

## Phase Details

### Phases 1-3: Same as Standard

IDENTIFY (Name the problem), FORMULATE (Ask the right questions), RESEARCH (Find the evidence) -- identical to Standard mode. See [standard-mode.md](standard-mode.md).

### Phase 4: HYPOTHESIZE (Pick your best guess) -- Checkpoint

Same as Standard, but with extra rigor:

1. AI proposes H1, H2, H3 (sometimes H4) with evidence from research
2. **Independent review (recommended):** Different AI or human reviews hypotheses -- "Are these well-formed? What are we missing?"
3. You validate all hypotheses and their priority order

**All hypotheses must be:**
- Testable with measurable criteria
- Independent alternatives (not builds on H1)
- Documented with evidence supporting each

### Phase 5: EVAL-DESIGN (Set the bar) -- Checkpoint

**This is a full research phase**, not a quick brainstorm. You research how the industry evaluates this type of solution, what benchmarks exist, what competitors measure -- then define metrics that will fairly compare all hypotheses.

**Process:**
1. **Research evaluation approaches** -- industry benchmarks, competitor analysis, domain expert recommendations
2. Define metrics that work fairly across ALL hypotheses (no bias toward H1)
3. Set evidence-based thresholds (from research, not guesswork)
4. **Independent review (recommended):** "Are these metrics fair across all approaches?"
5. **Checkpoint:** You approve the evaluation criteria

**Scientific additions vs Standard:**
- Cross-hypothesis fairness: same metrics applied identically to all H
- Same test datasets, same evaluation rubric, same user pool
- More research depth: comprehensive benchmarks, not just key metrics

**Output:** Evaluation matrix that will be applied identically to every hypothesis.

```
| Metric        | Threshold | H1 | H2 | H3 |
|---------------|-----------|----|----|---- |
| Performance   | < 200ms   |    |    |     |
| User rating   | > 4.0/5   |    |    |     |
| Complexity    | Low-Med   |    |    |     |
```

### Phases 6-10: HYPOTHESIS LOOP

Each hypothesis gets its own full cycle:

```
H1: PLAN (Map it out) -> VERIFY (Fact-check the plan) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> EVALUATE (Score against the bar)
H2: PLAN (Map it out) -> VERIFY (Fact-check the plan) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> EVALUATE (Score against the bar)
H3: PLAN (Map it out) -> VERIFY (Fact-check the plan) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> EVALUATE (Score against the bar)
```

**Critical rules:**
1. **Sequential, not parallel.** H2 starts after H1's EVALUATE. Learnings from H1 inform H2.
2. **Same evaluation criteria.** Every hypothesis is scored on the exact same metrics from EVAL-DESIGN.
3. **Early exit allowed.** If after H1 and H2 it's clear H3 can't win, you can skip H3 with documented reasoning.
4. **Each hypothesis gets its own plan.** No reusing H1's plan for H2 -- each gets fresh analysis.

### Phase 11: COMPARE (Pick the winner) -- Checkpoint

Side-by-side comparison using data from all evaluations.

**Process:**
1. Collect scores from all hypothesis evaluations
2. Build comparison table

```
| Metric (EVAL-DESIGN) | H1 result | H2 result | H3 result | Winner |
|-----------------------|-----------|-----------|-----------|--------|
| Performance           | 150ms     | 220ms     | 180ms     | H1     |
| User satisfaction     | 3.8/5     | 4.5/5     | 4.1/5     | H2     |
| Implementation cost   | Low       | High      | Medium    | H1     |
| Maintainability       | High      | Medium    | High      | H1/H3  |
```

3. **Independent review (recommended):** Share the comparison table and context with a different AI or colleague -- "Based on this data, which would you recommend and why?"
4. **Checkpoint:** You see the full picture. Data informs, you decide.

### Phase 12: DECIDE (Ship, iterate, or rollback) -- Checkpoint

| Outcome | Action |
|---------|--------|
| **CLEAR WINNER** | Ship the winner. Document why in decision log. |
| **CLOSE CALL** | You pick based on qualitative factors + data |
| **ALL FAIL** | Rollback all. Document learnings. New HYPOTHESIZE cycle. |

---

## Task Prerequisites (Scientific)

```
IDENTIFY (Name the problem) -> FORMULATE (Ask the right questions) -> RESEARCH (Find the evidence) -> HYPOTHESIZE (Pick your best guess)
  |
EVAL-DESIGN (Set the bar -- research metrics, same criteria for all H) -- Checkpoint
  |
  +======================================================================================================================+
  |  H1: PLAN (Map it out) -> VERIFY (Fact-check the plan) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> EVALUATE (Score against the bar)  |
  |       (H1 EVALUATE done)                                                                                |
  |  H2: PLAN (Map it out) -> VERIFY (Fact-check the plan) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> EVALUATE (Score against the bar)  |
  |       (H2 EVALUATE done)                                                                                |
  |  H3: PLAN (Map it out) -> VERIFY (Fact-check the plan) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> EVALUATE (Score against the bar)  |
  |       (all evaluated)                                                                                   |
  +======================================================================================================================+
  |
COMPARE (Pick the winner) -- requires all H* EVALUATE
  |
DECIDE (Ship, iterate, or rollback) -- requires COMPARE
```

---

## Context Management

Scientific mode generates many artifacts. Strategy:

- Each hypothesis cycle can be a separate session
- Use the experiment status file as a checkpoint
- Per-hypothesis files keep full context for each approach
- The COMPARE phase only needs evaluation results, not implementation details

---

## Real-World Timing

For a typical 3-hypothesis experiment:

| Phase | Time |
|-------|------|
| IDENTIFY through EVAL-DESIGN (Name the problem -> Set the bar) | 1-2 hours |
| Each hypothesis loop (PLAN -> EVALUATE) | 1-4 hours |
| COMPARE (Pick the winner) + DECIDE (Ship, iterate, or rollback) | 30 min |
| **Total** | **4-14 hours** |

This is 2-3x the time of Standard. But for decisions that affect months of work, it saves more time than it costs.

---

## When NOT to Use Scientific

- If there's one clearly superior approach -> use Standard
- If hypotheses are dependent (H2 builds on H1) -> use Standard with iteration
- If the cost of choosing wrong is low -> use Standard
- If you're time-pressured and can easily course-correct -> use Standard

Scientific mode is for decisions where you need to **prove** the best choice, not just find a good one.

---

*Scientific mode is expensive but honest. Data picks the winner, not assumptions.*
