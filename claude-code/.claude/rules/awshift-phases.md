# AWRSHIFT Phase Enforcement Rules

## Task Blocking

Every AWRSHIFT phase must be a TaskCreate entry with blocking prerequisites. The system cannot skip phases because the next task is blocked.

Pattern:
```
TaskCreate("PHASE: description", blockedBy=["previous-phase-id"])
```

Mark task `in_progress` BEFORE starting work. Mark `completed` AFTER verified.

## Checkpoints — MANDATORY AskUserQuestion Templates

These phases MUST pause and ask the user before proceeding. **Use the exact templates below.** Never proceed past a checkpoint without explicit approval.

---

### Checkpoint 1: FORMULATE (Ask the right questions)

After IDENTIFY, present the research questions you've formulated:

```
AskUserQuestion:
  question: "I've identified these research questions. Which should we investigate?"
  header: "Research"
  multiSelect: true
  options:
    - label: "[Research question 1]"
      description: "[Why this matters for solving the problem]"
    - label: "[Research question 2]"
      description: "[Why this matters]"
    - label: "[Research question 3]"
      description: "[Why this matters]"
```

User can deselect questions, add their own via "Other", or redirect entirely.

---

### Checkpoint 2: HYPOTHESIZE (Pick your best guess)

After RESEARCH, present hypotheses based on evidence:

```
AskUserQuestion:
  question: "Based on research, here are the possible approaches. Which should we pursue?"
  header: "Approach"
  options:
    - label: "H1: [Short name] (Recommended)"
      description: "If we [action], then [outcome]. Evidence: [key finding]. Trade-off: [what you give up]."
    - label: "H2: [Short name]"
      description: "If we [action], then [outcome]. Evidence: [key finding]. Trade-off: [what you give up]."
    - label: "H3: [Short name]"
      description: "If we [action], then [outcome]. Evidence: [key finding]. Trade-off: [what you give up]."
```

If user picks multiple -> suggest Scientific mode (level up).

---

### Checkpoint 3: EVAL-DESIGN (Set the bar)

After HYPOTHESIZE, present success criteria based on research:

```
AskUserQuestion:
  question: "How should we measure success? These metrics are based on industry standards."
  header: "Metrics"
  multiSelect: true
  options:
    - label: "[Metric 1]: threshold [value]"
      description: "Source: [where this benchmark comes from]. Measures: [what it tells us]."
    - label: "[Metric 2]: threshold [value]"
      description: "Source: [benchmark source]. Measures: [what it tells us]."
    - label: "[Metric 3]: threshold [value]"
      description: "Source: [benchmark source]. Measures: [what it tells us]."
```

User adjusts thresholds via "Other". If no industry data found, state "Source: internal estimate" explicitly.

---

### Checkpoint 4: PLAN (Map it out)

Use `EnterPlanMode` -> explore codebase -> write plan -> `ExitPlanMode`. The plan mode system handles approval natively. No AskUserQuestion needed here.

---

### Checkpoint 5: DECIDE (Ship, iterate, or rollback)

After EVALUATE, present results with evidence:

```
AskUserQuestion:
  question: "Results are in. What should we do?"
  header: "Decision"
  options:
    - label: "Ship it (Recommended)"
      description: "All metrics passed: [list scores]. Ready for production."
    - label: "Iterate"
      description: "[Which metrics failed]. Go back to HYPOTHESIZE with new insights."
    - label: "Rollback"
      description: "Too many issues: [summary]. Revert changes and document lessons."
```

---

### Checkpoint 6: COMPARE (Scientific only — Pick the winner)

After all hypotheses evaluated, present comparison:

```
AskUserQuestion:
  question: "All approaches tested. Which wins?"
  header: "Winner"
  options:
    - label: "H1: [name] (Recommended)"
      description: "Scores: [metric1]=X, [metric2]=Y. Won on [N] of [M] metrics. Strength: [key advantage]."
    - label: "H2: [name]"
      description: "Scores: [metric1]=X, [metric2]=Y. Won on [N] of [M] metrics. Strength: [key advantage]."
    - label: "H3: [name]"
      description: "Scores: [metric1]=X, [metric2]=Y. Won on [N] of [M] metrics. Strength: [key advantage]."
```

Always include data table in the experiment's compare phase file before asking.

---

### Level Up (When complexity grows)

When Quick mode reveals unknowns or Standard reveals multiple viable approaches:

```
AskUserQuestion:
  question: "This is more complex than expected. Should we level up?"
  header: "Level up"
  options:
    - label: "Level up to Standard (Recommended)"
      description: "Add research, evaluation, and checkpoints. Current work counts as partial IDENTIFY."
    - label: "Stay with Quick"
      description: "Continue with the simple approach despite unknowns."
```

For Standard -> Scientific:
```
AskUserQuestion:
  question: "Multiple viable approaches found. Should we compare them scientifically?"
  header: "Level up"
  options:
    - label: "Level up to Scientific (Recommended)"
      description: "Test each approach with the same metrics. Data picks the winner."
    - label: "Stay with Standard"
      description: "Go with the top hypothesis without comparing alternatives."
```

---

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

## Scientific Mode Sequencing

Hypotheses are tested sequentially: H1 -> H2 -> H3.
Each hypothesis gets its own PLAN -> VERIFY -> IMPLEMENT -> TEST -> EVALUATE cycle.
COMPARE is blockedBy ALL hypothesis EVALUATE tasks.
