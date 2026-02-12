# How to Give Your AI a Memory

Every time you start a new conversation with an AI coding tool, it has no idea who you are, what your project does, or what you decided yesterday. It starts from absolute zero. This guide fixes that.

---

## The Problem

AI tools like Claude Code, Cursor, Windsurf, and ChatGPT don't remember previous conversations. Each session opens with a blank slate. That means you spend the first 15 minutes of every session re-explaining your project, your preferences, and your past decisions. Worse, the AI might suggest something you already tried and rejected last week. This is the #1 frustration people have with AI coding tools.

## The Solution: Three Files

You solve this with three plain text files that live in your project folder. The AI reads them at the start of every session. Think of them as the AI's notebook:

1. **Memory File** (`MEMORY.md`) -- Everything the AI should always know. Permanent notes. Updated rarely.
2. **Session Handoff** (`next-session.md`) -- A note from today's AI to tomorrow's AI. "Here's what we did, here's what's next." Updated at the end of every session.
3. **Decision Log** (`decisions.md`) -- A list of every decision made in the project. Prevents the AI from re-debating things you already settled.

Together, these three files give your AI continuity. Not perfect memory -- but enough to pick up where you left off instead of starting from scratch.

---

## 1. Memory File (MEMORY.md)

### What It Is

A permanent reference document the AI reads at the beginning of every session. It contains confirmed facts about your project -- things that are true today and will probably be true next month.

### What to Save

- **Architecture decisions**: "We use PostgreSQL for storage, Redis for caching"
- **Project conventions**: "We use 2-space indentation in Python"
- **Key file locations**: "Main config is at `src/config/settings.py`"
- **Confirmed patterns**: "API responses always go through `formatResponse()` before returning"
- **User preferences**: "I prefer detailed explanations" or "Keep responses short"
- **Lessons learned**: "Never update the database schema without running migrations first -- we broke production in March"
- **Important numbers**: "Our API rate limit is 100 requests/minute"

### What NOT to Save

- Temporary state ("Currently debugging the login page") -- that goes in Session Handoff
- Unverified ideas ("Maybe we should switch to MongoDB") -- that's not a fact yet
- Session-specific details ("Today we fixed 3 bugs") -- too granular
- Anything that changes weekly -- keep Memory for stable facts only

### How to Maintain It

Add new entries when you discover something important. Delete entries when they stop being true. Review it once a month and remove anything outdated. A lean, accurate Memory file is better than a long, stale one.

### Template

```markdown
# MEMORY.md

## Project Overview
- [One sentence: what this project does]
- [Tech stack: language, framework, database]
- [Deployment: where it runs]

## Architecture
- [Key architectural decisions]
- [Important file/folder locations]
- [How major components connect]

## Conventions
- [Code style rules]
- [Naming conventions]
- [Testing approach]

## Lessons Learned
- [Things that broke and how to avoid repeating them]
- [Non-obvious patterns that save time]

## User Preferences
- [How you like to work with AI]
- [Communication style preferences]
```

---

## 2. Session Handoff (next-session.md)

### What It Is

A short note written at the end of each work session. It's addressed to the *next* AI session -- which might be tomorrow, or next week. The goal: make sure the next session can continue your work without asking "so where were we?"

### What to Include

- **What was done**: A summary of today's work. Not every detail -- just the key accomplishments.
- **What's next**: The most important tasks to pick up. Be specific. "Fix the login bug" is better than "keep working on auth."
- **Key decisions made**: Anything decided today that affects future work.
- **Open questions**: Things you ran into but didn't resolve. Problems you're still thinking about.

### How to Use It

At the end of each session, ask the AI: "Write a session handoff note." It will summarize what happened. Review it, adjust if needed, and save it. At the start of your next session, the AI reads this file and knows exactly where things stand.

This file gets **overwritten** each session -- it's always about the most recent work. Old session notes don't pile up.

### Template

```markdown
# Next Session

**Date:** 2026-02-12
**Focus:** [What this session was about]
**Status:** [One-line summary of where things stand]

---

## What Was Done
- [Accomplishment 1]
- [Accomplishment 2]
- [Accomplishment 3]

## What's Next
1. [Most important next task]
2. [Second priority]
3. [Third priority]

## Decisions Made
- [Decision and why it was made]

## Open Questions
- [Unresolved issue or question]
```

---

## 3. Decision Log (decisions.md)

### What It Is

A running list of every significant decision made in the project. This is the most underrated file of the three. Without it, the AI will cheerfully suggest approaches you already considered and rejected. With it, the AI knows: "We already decided to use REST instead of GraphQL, and here's why."

### What Counts as a Decision

- Choosing one approach over another ("Use Redis for caching instead of Memcached")
- Rejecting a suggestion ("Decided NOT to add WebSocket support -- too complex for V1")
- Changing a previous decision ("Switched from SQLite to PostgreSQL because of concurrent writes")
- Setting a standard ("All API endpoints must return JSON, no XML")

### Why This Matters

In a long-running project, you make hundreds of small decisions. Without a log, the AI has no way to know about them. It will ask the same questions. It will suggest the same rejected ideas. The decision log stops that loop.

### How to Maintain It

Add a new entry every time you make a choice that affects the project. Each entry gets a unique ID (just count up: D001, D002, D003...). Include the date and a brief explanation of what was decided and why. Mark decisions as active, changed, or rejected.

### Template

```markdown
# Decision Log

Decisions made in this project. Once decided, don't re-discuss unless status changes to "Reviewing."

| ID | Date | Decision | Status |
|----|------|----------|--------|
| D001 | 2026-02-12 | Use PostgreSQL instead of MongoDB -- need relational queries for reporting | Active |
| D002 | 2026-02-12 | API uses REST, not GraphQL -- simpler for our 3-person team | Active |
| D003 | 2026-02-13 | Cache user sessions in Redis with 24h TTL | Active |
| D004 | 2026-02-15 | Switched from Jest to Vitest -- 3x faster test runs | Active |
| D005 | 2026-02-15 | Rejected adding WebSocket support for V1 -- revisit in V2 | Rejected |
```

---

## Quick Setup

**Time needed: 5 minutes.**

### Step 1: Create the files

In your project's root folder, create three files:

```
your-project/
  MEMORY.md
  next-session.md
  decisions.md
```

### Step 2: Fill in the basics

Open `MEMORY.md` and write 3-5 bullet points about your project. What it does, what tech you use, any important conventions. Don't overthink it -- you'll add more over time.

Leave `next-session.md` empty for now. You'll fill it at the end of your first session.

Start `decisions.md` with the table header and one or two decisions you've already made.

### Step 3: Tell the AI to read them

At the start of each session, say:

> "Read MEMORY.md, next-session.md, and decisions.md before we begin."

Some tools (Claude Code, Cursor) can be configured to read these files automatically. Check your tool's documentation for "project instructions" or "context files."

### Step 4: Update at session end

Before closing each session, say:

> "Update the session handoff note in next-session.md."

If you made any important decisions during the session, add them to `decisions.md`. If you discovered something permanent (a lesson learned, a new convention), add it to `MEMORY.md`.

That's it. Three files. Five minutes of setup. And your AI stops forgetting everything overnight.

---

## How These Files Work Together

Here's a typical workflow after setup:

**Monday morning.** You start a new session. The AI reads all three files. From `MEMORY.md`, it knows your project uses Next.js with PostgreSQL and you prefer TypeScript. From `next-session.md`, it knows you were working on the payment integration and the Stripe webhook still needs error handling. From `decisions.md`, it knows you chose Stripe over PayPal (decision D012) and decided to store payment records in a separate table (decision D015).

Without saying a word about context, you can just type: "Let's finish the webhook error handling." And the AI knows exactly what you mean.

**Monday evening.** Before you close the session, the AI writes a new handoff note. You made two decisions today (added to the log). You discovered that Stripe's test mode has a different webhook secret (added to Memory). Tomorrow's session will start right where today's ended.

---

## Tips from 650+ Sessions

These patterns come from a real project that has been using this system across hundreds of AI sessions:

1. **Keep Memory lean.** A 50-line Memory file that's 100% accurate beats a 500-line file that's 70% accurate. Wrong information is worse than no information.

2. **Decision Log prevents loops.** The single biggest time-saver. Without it, you will have the same architectural debate with the AI every few weeks.

3. **Session Handoff is cheap insurance.** It takes 30 seconds to generate. It saves 15 minutes of context-setting at the start of the next session.

4. **Review and prune.** Once a month, scan your Memory file. Delete anything that's no longer true. Move completed items out of the Decision Log into an archive section.

5. **Be specific in handoffs.** "Fix the bug" is useless. "Fix the null pointer in `calculateTotal()` when cart is empty -- see error in `logs/2026-02-11.txt`" lets the next session start immediately.

6. **Don't store temporary state in Memory.** "Currently debugging X" belongs in Session Handoff, not Memory. Memory is for facts that stay true across sessions.

7. **Archive old decisions.** When your Decision Log hits 50+ entries, move older ones to an archive section. Keep the main table focused on recent and active decisions.
