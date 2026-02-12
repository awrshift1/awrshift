# awrshift Phase Enforcement Rules

## Task Blocking

Every awrshift phase must be a TaskCreate entry with blocking prerequisites. The system cannot skip phases because the next task is blocked.

Pattern:
```
TaskCreate("PHASE: description", blockedBy=["previous-phase-id"])
```

Mark task `in_progress` BEFORE starting work. Mark `completed` AFTER verified.

## Checkpoints

These phases MUST use `AskUserQuestion` before proceeding:
- FORMULATE (Ask the right questions) — user validates research questions
- HYPOTHESIZE (Pick your best guess) — user validates hypotheses
- EVAL-DESIGN (Set the bar) — user approves metrics and thresholds
- PLAN (Map it out) — use `EnterPlanMode` / `ExitPlanMode` for structured approval
- DECIDE (Ship, iterate, or rollback) — user makes final decision
- COMPARE (Pick the winner) (Scientific only) — user reviews comparison table

Never proceed past a checkpoint without explicit approval.

### AskUserQuestion Format

Always use structured options, not open-ended text questions:
- 1-4 questions per call, 2-4 options per question
- Put recommended option FIRST with "(Recommended)" in label
- Group related items into one question (e.g., 3 research topics = 1 question with 3 options)
- User can ALWAYS pick "Other" to provide custom input — never assume options are exhaustive
- For FORMULATE (Ask the right questions): each research question = one selectable option
- For HYPOTHESIZE (Pick your best guess): each hypothesis = one option with trade-off description
- For EVAL-DESIGN (Set the bar): present metric groups as options (user adjusts thresholds via "Other")
- For DECIDE (Ship, iterate, or rollback): Ship/Iterate/Rollback as options with evidence summary in descriptions

## VERIFY Completion Rule

VERIFY task stays `in_progress` until ALL found issues are resolved:
- Minor: fix in plan document, mark as FIXED
- Major: create blocking task, IMPLEMENT waits

IMPLEMENT has `blockedBy: VERIFY` — structural enforcement.

## Research Parallel Execution

RESEARCH and EVAL-DESIGN phases can launch parallel research tracks:
```
Task(run_in_background=true, subagent_type="Explore")
```
COMPILE task is blockedBy all research tasks.

## Leveling Up

If Quick mode reveals unknowns -> level up to Standard.
If Standard HYPOTHESIZE reveals multiple viable approaches -> level up to Scientific.
Leveling up is expected, not failure.

## Scientific Mode Sequencing

Hypotheses are tested sequentially: H1 → H2 → H3.
Each hypothesis gets its own PLAN (Map it out) → VERIFY (Fact-check the plan) → IMPLEMENT (Build it) → TEST (Run the checks) → EVALUATE (Score against the bar) cycle.
COMPARE (Pick the winner) is blockedBy ALL hypothesis EVALUATE tasks.
