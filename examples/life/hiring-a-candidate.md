# Example: Hiring a Candidate — Standard Mode

**Scenario:** You're the CTO of a 12-person startup. Your lead backend developer just gave two weeks' notice. You need a senior developer who can own the API layer, mentor two juniors, and ship without hand-holding. Budget: $140-170K. Timeline: hire within 6 weeks or the product roadmap slips.

**Outcome:** Hired a senior developer in 5 weeks. The structured process caught a "gut feeling" hire that would have failed on a critical requirement. The person who got the offer wasn't the most impressive on paper — but scored highest where it mattered.

---

## Phase 1: IDENTIFY (Name the problem)

```
Problem:  Lead backend dev leaving in 2 weeks. No one else can own the API layer.
Current:  Two junior devs can maintain existing code but can't architect new features.
Target:   Senior developer hired who can lead backend work independently.
Gap:      No candidates in pipeline. No job posting. No interview process defined.
Unknowns: Market rate for this role in our city, realistic timeline to hire,
          whether $140-170K is competitive enough.
```

## Phase 2: FORMULATE (Ask the right questions) -- Checkpoint

Research questions:

1. **Market:** What's the current salary range for senior backend developers in our stack (Node.js/PostgreSQL) in Austin?
2. **Channels:** Where do senior developers actually look for startup jobs? (LinkedIn, Hacker News, referrals, recruiters?)
3. **Timeline:** What's the realistic hiring timeline for a senior role? Can we do it in 6 weeks?
4. **Process:** What interview process do successful startups our size use? How many rounds?
5. **Retention:** What do senior devs care about beyond salary? (equity, flexibility, tech stack, autonomy?)

You review: "Good. Add a question about contractor-to-hire as a backup plan — if we can't find someone in 6 weeks, can we bridge the gap?"

Updated to 6 research questions.

## Phase 3: RESEARCH (Find the evidence)

Key findings:

- **Market rate:** Senior backend (Node.js) in Austin: $145-180K base. Startups typically offer lower base + 0.1-0.5% equity. $140K is the floor — $160K+ to be competitive.
- **Channels:** Referrals = fastest (avg 29 days). LinkedIn active sourcing = 2nd. Job boards = slowest. Recruiters charge 20-25% of first-year salary ($30K+).
- **Timeline:** Average time-to-hire for senior roles: 36 days. Startups move faster (25-30 days) if process is tight. Six weeks is doable.
- **Process:** Best practice for startups: resume screen -> 30-min phone screen -> take-home (2-3 hours) -> onsite (half day, 3 interviews). Four stages, one week each.
- **Retention factors:** #1 autonomy, #2 meaningful work, #3 flexible schedule, #4 equity upside, #5 team quality. Salary is table stakes, not a differentiator.
- **Contractor bridge:** Possible via Toptal or Gun.io. $100-150/hr. Good for 4-8 week gaps. Not a replacement for a full hire.

## Phase 4: HYPOTHESIZE (Pick your best guess) -- Checkpoint

```
H1: If we run a focused 4-week hiring sprint using referrals + LinkedIn
    sourcing + one job board, then we'll have a signed offer by Week 5,
    because a tight process with fast feedback loops attracts senior
    candidates who hate slow-moving companies.
```

One clear approach. Standard mode.

You approve: "Makes sense. If we don't have a strong candidate by Week 4, we activate the contractor bridge."

## Phase 5: EVAL-DESIGN (Set the bar) -- Checkpoint

| # | Metric | Threshold | Why |
|---|--------|-----------|-----|
| 1 | Technical skill | Passes take-home + live coding (7/10 minimum) | Must own the API layer from day one |
| 2 | System design ability | Can propose architecture for a real problem we're solving | Needs to lead, not just execute |
| 3 | Mentorship signal | Shows evidence of helping others grow (code reviews, docs, patience) | Two juniors need guidance |
| 4 | Culture fit | Team gives thumbs-up after onsite lunch | Small team, one bad fit poisons everything |
| 5 | Compensation fit | Accepts within $140-170K + 0.25% equity | Budget is real |

**Pass rule:** Must pass all 5. No exceptions on technical skill or mentorship — those are the reasons we're hiring.

You approve: "Hard agree on the mentorship one. Our juniors need someone who teaches, not someone who just ships fast."

## Phase 6: PLAN (Map it out) -- Checkpoint

```
Week 1:  SOURCING
         - Post on LinkedIn, Hacker News (Who's Hiring), and one niche board
         - Ask every team member for 2 referrals (offer $2K referral bonus)
         - Directly message 20 senior devs from open source projects in our stack
         - Set up structured scorecard for resume screening

Week 2:  SCREENING
         - Phone screens: 30 min each, focus on motivation and experience
         - Target: 8-10 phone screens from 30+ applications
         - Send take-home to top 5 (2-3 hour project: build a small API with our stack)
         - Deadline: 5 days for take-home submission

Week 3:  DEEP EVALUATION
         - Review take-homes using blind scoring (hide names)
         - Onsite interviews for top 3: system design (45 min), pair programming (45 min),
           team lunch (1 hour), founder chat (30 min)
         - Collect structured feedback from every interviewer within 24 hours

Week 4:  DECISION
         - Score all candidates against the 5 metrics
         - Reference checks for top 1-2 (ask: "Would you hire them again?")
         - Make offer within 48 hours of decision
         - Give candidate 5 days to decide (no pressure, but clear deadline)

Week 5:  CLOSE
         - Negotiate if needed (equity flex, start date, remote days)
         - Signed offer
         - Start onboarding doc prep

Week 6:  BUFFER / CONTRACTOR BRIDGE
         - If no hire: activate contractor via Toptal for 6-week engagement
         - Continue sourcing in parallel
```

Backup plan: If zero strong candidates by Week 3 onsite stage, raise budget to $180K and engage a recruiter. Cost: $35K+ but faster than starting over.

## Phase 7: VERIFY (Fact-check the plan)

- [x] Timeline realistic? 20 direct messages + referrals + job boards should yield 30+ applications in Week 1. Yes.
- [x] Take-home fair? 2-3 hours is industry-standard for senior roles. Checked with two dev friends — they'd do it.
- [x] Budget competitive? $160K + 0.25% equity is mid-market for Austin. Yes.
- [x] Scorecard avoids bias? Blind take-home review. Structured questions. Written feedback before group discussion. Yes.
- [x] Backup plan works? Toptal can match a contractor in 48 hours. Verified with their site. Yes.

**Verdict: PASS**

## Phase 8: IMPLEMENT (Execute the sprint)

Week 1: 34 applications received. 8 referrals, 12 from LinkedIn, 14 from job boards. Team referrals were strongest quality-wise.

Week 2: 9 phone screens conducted. 5 take-homes sent. 4 returned on time (one ghosted).

Week 3: Blind take-home scoring produced a surprise: Candidate D, who had the least impressive resume, wrote the cleanest code with the best tests. Candidate A, the "obvious" pick with 10 years at a FAANG company, submitted code with no error handling and no tests.

Three onsites scheduled. Results:

| Candidate | Technical (7/10 min) | System Design | Mentorship Signal | Culture | Comp Fit |
|-----------|---------------------|---------------|-------------------|---------|----------|
| A (FAANG) | 8/10 | Strong | Weak — "I prefer to work alone" | Mixed | Yes |
| C (Startup) | 7/10 | Good | Good — brought up code review practices | Yes | Yes |
| D (Self-taught) | 9/10 | Strong | Strong — already mentoring at current job, showed examples | Yes | $165K ask |

## Phase 9: TEST (Check against the bar)

| Metric | Candidate A | Candidate C | Candidate D |
|--------|-------------|-------------|-------------|
| Technical skill (>=7/10) | 8 -- pass | 7 -- pass | 9 -- pass |
| System design | Pass | Pass | Pass |
| Mentorship signal | **Fail** | Pass | Pass |
| Culture fit | Mixed | Pass | Pass |
| Comp fit ($140-170K) | Pass | Pass | $165K -- pass |

Candidate A fails on mentorship. "I prefer to work alone" is a disqualifier when you have two juniors who need daily guidance.

## Phase 10: EVALUATE (Score against the bar)

| # | Metric | C: Startup | D: Self-taught |
|---|--------|------------|----------------|
| 1 | Technical | 7/10 | 9/10 |
| 2 | System design | Good | Strong |
| 3 | Mentorship | Good | Strong (proven) |
| 4 | Culture fit | Yes | Yes |
| 5 | Comp fit | $155K | $165K |
| **Total** | **Solid** | **Winner** |

Candidate D wins on technical skill and mentorship — the two things that matter most.

Reference checks: Former manager said, "Best developer I've managed. Juniors loved working with her. She left because she wanted more ownership, not more money."

## Phase 11: DECIDE (Ship, iterate, or rollback) -- Checkpoint

**Outcome: SUCCESS — Offer extended to Candidate D at $165K + 0.25% equity.**

Offer accepted on Day 3. Start date: two weeks out. Contractor bridge not needed.

The key insight: without the structured process, we would have hired Candidate A. FAANG resume, strong technical interview, easy choice. But the mentorship metric — which we almost didn't include — revealed the real gap. A brilliant developer who "prefers to work alone" is the wrong hire when your two juniors need someone who teaches.

The take-home assignment with blind scoring also flipped our assumptions. The least impressive resume produced the best code. Structured evaluation catches what gut feeling misses.

---

*This example shows Standard mode for a hiring decision — define what matters before you start looking, score against it honestly, and let the data override your assumptions.*
