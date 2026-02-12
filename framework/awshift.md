# AWShift -- AI Problem-Solving Framework

**Version:** 1.1
**Author:** [awrshift](https://github.com/awrshift1)

---

## What is AWShift?

AWShift is a structured thinking framework for working with AI assistants. It adds **research, verification, and decision checkpoints** to every problem -- so you stop guessing and start deciding with evidence.

**Core idea:** AI proposes, you decide. Every significant decision has a checkpoint.

**Key principles:**

1. **Research before building** -- understand the problem space before writing a line of code
2. **Checkpoints** -- 5-6 explicit points where you review and approve
3. **Evidence over assumptions** -- define success criteria from real data, not gut feeling
4. **Level up, not one-size-fits-all** -- match framework depth to problem stakes

---

## Three Modes

AWShift has three modes. Start with Quick. Level up when stakes go up.

```
Quick (3 phases)     ->  Known fixes, minor tasks, routine work
Standard (11 phases) ->  New features, architecture, complex bugs
Scientific (13 phases) ->  High-stakes decisions, naming, positioning
```

### Quick Mode

```
IDENTIFY (Name the problem) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> DONE
```

You know the problem. You know the fix. Just do it with a safety net.

**When to use:** bug with known cause, config change, copy-paste from docs, typos.

-> Full guide: [quick-mode.md](quick-mode.md)

### Standard Mode

```
IDENTIFY -> FORMULATE -> RESEARCH -> HYPOTHESIZE
  -> EVAL-DESIGN (research how to measure success)
  -> PLAN -> VERIFY -> IMPLEMENT -> TEST -> EVALUATE -> DECIDE
```

The full problem-solving pipeline. Research informs decisions. Every step has a checkpoint.

**When to use:** new features, tool selection, process changes, architectural decisions with low-medium risk.

-> Full guide: [standard-mode.md](standard-mode.md)

### Scientific Mode

```
IDENTIFY -> FORMULATE -> RESEARCH -> HYPOTHESIZE
  -> EVAL-DESIGN (same bar for all hypotheses)
  -> [H1: PLAN -> VERIFY -> IMPLEMENT -> TEST -> EVALUATE]
  -> [H2: PLAN -> VERIFY -> IMPLEMENT -> TEST -> EVALUATE]
  -> [H3: PLAN -> VERIFY -> IMPLEMENT -> TEST -> EVALUATE]
  -> COMPARE -> DECIDE
```

Test multiple hypotheses with the same evaluation criteria. Data picks the winner.

**When to use:** product naming, strategic positioning, architecture choices where "it works" isn't enough -- you need to know it's the *best* option.

-> Full guide: [scientific-mode.md](scientific-mode.md)

---

## The 11 Phases (Standard Mode)

Each phase is a **guideline**, not a rule. Skip what doesn't apply, but know *why* you're skipping it.

---

### Understand -- What's the problem? What do we need to learn?

---

#### Phase 1: IDENTIFY (Name the problem)

**Goal:** Define the problem clearly -- current state, target state, gap.

**Output:**
```
Problem:  [What's wrong or missing]
Current:  [Where we are now]
Target:   [Where we want to be]
Gap:      [The delta between current and target]
Unknowns: [What we don't know yet]
```

**Why it matters:** Most failed projects start with a vague problem. If you can't articulate the gap, you can't measure success.

---

#### Phase 2: FORMULATE (Ask the right questions)

**Goal:** Define what to research before spending time researching.

**Process:**
1. AI analyzes the gap from Phase 1
2. AI proposes research questions grouped by topic
3. **Checkpoint:** You review, adjust, add context the AI doesn't have
4. Approved questions become the research brief

**Why it matters:** Without this step, AI might research the wrong things. You catch misalignment *before* wasting time on research, not after.

---

#### Phase 3: RESEARCH (Find the evidence)

**Goal:** Comprehensive investigation based on validated questions.

**Process:**
1. Research each question from Phase 2 (can be parallel)
2. Include fact-checking within research (verify claims, check availability, cross-reference)
3. Compile findings into a single document

**Research quality tiers:**

| Tier | Sources |
|------|---------|
| 1 | Official docs, academic papers, primary sources |
| 2 | Industry leaders, trusted blogs, benchmarks |
| 3 | Community discussions, forums, anecdotal evidence |

**Why it matters:** Without structured research, AI draws from training data -- which may be outdated, incomplete, or wrong. Real evidence beats memorized patterns.

**Output:** Compiled research document with sourced findings.

---

### Define -- What's our approach? How will we measure success?

---

#### Phase 4: HYPOTHESIZE (Pick your best guess)

**Goal:** Form testable hypotheses based on research evidence.

**Process:**
1. AI formulates primary hypothesis (H1) + alternatives (H2, H3)
2. Each hypothesis follows: "If we [ACTION], then [OUTCOME] will [CHANGE]"
3. **Checkpoint:** You validate, reorder, or discard hypotheses
4. **Independent review (recommended):** Get a second opinion from a different AI or human to catch blind spots

**Output format:**
```
H1: If we [action], then [metric] will [change] because [evidence from research]
H2: If we [action], then [metric] will [change] because [evidence from research]
```

**Decision point:** Continue with Standard (test H1 only) or level up to Scientific (test all hypotheses).

---

#### Phase 5: EVAL-DESIGN (Set the bar)

**Goal:** Define how you'll measure success *before* you build anything.

This is the phase most people skip -- and then they can't tell if their solution actually worked.

**This is a research phase, not a brainstorming exercise.** You don't invent metrics from thin air. You research how the industry, competitors, and domain experts evaluate this type of solution -- then define your bar based on evidence.

**Process:**
1. **Research evaluation approaches** -- how does the industry measure success for this type of problem? What benchmarks exist? What do competitors use?
2. Define 3-5 key metrics with specific thresholds based on that research
3. **Checkpoint:** You approve the evaluation criteria

**Output format:**
```
Metric:    [What you're measuring]
Threshold: [What counts as success]
Source:    [Why this threshold -- market data, competitor benchmarks, user research]
```

**Two intensity levels:**

| Aspect | Standard | Scientific |
|--------|----------|------------|
| Research depth | Key metrics only | Comprehensive + cross-hypothesis fairness |
| Independent review | Optional | Recommended |
| Scope | "How to evaluate THIS solution" | "Same criteria for ALL hypotheses" |

**Why it matters:** Without upfront evaluation criteria, you'll evaluate against "feels right" instead of "meets the bar." Post-hoc metrics are always biased toward confirming what you built.

---

### Build -- Make the plan. Check it. Build it.

---

#### Phase 6: PLAN (Map it out)

**Goal:** Detailed implementation plan for the current hypothesis.

**Process:**
1. AI explores the codebase/context to understand what exists
2. AI writes a structured plan with:
   - Specific changes per file/component
   - Success criteria (from EVAL-DESIGN metrics)
   - Prerequisites between tasks
   - Rollback strategy
3. **Checkpoint:** You approve the plan before any code is written

**Why it matters:** Planning mode forces the AI to check reality before proposing changes. No "planning from memory" -- the AI verifies against actual code.

---

#### Phase 7: VERIFY (Fact-check the plan)

**Goal:** Fact-check the plan against research and existing decisions.

**Checklist:**
- [ ] Research supports this approach?
- [ ] No conflicts with existing architecture/decisions?
- [ ] Feasible within constraints (time, budget, tools)?
- [ ] No security or data risks?
- [ ] EVAL-DESIGN metrics are achievable?

**Completion rule:** VERIFY is not done until ALL issues found are either:
- Fixed in the plan (minor issues)
- Tracked as blocking tasks (major issues)

Implementation cannot start until VERIFY passes.

**Verdicts:**
- `PASS` -- no issues found
- `PASS WITH FIXES` -- issues found and resolved
- `BLOCKED` -- major issues require resolution first

**Why it matters:** Plans look good on paper. VERIFY catches gaps between what research says and what the plan does. It's cheaper to fix a plan than to rewrite code.

---

#### Phase 8: IMPLEMENT (Build it)

**Goal:** Build the minimum viable solution following the approved plan.

**Rules:**
- Follow the plan from Phase 6
- Each task = one logical unit
- Mark progress as you go
- Don't gold-plate -- implement what was planned, nothing more

**Why it matters:** Scope creep kills projects. The plan is the contract. Build what was agreed, nothing more.

---

### Check -- Did it work? What's next?

---

#### Phase 9: TEST (Run the checks)

**Goal:** Verify implementation against success criteria from the plan.

**Process:**
- Run automated tests
- Manual verification against EVAL-DESIGN metrics
- Visual/functional review where applicable
- Compare results to thresholds

**Why it matters:** Testing is not optional. Without comparing results to the bar you set in EVAL-DESIGN, you'll ship on vibes instead of evidence.

---

#### Phase 10: EVALUATE (Score against the bar)

**Goal:** Score the solution against the criteria defined in EVAL-DESIGN.

**Process:**
1. Measure each metric from EVAL-DESIGN against actual results
2. Mark pass/fail per metric
3. Note unexpected outcomes or side effects
4. **Checkpoint:** Review evaluation together

**Standard mode -> proceed to DECIDE**
**Scientific mode -> loop to PLAN for next hypothesis, or proceed to COMPARE if all hypotheses tested**

---

#### Phase 11: DECIDE (Ship, iterate, or rollback)

**Goal:** Ship, iterate, or rollback based on evidence.

| Outcome | Action |
|---------|--------|
| **SUCCESS** | Ship it. Document the decision and rationale. |
| **PARTIAL** | Iterate -- go back to HYPOTHESIZE with new insights |
| **FAIL** | Rollback. Document what was learned. |

**Checkpoint:** Final decision is always yours.

---

## Scientific Mode: Additional Phases

Scientific mode adds two unique elements:

### Hypothesis Loop

Each hypothesis (H1, H2, H3) goes through its own PLAN -> VERIFY -> IMPLEMENT -> TEST -> EVALUATE cycle. Hypotheses are tested **sequentially**, so learnings from H1 inform H2.

### COMPARE Phase

After all hypotheses are evaluated:

1. Collect results from all evaluations
2. Build a comparison table: metric x hypothesis
3. Identify winner per metric and overall
4. **Independent review (recommended):** Get a second opinion on the comparison to counter confirmation bias
5. **Checkpoint:** You see the full picture and make the final call

```
| Metric (from EVAL-DESIGN) | H1     | H2     | H3     | Winner |
|---------------------------|--------|--------|--------|--------|
| Time to deploy            | 3 min  | 8 min  | 5 min  | H1     |
| User satisfaction (1-5)   | 3.8    | 4.5    | 4.1    | H2     |
| Code complexity           | Low    | High   | Medium | H1     |
| Overall                   |        |        |        | ?      |
```

Data speaks. You decide.

-> Full guide: [scientific-mode.md](scientific-mode.md)

---

## Checkpoints

These are the moments where AWShift pauses execution and waits for your input.

### Standard Mode (5 checkpoints)

| Phase | Checkpoint | What You Decide |
|-------|------|-----------------|
| FORMULATE (Ask the right questions) | Research scope | "Are these the right questions?" |
| HYPOTHESIZE (Pick your best guess) | Direction | "Is this the right hypothesis?" |
| EVAL-DESIGN (Set the bar) | Success criteria | "Are these the right metrics?" |
| PLAN (Map it out) | Implementation | "Is this the right plan?" |
| DECIDE (Ship, iterate, or rollback) | Outcome | "Ship, iterate, or rollback?" |

### Scientific Mode (6 checkpoints)

All Standard checkpoints plus:

| Phase | Checkpoint | What You Decide |
|-------|------|-----------------|
| COMPARE | Winner selection | "Which hypothesis wins based on data?" |

---

## Phase Prerequisites

Phases are sequential by design. Each requires the previous one to be complete.

### Standard Flow

```
IDENTIFY (Name the problem)
  |
FORMULATE (Ask the right questions) -- Checkpoint
  |
RESEARCH (Find the evidence) -- can be parallel tasks
  | all must complete
HYPOTHESIZE (Pick your best guess) -- Checkpoint
  |
EVAL-DESIGN (Set the bar) -- Checkpoint
  |
PLAN (Map it out) -- Checkpoint
  |
VERIFY (Fact-check the plan)
  |
IMPLEMENT (Build it) -- can be parallel tasks
  | all must complete
TEST (Run the checks)
  |
EVALUATE (Score against the bar)
  |
DECIDE (Ship, iterate, or rollback) -- Checkpoint
```

### Scientific Flow

```
IDENTIFY -> FORMULATE -> RESEARCH -> HYPOTHESIZE
  |
EVAL-DESIGN (research metrics, define the bar) -- Checkpoint
  |
  +-----------------------------------------------------------+
  |  H1: PLAN -> VERIFY -> IMPLEMENT -> TEST -> EVALUATE      |
  |  H2: PLAN -> VERIFY -> IMPLEMENT -> TEST -> EVALUATE      |
  |  H3: PLAN -> VERIFY -> IMPLEMENT -> TEST -> EVALUATE      |
  +-----------------------------------------------------------+
  |
COMPARE (Checkpoint) -> DECIDE (Checkpoint)
```

---

## Mode Selection Guide

| Signal | Mode |
|--------|------|
| "I know the fix" | Quick |
| "I need to research first" | Standard |
| "There are multiple good options" | Scientific |
| Error is cheap to fix | Quick or Standard |
| Error is expensive or irreversible | Scientific |
| One clear approach | Standard |
| Multiple viable approaches, need data to choose | Scientific |
| Routine task | Quick |
| New territory | Standard or Scientific |

**Leveling up is natural.** Start Quick. If you discover unknowns -> level up to Standard. If multiple viable paths emerge -> level up to Scientific.

---

## Edge Cases

### What if research doesn't find clear metrics?

Use the EVAL-DESIGN fallback:
1. Propose internal criteria based on available data
2. Present to human for validation
3. Document as "Source: internal + user input" (not "market research")

### What if you need to test dependent hypotheses?

If H2 builds on H1's infrastructure (not an independent alternative), use **Standard mode with iteration** instead of Scientific. After DECIDE -> "PARTIAL" -> loop back to HYPOTHESIZE.

### What if the context gets too large?

Each hypothesis cycle can be a separate session. Use the experiment's status file as a checkpoint -- the next session starts by reading it.

### Can I skip phases?

Yes, but document *why*. The framework is guidelines, not handcuffs. Common skips:
- Skip FORMULATE for well-understood problems
- Skip EVAL-DESIGN for simple features with obvious success criteria
- Skip VERIFY for low-risk changes

Never skip: IDENTIFY, PLAN, TEST.

---

## Quick Reference

```
Quick:      IDENTIFY -> IMPLEMENT -> TEST -> DONE
Standard:   IDENTIFY -> FORMULATE -> RESEARCH -> HYPOTHESIZE
            -> EVAL-DESIGN -> PLAN -> VERIFY -> IMPLEMENT -> TEST -> EVALUATE -> DECIDE
Scientific: IDENTIFY -> FORMULATE -> RESEARCH -> HYPOTHESIZE
            -> EVAL-DESIGN -> [H1..HN loops] -> COMPARE -> DECIDE
```

**Checkpoints (Standard):** FORMULATE, HYPOTHESIZE, EVAL-DESIGN, PLAN, DECIDE
**Checkpoints (Scientific):** + COMPARE

**Guidelines, not chains. Evidence, not hope. You decide.**

---

*AWShift is open source under MIT license. Built from 650+ real problem-solving sessions.*
