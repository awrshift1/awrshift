# Standard Mode

**11 phases. For features, architecture, and complex problems.**

---

## When to Use

- Building a new feature or product
- Choosing between tools, libraries, or architectures
- Investigating a complex bug with unknowns
- Process changes where the cost of error is low-to-medium
- Any task where you need to research before acting

---

## The 11 Phases

```
IDENTIFY (Name the problem) -> FORMULATE (Ask the right questions) -> RESEARCH (Find the evidence) -> HYPOTHESIZE (Pick your best guess)
  -> EVAL-DESIGN (Set the bar -- research how to measure success)
  -> PLAN (Map it out) -> VERIFY (Fact-check the plan) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> EVALUATE (Score against the bar) -> DECIDE (Ship, iterate, or rollback)
```

### Phase Flow

```
+--------------------------------------------------+
|  UNDERSTAND THE PROBLEM                          |
|  +----------+   +-----------+   +----------+     |
|  | IDENTIFY | -> | FORMULATE | -> | RESEARCH |   |
|  +----------+   +-----^-----+   +----------+     |
|                  Checkpoint                       |
+--------------------------------------------------+
|  DEFINE THE APPROACH                             |
|  +-------------+   +-------------+               |
|  | HYPOTHESIZE | -> | EVAL-DESIGN |              |
|  +------^------+   +------^------+               |
|   Checkpoint         Checkpoint                   |
+--------------------------------------------------+
|  BUILD IT                                        |
|  +------+   +--------+   +-----------+           |
|  | PLAN | -> | VERIFY | -> | IMPLEMENT |         |
|  +--^---+   +--------+   +-----------+           |
|  Checkpoint                                       |
+--------------------------------------------------+
|  CHECK IT                                        |
|  +------+   +----------+   +--------+            |
|  | TEST | -> | EVALUATE | -> | DECIDE |          |
|  +------+   +----------+   +---^----+            |
|                              Checkpoint           |
+--------------------------------------------------+
```

---

## Phase Details

### 1. IDENTIFY (Name the problem)

Define the problem, current state, target state, and gap.

```
Problem:  [Description]
Current:  [State or value]
Target:   [Desired state or value]
Gap:      [Current minus target]
Unknowns: [List of things we don't know yet]
```

Check for prior decisions related to this problem. Don't solve what's already been decided.

### 2. FORMULATE (Ask the right questions) -- Checkpoint

AI proposes research questions. You validate before any research starts.

**Why this exists:** AI might research the wrong things. You catch misalignment early -- before wasting time on irrelevant research.

**Process:**
1. AI analyzes the gap and proposes grouped research questions
2. You review, adjust, add context the AI doesn't have
3. Approved questions = research brief

### 3. RESEARCH (Find the evidence)

Investigate each validated question. Can run multiple research tracks in parallel.

**Quality tiers:**
| Tier | Sources |
|------|---------|
| 1 | Official docs, papers, primary data |
| 2 | Industry leaders, trusted blogs, benchmarks |
| 3 | Community discussions, forums |

**Include fact-checking within research:**
- Verify claims (star counts, pricing, statistics)
- Cross-reference with other sources
- Check availability (names, domains, packages)

**Output:** Compiled research document.

### 4. HYPOTHESIZE (Pick your best guess) -- Checkpoint

Form testable hypotheses from research.

```
H1: If we [action], then [outcome] will [change] because [evidence]
H2: If we [action], then [outcome] will [change] because [evidence]
```

**Independent review (recommended):** Get a second opinion from a different AI model or a colleague to catch blind spots.

**Decision point:** Stay in Standard (test H1 only) or level up to Scientific (test all).

### 5. EVAL-DESIGN (Set the bar) -- Checkpoint

Define success criteria from research, not gut feeling.

**This is a research phase.** You don't invent metrics -- you research how the industry, competitors, and domain experts evaluate this type of solution. Then you define your bar based on evidence.

**Process:**
1. **Research evaluation approaches** -- what benchmarks exist? How do competitors measure this? What do domain experts recommend?
2. Define 3-5 key metrics with evidence-based thresholds
3. You approve the evaluation framework

```
Metric:    [What you measure]
Threshold: [What counts as success]
Source:    [Why this number -- benchmark, competitor data, user research]
```

**Why this is mandatory:** Without upfront criteria, you'll evaluate against "feels right" instead of evidence-based thresholds. Define the bar before you build.

### 6. PLAN (Map it out) -- Checkpoint

Detailed implementation plan. AI explores the actual codebase/context before proposing.

**Contents:**
- Files to modify/create (specific)
- Changes per file (specific)
- Success criteria (from EVAL-DESIGN)
- Task prerequisites
- Rollback strategy

**No coding happens until the plan is approved.**

### 7. VERIFY (Fact-check the plan)

Fact-check the plan against research and existing decisions.

**Checklist:**
- [ ] Research supports this approach?
- [ ] No conflicts with existing decisions?
- [ ] Feasible within constraints?
- [ ] No security/data risks?
- [ ] EVAL-DESIGN metrics achievable?

**Completion rule:** VERIFY is not done until every found issue is either fixed in the plan or tracked as a blocking task. Implementation cannot start while VERIFY is open.

**Verdicts:** `PASS` | `PASS WITH FIXES` | `BLOCKED`

### 8. IMPLEMENT (Build it)

Build the minimum viable solution following the plan.

- One logical unit per task
- Track progress as you go
- Don't add features beyond what was planned

### 9. TEST (Run the checks)

Verify against success criteria.

- Run automated tests
- Manual verification where needed
- Compare results to EVAL-DESIGN thresholds

### 10. EVALUATE (Score against the bar)

Score the solution against EVAL-DESIGN metrics.

- Measure each metric against actual results
- Mark pass/fail per threshold
- Note unexpected outcomes
- Review with the human

### 11. DECIDE (Ship, iterate, or rollback) -- Checkpoint

| Outcome | Action |
|---------|--------|
| **SUCCESS** | Ship. Document the decision. |
| **PARTIAL** | Iterate -- back to HYPOTHESIZE with new insights |
| **FAIL** | Rollback. Document learnings. |

---

## Task Prerequisites

Each phase blocks the next. You can't skip ahead.

```
IDENTIFY (Name the problem)
  |
FORMULATE (Ask the right questions) -- Checkpoint
  |
RESEARCH (Find the evidence) [R-1, R-2, ... R-N] (parallel)
  | all must complete
HYPOTHESIZE (Pick your best guess) -- Checkpoint
  |
EVAL-DESIGN (Set the bar) [ED-1, ED-2] (parallel research)
  | all must complete -> Checkpoint
PLAN (Map it out) -- Checkpoint
  |
VERIFY (Fact-check the plan)
  |
IMPLEMENT (Build it) [I-1, I-2, ... I-N] (may have internal prerequisites)
  | all must complete
TEST (Run the checks)
  |
EVALUATE (Score against the bar)
  |
DECIDE (Ship, iterate, or rollback) -- Checkpoint
```

---

## Leveling Up to Scientific

Level up if during HYPOTHESIZE you discover:
- Multiple viable approaches with no clear winner
- High cost of choosing wrong
- Stakeholders disagree on direction
- "It works" is not enough -- you need "it's the best"

Scientific mode tests all hypotheses with the same evaluation criteria and compares them with data.

-> [scientific-mode.md](scientific-mode.md)

---

*Standard mode is the workhorse. Most real problems live here.*
