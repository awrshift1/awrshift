# awrshift -- AI Problem-Solving Framework (Claude Code)

## Overview

You follow the awrshift framework for structured problem-solving. Three modes based on problem complexity:

- **Quick:** IDENTIFY (Name the problem) -> IMPLEMENT (Build it) -> TEST (Run the checks) -- known fixes, routine tasks
- **Standard:** 11 phases with 5 checkpoints (features, architecture, complex bugs)
- **Scientific:** 13 phases with 6 checkpoints + hypothesis testing (high-stakes decisions)

**Core principle:** Research before building. Human decides, AI executes.

## Context Files (Your AI's Memory)

Three files give your AI persistent memory across sessions. Read them at the start of every session.

| File | Purpose | Update When |
|------|---------|-------------|
| `MEMORY.md` | Permanent project knowledge -- tech stack, conventions, lessons learned | New important discovery or convention change |
| `next-session.md` | Session handoff -- what was done, what's next, open questions | End of every session |
| `decisions.md` | Decision log -- choices made and why, prevents re-discussing settled topics | When a significant decision is made |

### Session Start
1. Read `next-session.md` -- understand where the last session left off
2. Read `MEMORY.md` -- recall project context, conventions, known pitfalls
3. Read `decisions.md` -- know what was already decided (don't re-discuss Active decisions)

### Session End
1. Update `next-session.md` -- write a handoff note for the next session (what was done, what's next, what to watch out for)
2. Add new entries to `decisions.md` -- any significant choices made during this session
3. Update `MEMORY.md` -- if you learned something important about the project (new conventions, architecture changes, lessons)

### Decision Log Format
Each decision in `decisions.md` follows this format:

| ID | Date | Decision | Status |
|----|------|----------|--------|
| D001 | 2026-01-15 | Chose REST over GraphQL -- team is small, simplicity wins | Active |

**Status values:** Active (follow this), Superseded (replaced by newer decision), Reviewing (open for discussion)

---

## Mode Selection

| Signal | Mode |
|--------|------|
| Known fix, low risk | Quick |
| Unknown solution, needs research | Standard |
| Multiple viable options, high stakes | Scientific |

When unsure, start Quick. Level up if unknowns emerge.

## Quick Mode (3 phases)

```
IDENTIFY (Name the problem) -> IMPLEMENT (Build it) -> TEST (Run the checks) -> DONE
```

No task tracking needed. Just fix and verify.
If fix doesn't work or root cause unclear -> level up to Standard.

## Standard Mode (11 phases)

```
IDENTIFY (Name the problem) -> FORMULATE (Ask the right questions) -> RESEARCH (Find the evidence)
  -> HYPOTHESIZE (Pick your best guess)
  -> EVAL-DESIGN (Set the bar) -- research how to measure success
  -> PLAN (Map it out) -> VERIFY (Fact-check the plan) -> IMPLEMENT (Build it)
  -> TEST (Run the checks) -> EVALUATE (Score against the bar) -> DECIDE (Ship, iterate, or rollback)
```

### Phase Enforcement

**Every phase = a task with blocking prerequisites.** You cannot skip phases because the next phase is blocked until the previous one completes.

Create all tasks at the start using `TaskCreate`. Each task needs `subject`, `description`, and `activeForm` (spinner text shown while working). Use `addBlockedBy` with task IDs returned by `TaskCreate` to enforce sequence.

**Example (Standard mode task chain):**

```
# Phase 1 -- returns task ID "1"
TaskCreate(
  subject: "IDENTIFY: Define problem & gap",
  description: "Read relevant files, define problem/current/target/gap/unknowns",
  activeForm: "Identifying problem and gap"
)

# Phase 2 -- FORMULATE happens inline via AskUserQuestion (no task needed)

# Phase 3 -- parallel research tasks
TaskCreate(subject: "RESEARCH: [topic 1]", description: "...", activeForm: "Researching [topic 1]")
TaskCreate(subject: "RESEARCH: [topic 2]", description: "...", activeForm: "Researching [topic 2]")
  -> addBlockedBy: ["1"]  (blocked by IDENTIFY)

# Merge step
TaskCreate(subject: "COMPILE: Merge all research", description: "...", activeForm: "Compiling research")
  -> addBlockedBy: ["2", "3"]  (blocked by both RESEARCH tasks)

# Phase 4
TaskCreate(subject: "HYPOTHESIZE: Form testable hypotheses", ..., activeForm: "Forming hypotheses")
  -> addBlockedBy: ["4"]  (blocked by COMPILE)

# Phase 5
TaskCreate(subject: "EVAL-DESIGN: Research success metrics", ..., activeForm: "Researching eval criteria")
TaskCreate(subject: "EVAL-COMPILE: Build evaluation framework", ..., activeForm: "Building eval framework")
  -> addBlockedBy: [eval-design task IDs]

# Phase 6-11
TaskCreate(subject: "PLAN: Implementation plan", ...) -> addBlockedBy: [EVAL-COMPILE]
TaskCreate(subject: "VERIFY: Check plan vs research", ...) -> addBlockedBy: [PLAN]
TaskCreate(subject: "IMPLEMENT: [feature]", ...) -> addBlockedBy: [VERIFY]
TaskCreate(subject: "TEST: Run tests", ...) -> addBlockedBy: [all IMPLEMENT tasks]
TaskCreate(subject: "EVALUATE: Score results vs EVAL-DESIGN", ...) -> addBlockedBy: [TEST]
TaskCreate(subject: "DECIDE: Ship/iterate/rollback", ...) -> addBlockedBy: [EVALUATE]
```

**Key:** `addBlockedBy` uses the numeric task IDs returned by `TaskCreate`. A blocked task cannot start until all its blockers are completed.

### Checkpoints (5 decision points)

Use `AskUserQuestion` at these phases -- pause and wait for human input.

**AskUserQuestion format:** Present 1-4 questions, each with 2-4 options. Put the recommended option first with "(Recommended)" suffix. The system always adds a custom "Other" field -- user can override any option with free text. Group related questions by topic.

| Phase | What to Ask |
|-------|-------------|
| **FORMULATE** (Ask the right questions) | Present research questions grouped by topic. Each question = one `AskUserQuestion` option the user can approve, modify, or reject. |
| **HYPOTHESIZE** (Pick your best guess) | Present H1, H2, H3 as options with trade-offs. User picks which to test. |
| **EVAL-DESIGN** (Set the bar) | Present metrics + thresholds as grouped options. User approves or adjusts. |
| **PLAN** (Map it out) | Use `EnterPlanMode` -> explore codebase -> write plan -> `ExitPlanMode`. User approves plan. |
| **DECIDE** (Ship, iterate, or rollback) | Present outcome options (Ship / Iterate / Rollback) with evidence summary. User makes final call. |

### Phase Details

**IDENTIFY (Name the problem):** Read relevant files. Define problem/current/target/gap/unknowns.

**FORMULATE (Ask the right questions):** Analyze the gap from IDENTIFY and propose research questions:
1. Break the gap into knowledge areas (technical, market, user, constraints)
2. For each area, form 1-2 specific research questions
3. Prioritize: what must we know before planning?
4. Present via `AskUserQuestion` -- user validates, modifies, or adds questions
5. Approved questions become RESEARCH task scope

**RESEARCH (Find the evidence):** Launch parallel research tracks via `Task(run_in_background=true)` for each research topic. Include fact-checking. Compile when all complete.

**HYPOTHESIZE (Pick your best guess):** Form testable hypotheses: "If [action], then [outcome] because [evidence]." Optional: get second opinion from different AI model.

**EVAL-DESIGN (Set the bar):** Research industry evaluation criteria. Two intensity levels:

| Level | When | Research Tracks | Focus |
|-------|------|-----------------|-------|
| Standard | Features, architecture | 1-3 parallel | Key metrics for this problem |
| Scientific | High-stakes decisions | 2-3 parallel + cross-hypothesis fairness | Metrics that apply equally to all hypotheses |

Define 3-5 metrics with pass/fail thresholds. `AskUserQuestion` for approval. If no industry data found, state assumptions explicitly -- don't guess silently.

**PLAN (Map it out):** `EnterPlanMode`. Explore codebase, write detailed plan. `ExitPlanMode` for approval.

**VERIFY (Fact-check the plan):** Check plan against research using this checklist:
1. Does each plan step have research evidence supporting it?
2. Are there contradictions between plan and research findings?
3. Is the plan technically feasible given current constraints?
4. Are there security, performance, or scalability risks?
5. Can EVAL-DESIGN thresholds realistically be achieved?
6. Is the rollback strategy defined?

Completion rule: NOT done until all issues fixed or tracked. Verdicts: PASS, PASS WITH FIXES, BLOCKED.

**IMPLEMENT (Build it):** Follow the plan. One logical unit per task. Mark progress.

**TEST (Run the checks):** Run tests against success criteria from EVAL-DESIGN.

**EVALUATE (Score against the bar):** Score each metric from EVAL-DESIGN. Pass/fail per threshold. Note side effects.

**DECIDE (Ship, iterate, or rollback):** Ship (SUCCESS), iterate (PARTIAL -> back to HYPOTHESIZE), or rollback (FAIL).

## Scientific Mode (13 phases)

Adds hypothesis loop + COMPARE (Pick the winner). Use when multiple viable approaches exist.

```
IDENTIFY -> FORMULATE -> RESEARCH -> HYPOTHESIZE
  -> EVAL-DESIGN (research metrics -- same bar for all hypotheses)
  -> H1: PLAN (Map it out) -> VERIFY (Fact-check) -> IMPLEMENT (Build it) -> TEST (Run checks) -> EVALUATE (Score)
  -> H2: PLAN (Map it out) -> VERIFY (Fact-check) -> IMPLEMENT (Build it) -> TEST (Run checks) -> EVALUATE (Score)
  -> H3: PLAN (Map it out) -> VERIFY (Fact-check) -> IMPLEMENT (Build it) -> TEST (Run checks) -> EVALUATE (Score)
  -> COMPARE (Pick the winner) -> DECIDE (Ship, iterate, or rollback)
```

### Additional Rules

- Hypotheses tested **sequentially** (learnings from H1 inform H2)
- **Same evaluation criteria** for all hypotheses (from EVAL-DESIGN)
- COMPARE (Pick the winner) uses `AskUserQuestion` -- present data table, user picks winner
- Each H gets `EnterPlanMode` for its PLAN phase
- Optional: second opinion from different AI at HYPOTHESIZE, EVAL-DESIGN, COMPARE

### Task Template (Scientific)

```
# After HYPOTHESIZE...
TaskCreate("EVAL-DESIGN: [topic]", blockedBy=["HYPOTHESIZE"])
TaskCreate("EVAL-COMPILE", blockedBy=["ED-*"])

# H1 loop
TaskCreate("H1-PLAN", blockedBy=["EVAL-COMPILE"])
TaskCreate("H1-VERIFY", blockedBy=["H1-PLAN"])
TaskCreate("H1-IMPLEMENT", blockedBy=["H1-VERIFY"])
TaskCreate("H1-TEST", blockedBy=["H1-IMPLEMENT"])
TaskCreate("H1-EVALUATE", blockedBy=["H1-TEST"])

# H2 loop (sequential -- after H1)
TaskCreate("H2-PLAN", blockedBy=["H1-EVALUATE"])
TaskCreate("H2-VERIFY", blockedBy=["H2-PLAN"])
TaskCreate("H2-IMPLEMENT", blockedBy=["H2-VERIFY"])
TaskCreate("H2-TEST", blockedBy=["H2-IMPLEMENT"])
TaskCreate("H2-EVALUATE", blockedBy=["H2-TEST"])

# Compare & Decide
TaskCreate("COMPARE", blockedBy=["H1-EVALUATE", "H2-EVALUATE"])
TaskCreate("DECIDE", blockedBy=["COMPARE"])
```

## VERIFY Completion Rule

VERIFY task is **not completed** until every issue is resolved:

1. Run checklist -> find issues
2. Minor fix -> fix the PLAN, mark FIXED in verify doc
3. Major issue -> create blocking task, IMPLEMENT waits on it
4. All issues resolved? -> VERIFY completed (PASS or PASS WITH FIXES)
5. Unresolved issues? -> VERIFY stays `in_progress`

This is a structural guarantee: IMPLEMENT is `blockedBy: VERIFY`, so it physically can't start until VERIFY passes.

## Experiment Structure

Each experiment gets a directory:

```
experiments/{name}/
├── STATUS.md           # Experiment status + links
├── phases/
│   ├── 01-identify.md
│   ├── 02-research.md
│   ├── 03-hypothesize.md
│   ├── 03b-eval-design.md
│   ├── 04-plan.md
│   ├── 05-verify.md
│   ├── 06-implement.md
│   ├── 07-test.md
│   ├── 08-evaluate.md
│   └── 09-decide.md
├── input/
├── output/
└── scripts/
```

**Scientific mode** adds per-hypothesis files:

```
phases/
├── 04-plan-H1.md
├── 05-verify-H1.md
├── 06-implement-H1.md
├── 07-test-H1.md
├── 08-evaluate-H1.md
├── 04-plan-H2.md
├── 05-verify-H2.md
├── 06-implement-H2.md
├── 07-test-H2.md
├── 08-evaluate-H2.md
└── 09-compare.md       # Side-by-side data table
```

## Edge Cases

**No industry data for EVAL-DESIGN:** State assumptions explicitly. Use "assumption-based" tag. User can override via "Other" in AskUserQuestion.

**Context window filling up:** Prioritize phase docs over conversation history. Use `/compact` if available. Research tracks run in background to protect main context.

**Dependent hypotheses in Scientific:** If H2 depends on H1 results, document the prerequisite. Learnings from H1 inform H2 planning -- this is by design, not a bug.

**User rejects all options at checkpoint:** Use the "Other" field response as the new direction. If unclear, ask a follow-up question to clarify intent.

**Quick mode reveals complexity:** Level up to Standard mid-session. Create all phase tasks from IDENTIFY onward. Work already done in Quick counts as partial IDENTIFY.

## Tool -> Phase Mapping

| Tool | Phase(s) |
|------|----------|
| `Read`, `Grep`, `Glob` | IDENTIFY, RESEARCH, EVAL-DESIGN |
| `AskUserQuestion` | FORMULATE, HYPOTHESIZE, EVAL-DESIGN, EVALUATE, COMPARE, DECIDE |
| `TaskCreate/Update/List` | ALL phases |
| `Task(run_in_background)` | RESEARCH, EVAL-DESIGN |
| `WebSearch`, `WebFetch` | RESEARCH, EVAL-DESIGN (via research tracks) |
| `EnterPlanMode/ExitPlanMode` | PLAN |
| `Edit`, `Write` | IMPLEMENT |
| `Bash` | IMPLEMENT, TEST |

## Rules

1. **Phase enforcement** -- every phase (with its dual name) = blocked task. Cannot skip.
2. **Checkpoints** -- 5 in Standard, 6 in Scientific. Always pause for approval.
3. **VERIFY blocks IMPLEMENT** -- structural guarantee, not honor system.
4. **Research before planning** -- PLAN requires RESEARCH and EVAL-DESIGN to be complete.
5. **Evidence-based evaluation** -- metrics from industry data, not assumptions.
6. **Leveling up is expected** -- Quick -> Standard -> Scientific as complexity reveals itself.

---

*awrshift v1.1 -- Drop this file into your project root. See /think command for quick activation.*
