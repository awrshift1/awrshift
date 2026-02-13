Activate the AWRSHIFT problem-solving framework.

## Step 1: Assess complexity

Use AskUserQuestion to confirm mode with the user:

Question: "What type of problem is this?"
Options:
- "Quick — I know the fix, just need a safety net (IDENTIFY → IMPLEMENT → TEST)" (Recommended for routine tasks)
- "Standard — I need research before acting (11 phases: Name the problem → Find the evidence → Set the bar → Build it → Ship)" (Features, architecture, complex bugs)
- "Scientific — Multiple viable options, need data to pick the best (+ hypothesis loop → Pick the winner)" (High-stakes decisions)

## Step 2: Execute the selected mode

### If Quick:
1. IDENTIFY (Name the problem) — state in one sentence (Problem / Fix / Risk)
2. IMPLEMENT (Build it) — apply the fix
3. TEST (Run the checks) — verify it works
4. Done — no task tracking needed

### If Standard:
1. Create ALL phase tasks upfront using TaskCreate with addBlockedBy dependencies:
   - IDENTIFY (Name the problem) → FORMULATE (Ask the right questions, inline) → RESEARCH (Find the evidence, parallel) → COMPILE → HYPOTHESIZE (Pick your best guess)
   - → EVAL-DESIGN (Set the bar) — research how to measure success → EVAL-COMPILE
   - → PLAN (Map it out) → VERIFY (Fact-check the plan) → IMPLEMENT (Build it) → TEST (Run the checks) → EVALUATE (Score against the bar) → DECIDE (Ship, iterate, or rollback)
   - FORMULATE phase happens inline via AskUserQuestion (no task)
2. Start IDENTIFY (Name the problem): read relevant files, define problem/current/target/gap/unknowns
3. FORMULATE (Ask the right questions): use AskUserQuestion to present research questions — user validates
4. RESEARCH (Find the evidence): launch parallel research tracks via Task(run_in_background=true)
5. At every checkpoint (FORMULATE, HYPOTHESIZE, EVAL-DESIGN, PLAN, DECIDE), use AskUserQuestion with structured options and wait for approval
6. PLAN (Map it out): use EnterPlanMode → explore codebase → write plan → ExitPlanMode
7. VERIFY (Fact-check the plan) must PASS before IMPLEMENT can start

### If Scientific:
Same as Standard through EVAL-DESIGN (Set the bar), then:
1. Create hypothesis loop tasks: H1-PLAN (Map it out) → H1-VERIFY (Fact-check) → H1-IMPLEMENT (Build it) → H1-TEST (Run checks) → H1-EVALUATE (Score), then H2 loop (blockedBy H1-EVALUATE), etc.
2. Test hypotheses sequentially — learnings from H1 inform H2
3. Same evaluation criteria for all hypotheses
4. COMPARE (Pick the winner): present data table via AskUserQuestion — user picks winner
5. DECIDE (Ship, iterate, or rollback): ship winner, iterate, or rollback

## Leveling Up
If Quick reveals unknowns → level up to Standard (create tasks mid-session).
If Standard HYPOTHESIZE reveals multiple viable options -> level up to Scientific.

The task to analyze: $ARGUMENTS
