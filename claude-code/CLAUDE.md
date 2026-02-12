# awrshift -- AI Problem-Solving Framework

Structured problem-solving: research before building. Human decides, AI executes.

## Structure

```
context/                    # Session memory (read at start, update at end)
  memory.md                 # Project knowledge, conventions, lessons learned
  next-session.md           # Session handoff (what was done, what's next)
  decisions.md              # Decision log (choices made and why)

framework/                  # Methodology reference
  methodology.md            # Full awrshift methodology (3 modes, all phases)
  experiment-template.md    # STATUS.md template for new experiments

experiments/                # Auto-created when you start a task with the framework

.claude/
  commands/think.md         # /think command (entry point)
  rules/awshift-phases.md   # Phase enforcement rules (auto-loaded)
```

## Reference Documentation

**Read BEFORE working:**

| Topic | Location |
|-------|----------|
| Full Methodology | `framework/methodology.md` (3 modes, 11-13 phases, checkpoints) |
| Experiment Template | `framework/experiment-template.md` (STATUS.md for new experiments) |
| Phase Rules | `.claude/rules/awshift-phases.md` (task blocking, checkpoints, AskUserQuestion format) |
| /think Command | `.claude/commands/think.md` |

## Context Files

All in `context/`. Read at session start, update at session end.

| File | Purpose | Update When |
|------|---------|-------------|
| `context/next-session.md` | Session handoff -- what was done, what's next | End of every session |
| `context/decisions.md` | Decision log -- prevents re-discussing settled topics | When a decision is made |
| `context/memory.md` | Permanent project knowledge -- tech stack, conventions | New important discovery |

**Rules:**
- Don't re-discuss decisions with status "Active" (only if "Reviewing")
- Keep files short -- archive old content, don't let them grow forever

## Session Workflow

### Session Start
Read all `context/` files to restore state. If this is the first session (files contain templates), introduce yourself and explain the framework briefly.

### During Session
Follow methodology from `framework/methodology.md`. Track decisions as they happen.

### Session End (AUTOMATIC)

When the user signals the session is ending ("done", "let's wrap up", "bye", or completing DECIDE phase), **automatically update all context files without asking:**

1. **`context/next-session.md`** -- overwrite with what was done, what's next, open questions (follow the template format already in the file)
2. **`context/decisions.md`** -- append new rows for significant choices made this session (tech choices, architecture, strategy -- not routine details)
3. **`context/memory.md`** -- add new knowledge only if discovered (tech stack changes, conventions, lessons learned)
4. **Experiment `STATUS.md`** -- update phases and status if an experiment is active

Don't ask "should I update?" -- just do it and show a brief summary.

## Problem Solving (awrshift)

| Mode | Phases | Trigger |
|------|--------|---------|
| **Quick** | 3 (IDENTIFY -> IMPLEMENT -> TEST) | Known fix, low risk |
| **Standard** | 11 with 5 checkpoints | Unknown solution, needs research |
| **Scientific** | 13 with 6 checkpoints + hypothesis testing | Multiple viable options, high stakes |

When unsure, start Quick. Level up if unknowns emerge.

**Full methodology with phase details:** `framework/methodology.md`

## Experiment Auto-Setup

When the user asks to solve a task using the framework (any phrasing: "use awrshift for...", "let's solve X", "create experiment for...", or `/think`):

### Step 1: Ask the user to choose a mode (MANDATORY)

**ALWAYS use `AskUserQuestion` BEFORE creating anything.** Never pick a mode yourself.

```
Question: "How should we approach this?"
Header: "Mode"
Options:
  - label: "Quick (Recommended for known fixes)"
    description: "3 steps: Name the problem -> Build it -> Test it. For routine tasks where you already know the fix."
  - label: "Standard"
    description: "11 phases with 5 checkpoints. Research first, then build. For new features, complex bugs, architecture."
  - label: "Scientific"
    description: "13 phases with hypothesis testing. Compare multiple approaches with data. For high-stakes decisions."
```

The user can also type a custom answer -- respect it.

### Step 2: Create experiment folder

After the user selects a mode:

1. **Create experiment folder:**
   ```
   experiments/{short-name}/
     STATUS.md
     phases/
   ```
   Name: lowercase, hyphenated, descriptive (e.g., `database-migration`, `auth-redesign`)

2. **Create STATUS.md** based on `framework/experiment-template.md`
3. **Create phase files** as you complete each phase — write findings into `phases/01-identify.md`, `phases/02-research.md`, etc.
4. **Follow the methodology** from `framework/methodology.md`

**Phase file naming:**
```
phases/
  01-identify.md          # Problem definition
  02-formulate.md         # Research questions (if Standard/Scientific)
  03-research.md          # Findings
  04-hypothesize.md       # Hypotheses
  05-eval-design.md       # Success metrics
  06-plan.md              # Implementation plan
  07-verify.md            # Plan verification
  08-implement.md         # Implementation notes
  09-test.md              # Test results
  10-evaluate.md          # Evaluation against metrics
  11-decide.md            # Final decision
```

**Quick mode** — only `01-identify.md` needed (or skip files entirely for trivial fixes).

**Scientific mode** — adds per-hypothesis files: `06-plan-H1.md`, `06-plan-H2.md`, `10-compare.md`.

**Key rule:** Each phase's output goes into its file. This creates a reusable audit trail.

---

*awrshift v1.2 -- See /think command for quick activation, or just describe your task.*
