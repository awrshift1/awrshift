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

.claude/
  commands/think.md         # /think command (entry point)
  rules/awshift-phases.md   # Phase enforcement rules (auto-loaded)
```

## Reference Documentation

**Read BEFORE working:**

| Topic | Location |
|-------|----------|
| Full Methodology | `framework/methodology.md` (3 modes, 11-13 phases, checkpoints) |
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

1. **Start** -- Read all `context/` files to restore state
2. **During** -- Follow methodology from `framework/methodology.md`
3. **End** -- Update `context/next-session.md` + `context/decisions.md` + `context/memory.md` if needed

## Problem Solving (awrshift)

| Mode | Phases | Trigger |
|------|--------|---------|
| **Quick** | 3 (IDENTIFY -> IMPLEMENT -> TEST) | Known fix, low risk |
| **Standard** | 11 with 5 checkpoints | Unknown solution, needs research |
| **Scientific** | 13 with 6 checkpoints + hypothesis testing | Multiple viable options, high stakes |

When unsure, start Quick. Level up if unknowns emerge.

**Full methodology with phase details:** `framework/methodology.md`

---

*awrshift v1.2 -- See /think command for quick activation.*
