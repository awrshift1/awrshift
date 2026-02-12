<h1 align="center">
  <a href="https://github.com/awrshift1/awrshift">
    <img alt="awrshift" src="media/hero-banner.png" width="100%">
  </a>
</h1>

<p align="center">
  <strong>A decision-making method that teaches AI to research before building.<br>5 checkpoints. You stay in control.</strong>
</p>

<p align="center">
  <sub><b>Awareness Shift</b> -- from chatting to deciding</sub>
</p>

<p align="center">
  <a href="https://github.com/awrshift1/awrshift/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue?style=flat-square" alt="MIT License">
  </a>
  <a href="https://github.com/awrshift1/awrshift">
    <img src="https://img.shields.io/badge/dependencies-0-brightgreen?style=flat-square" alt="0 Dependencies">
  </a>
  <a href="https://github.com/awrshift1/awrshift">
    <img src="https://img.shields.io/badge/Works%20with-Claude-d4a27f?style=flat-square&logo=anthropic" alt="Works with Claude">
  </a>
  <a href="https://github.com/awrshift1/awrshift">
    <img src="https://img.shields.io/badge/Works%20with-ChatGPT-10a37f?style=flat-square&logo=openai" alt="Works with ChatGPT">
  </a>
  <a href="https://github.com/awrshift1/awrshift">
    <img src="https://img.shields.io/badge/Works%20with-Gemini-4285f4?style=flat-square&logo=google" alt="Works with Gemini">
  </a>
  <a href="https://github.com/awrshift1/awrshift/stargazers">
    <img src="https://img.shields.io/github/stars/awrshift1/awrshift?style=flat-square&logo=github&label=Stars" alt="GitHub Stars">
  </a>
</p>

---

## Start in 30 Seconds

Pick whichever path matches how you use AI.

### Path A: On the web (Claude, ChatGPT, Gemini)

Copy the [awrshift prompt](framework/prompt.md) into any AI conversation. Paste it as the first message in a new chat, or add it to your custom instructions / system prompt settings.

Here's a taste of what the prompt tells your AI:

```
You follow the awrshift methodology -- Awareness Shift.

Core principle: research before building. Never jump to a solution
without understanding the problem first.

For every task:
1. UNDERSTAND -- Restate the problem. Ask clarifying questions.
2. PLAN -- Propose your approach with trade-offs. Wait for approval.
3. BUILD & CHECK -- Implement. Test. Report what worked and what didn't.

Always wait for user approval after steps 1 and 2. Never skip ahead.
```

That's the Quick mode version. The [full prompt](framework/prompt.md) includes Standard and Scientific modes too.

**Works with:** Claude.ai, ChatGPT, Gemini, Copilot, or any chat-based AI tool.

### Path B: Claude Code or Windsurf

If you use a coding AI in the terminal, awrshift integrates directly into your project:

```bash
git clone https://github.com/awrshift1/awrshift.git
cp -r awrshift/claude-code/.claude ./
cp awrshift/claude-code/CLAUDE.md ./
```

Then start a session and type `/think`. Your AI will follow the full awrshift method -- identifying the problem, researching, proposing a plan, and waiting for your approval before building anything.

The `/think` command automatically picks the right mode (Quick, Standard, or Scientific) based on the complexity of your task.

**What happens after setup:** Your AI reads the rules at the start of each session. It knows to pause at checkpoints, ask for your approval, and never skip research. You don't need to remind it -- the rules enforce the method automatically.

---

## What Is awrshift?

AI is powerful but reckless. It skips research, invents facts, and builds the wrong thing with absolute confidence.

awrshift fixes that. It's a method you can use with any AI tool -- Claude, ChatGPT, Gemini, Cursor, Windsurf -- that adds **five human decision points** to every task. Your AI investigates before it acts. You review before it continues.

The result: decisions you actually trust, built on research instead of guesswork.

Here's the difference:

> **Without awrshift:** You ask a question. The AI gives you an answer in 3 seconds. You have no idea if it's good. You use it anyway. Sometimes it works. Sometimes you waste an entire day fixing what the AI confidently got wrong.
>
> **With awrshift:** You describe a problem. The AI researches it, shows you what it found, proposes options with trade-offs, and waits for your "go ahead" before doing anything. You make decisions based on evidence, not vibes.

The method is simple:
- **AI proposes, you decide.** At every checkpoint, the AI shows its work and waits.
- **Research before building.** No more jumping straight to an answer.
- **Evidence over assumptions.** If the AI doesn't know something, it says so instead of guessing.
- **Start simple, level up when needed.** Most tasks only need 3 steps. Complex ones get 11.

No special tools. No technical knowledge. Works with whatever AI you're already using.

Battle-tested on **650+ real AI sessions** across life decisions, business strategy, and software engineering.

---

## Three Modes

Not every problem needs the same process. A typo fix doesn't need three rounds of research. Choosing a go-to-market strategy for a new market does.

awrshift has three modes. Start with Quick. Level up when the problem demands it.

| Quick | | Standard | | Scientific |
|:---:|:---:|:---:|:---:|:---:|
| **3 steps** | → | **11 phases · 5 checkpoints** | → | **13 phases · 6 checkpoints** |
| Known problems, routine tasks | *Level up* | New features, complex problems | *Level up* | High-stakes, multiple options |

### Quick Mode -- 3 steps

**80% of problems get solved here.**

You know the problem. You know the fix. The AI doesn't need to research anything -- it just needs to execute cleanly.

```
1. IDENTIFY   -- State the problem in one sentence
2. IMPLEMENT  -- Make the change. Keep it minimal.
3. TEST       -- Verify it works. Done.
```

No checkpoints, no research phases. Just identify, fix, confirm.

**Example:** "The login button returns a 404 after the last deploy. The route was renamed -- update the endpoint." Identify, implement, test. Three minutes.

**When to level up:** If the fix doesn't work, the root cause is unclear, there are multiple possible solutions, or you find yourself guessing -- switch to Standard. Leveling up isn't failure. It means the problem is harder than it looked.

[Read the full Quick Mode guide ->](framework/quick-mode.md)

---

### Standard Mode -- 11 phases, 5 checkpoints

**When the problem is complex and the answer isn't obvious.**

Your AI breaks the work into four stages. At five points during the process, it stops and waits for your approval before continuing.

```
UNDERSTAND                         DEFINE
  Identify the problem               Form a hypothesis
  Formulate research questions  *    Design success criteria  * *
  Research with real sources

BUILD                              CHECK
  Plan the approach  *               Test the result
  Verify the plan                    Evaluate against criteria
  Implement                          Final decision  *

                                   * = checkpoint (AI pauses, you approve)
```

**The key insight:** Notice "Design success criteria" happens *before* building. You define what "good" looks like first, so you're not making up the finish line after the race. This one phase -- designing evaluation criteria upfront -- prevents more wasted work than everything else combined.

Each checkpoint is a moment where you look at what the AI found, ask questions, push back, or change direction. The AI can't skip ahead. You're always in the loop.

**Good for:** New features, architecture decisions, complex bugs, business strategy, planning a move to a new city, evaluating a job offer.

**Example:** "Should we build the notification system with email, push notifications, or both?" Standard mode researches user preferences, cost per notification, delivery rates, then forms a hypothesis, defines what success looks like, and builds a plan -- with your approval at every step.

[Read the full Standard Mode guide ->](framework/standard-mode.md)

---

### Scientific Mode -- 13 phases, 6 checkpoints

**When the stakes are high and you need proof, not just a plan.**

Scientific mode is Standard mode with one crucial addition: instead of picking one approach and hoping it works, your AI tests **multiple competing options** using identical evaluation criteria.

Think of it like a blind taste test. Three options, same scoring system, data picks the winner. You make the final call.

The process adds two extra phases:
- **Multiple hypotheses** -- Instead of one plan, the AI develops 2-3 alternatives (H1, H2, H3)
- **Compare** -- After testing all options against the same criteria, the AI presents a side-by-side comparison with evidence for each

**Good for:** Go-to-market strategy, selecting a technology stack, comparing vendors, hiring decisions -- any situation where "good enough" isn't good enough and you want evidence that you picked the best option.

**Example:** "Which go-to-market strategy is best for entering Europe?" Scientific mode tests all three approaches (content-led, partner channel, paid acquisition), evaluates them against the same 6 metrics, and presents a comparison table. A regulatory advantage nobody expected changes the "obvious" winner. [See the full example.](examples/business/gtm-strategy-europe.md)

[Read the full Scientific Mode guide ->](framework/scientific-mode.md)

---

### How to Choose a Mode

| Signal | Mode |
|--------|------|
| "I know exactly what to do" | Quick |
| "I have a rough idea but need research" | Standard |
| "I have multiple good options and need to compare" | Scientific |
| "I started Quick but it's getting complicated" | Level up to Standard |
| "Standard gave me one answer but I want to compare alternatives" | Level up to Scientific |

You can always start with Quick and level up. Most people do. The framework is designed for this -- leveling up is a feature, not a detour.

---

## See It in Action

Real examples showing awrshift from start to finish. Each one walks through the full process -- the problem, the research, the checkpoints, and the final decision.

### Life decisions

These are the examples that surprise people. awrshift isn't just for code -- it works for any decision that benefits from structured thinking.

| Example | Mode | What you'll see |
|---------|------|-----------------|
| [Planning a move](examples/life/planning-a-move.md) | Standard | Relocating to a new city. AI researches cost of living, job markets, and neighborhoods. Produces a structured decision you can actually act on. |
| [Hiring a candidate](examples/life/hiring-a-candidate.md) | Standard | Hiring a senior dev for a startup. Gut feeling says one candidate, data says another. The research phase catches what interviews missed. |
| [Choosing a school](examples/life/choosing-a-school.md) | Scientific | Three schools compared with weighted criteria. Research uncovers facts parents usually miss. |

### Business decisions

| Example | Mode | What you'll see |
|---------|------|-----------------|
| [GTM strategy for Europe](examples/business/gtm-strategy-europe.md) | Scientific | Three go-to-market approaches tested with real metrics. A regulatory advantage nobody expected changes the "obvious" winner. Our flagship example -- start here. |
| [Product launch](examples/business/product-launch.md) | Standard | Feature prioritization for a notification system. Trade-offs backed by evidence instead of gut feelings. |
| [Marketing strategy](examples/business/marketing-strategy.md) | Standard | $50K quarterly budget allocation across channels. Research kills the "just run Facebook ads" instinct. |

### Technical decisions

| Example | Mode | What you'll see |
|---------|------|-----------------|
| [Architecture decision](examples/technical/architecture-decision.md) | Scientific | Database selection with benchmarks, evaluation criteria, and a data-driven comparison between three options. |
| [Bug investigation](examples/technical/bug-investigation.md) | Quick -> Standard | Starts as a simple fix. Levels up when the root cause turns out to be deeper than expected. A clean demonstration of how leveling up works in practice. |

**Don't see your use case?** The method works for any decision. If you can describe the problem, awrshift can help you solve it. Want to add your own example? [Here's how.](#contribute)

---

## How It Compares

There are several frameworks for working with AI. Here's how awrshift is different.

| | awrshift | BMAD | Cursor Superpowers | Spec Kit |
|---|---------|------|-------------------|----------|
| **Before building** | 3 research phases | Role discussion | Jump to code | Write a spec |
| **Who decides** | You (5 checkpoints) | Team roles | You review | You review |
| **Success criteria** | Defined before building | Not formalized | Not formalized | In the spec |
| **Beyond code** | Yes -- life, business, tech | No -- software only | No -- software only | No -- software only |
| **Prerequisites** | None. Any AI tool. | Cursor-specific roles | Cursor-specific | IDE-specific |

The biggest difference: awrshift is the only method designed for **decisions beyond software**. The same framework that helps you pick a database also helps you choose a go-to-market strategy, plan a product launch, or evaluate a hiring decision.

Other frameworks optimize how AI writes code. awrshift optimizes how you *think with* AI.

**A note on "beyond code":** This matters more than it seems. Decision-making is a universal skill. Once you learn to add research phases and checkpoints to AI-assisted coding, you start doing it everywhere -- choosing vendors, planning projects, evaluating strategies. That's the awareness shift.

[Full comparison with detailed analysis ->](docs/comparison.md)

---

## Give Your AI a Memory

The #1 frustration with AI tools: **they forget everything between sessions.**

You explain your project on Monday. By Wednesday, the AI has no idea what you're talking about. You spend the first 15 minutes of every session re-explaining context. Worse, the AI suggests approaches you already tried and rejected last week. It's like working with a brilliant colleague who gets complete amnesia overnight.

The fix is embarrassingly simple. Three plain text files that live in your project folder. The AI reads them at the start of every session:

```
your-project/
  MEMORY.md          -- Permanent facts. Updated rarely.
  next-session.md    -- Handoff note. Updated every session.
  decisions.md       -- Decision log. Updated when choices are made.
```

**`MEMORY.md`** -- What the AI should always know. Your tech stack, your conventions, lessons learned, important file paths. Think of it as the AI's long-term memory. You update it when you discover something important. Review it once a month and remove anything that's no longer true.

**`next-session.md`** -- A note from today's AI to tomorrow's AI. "Here's what we did, here's what's next, here's what to watch out for." Gets overwritten each session. Takes 30 seconds to generate, saves 15 minutes of context-setting every morning.

**`decisions.md`** -- Every significant decision made in the project, with a short "why." This is the most underrated file. Without it, your AI will cheerfully suggest approaches you already considered and rejected. With it, the AI knows: "We chose REST over GraphQL because our team is small and simplicity matters more than flexibility right now."

Here's what this looks like in practice:

**Monday morning.** You start a new session. The AI reads all three files. From `MEMORY.md`, it knows your project uses Next.js with PostgreSQL and you prefer TypeScript. From `next-session.md`, it knows you were working on the payment integration and the Stripe webhook still needs error handling. From `decisions.md`, it knows you chose Stripe over PayPal (decision D012) and decided to store payment records in a separate table (decision D015).

Without saying a word about context, you just type: "Let's finish the webhook error handling." And the AI knows exactly what you mean.

**Monday evening.** Before you close the session, the AI writes a new handoff note. You made two decisions today (added to the log). You discovered that Stripe's test mode has a different webhook secret (added to Memory). Tomorrow's session will start right where today's ended.

Five minutes of setup. Your AI stops starting from scratch.

[Read the full Brain guide -- with templates, tips, and real examples from 650+ sessions ->](docs/brain.md)

---

## Why I Built This

I built awrshift after 650+ AI problem-solving sessions. Here's what I learned.

In the early days, I'd give AI a task and let it run. It would jump straight to building -- skipping research, ignoring edge cases, making confident-sounding decisions that turned out to be wrong. I'd spend hours fixing what it built instead of minutes guiding what it should build.

The pattern was always the same: **AI makes mistakes when it skips thinking and jumps to doing.**

So I started adding pauses. "Before you build anything, research this first." "Show me three options before you pick one." "Don't move forward until I say so."

Over hundreds of sessions, those pauses became checkpoints. The checkpoints became a method. The method became awrshift.

The core idea is embarrassingly simple: AI should research before it builds, and humans should approve before AI continues. Five moments in every task where you look at the work, ask questions, and decide what happens next.

It's not complicated. It's not a framework you need a week to learn. You paste a prompt into your AI and start working differently. The AI does the heavy lifting. You make the calls. And the decisions that come out the other end are ones you actually understand and trust -- because you were involved at every step.

It works with any AI tool you already use. No special software. No technical knowledge required. Just a better way to think *with* AI instead of hoping it thinks *for* you.

If you're curious about the technical validation: this method has been used across 650+ sessions of real software development, including a full content generation pipeline, architectural decisions, SEO optimization, and AI detection work. The three modes, the checkpoints, the leveling-up pattern -- all of it was refined through actual use, not theoretical design.

---

## What "Awareness Shift" Means

Most people treat AI like a search engine -- type a question, get an answer, move on. That works for simple lookups. It falls apart for anything that requires judgment.

**awrshift** is the moment you realize AI can be something more: a thinking partner that researches problems, proposes solutions, and waits for your approval before acting.

The name stands for **Awareness Shift** -- a shift in how you see your relationship with AI. You stop accepting whatever it gives you. You start directing how it works.

Same AI tool. Completely different results.

From chatting to deciding.

---

## Frequently Asked Questions

**"Does this actually work with ChatGPT / Gemini, or just Claude?"**

It works with any AI that can follow instructions. The core idea -- research before building, pause at checkpoints -- changes how any AI behaves. Claude Code users get the deepest integration (with `/think` and rules files), but the web prompt works with everything.

**"Isn't this just... prompting?"**

Yes, in the same way that a recipe is "just instructions." The value isn't in the technology -- it's in the structure. These specific checkpoints, in this specific order, produce consistently better outcomes than ad-hoc prompting. That's what 650+ sessions taught us.

**"Do I need to use all three modes?"**

No. Most people only use Quick mode. If you never need Standard or Scientific, that's great -- it means your problems are well-defined. The other modes exist for when you hit something genuinely hard.

**"I'm not a developer. Will this work for me?"**

Absolutely. The life and business examples (GTM strategy, marketing budget, hiring, planning a move) don't involve any code. awrshift is a thinking method, not a coding tool. If you can describe a problem to an AI, you can use awrshift.

**"What if I'm already using BMAD / Cursor Superpowers / another framework?"**

awrshift is complementary. Other frameworks focus on how AI writes code. awrshift focuses on how you make decisions *with* AI. You can use awrshift's thinking method alongside any coding framework.

---

## What's in This Repo

```
framework/
  awrshift.md           -- The complete methodology (all three modes)
  quick-mode.md        -- Quick mode in detail
  standard-mode.md     -- Standard mode in detail
  scientific-mode.md   -- Scientific mode in detail
  prompt.md            -- Copy-paste prompt for web AI tools

examples/
  life/
    planning-a-move.md     -- Standard mode (life decision)
    hiring-a-candidate.md  -- Standard mode (hiring decision)
    choosing-a-school.md   -- Scientific mode (life decision)
  business/
    gtm-strategy-europe.md -- Scientific mode (go-to-market) ★ flagship
    product-launch.md      -- Standard mode (business decision)
    marketing-strategy.md  -- Standard mode (marketing budget)
  technical/
    architecture-decision.md -- Scientific mode (technical decision)
    bug-investigation.md   -- Quick -> Standard (technical decision)

claude-code/           -- Ready-to-use setup for Claude Code / Windsurf
  CLAUDE.md            -- Project instructions
  .claude/commands/    -- The /think command
  .claude/rules/       -- Phase enforcement rules

docs/
  brain.md             -- Guide to giving your AI a memory
  comparison.md        -- Detailed comparison with other frameworks
```

Everything is plain markdown. No build step, no installation, no prerequisites. Read it, use it, adapt it.

---

## Share

Found awrshift useful? Help others discover it.

<p align="center">
  <a href="https://twitter.com/intent/tweet?text=awrshift%20%E2%80%94%20a%20decision-making%20methodology%20for%20AI.%20Research%20before%20building%2C%20human%20decides%20at%20every%20checkpoint.%20Check%20it%20out%3A%20https%3A%2F%2Fgithub.com%2Fawrshift%2Fawrshift&via=awrshift1" target="_blank">
    <img src="https://img.shields.io/badge/Share%20on-Twitter-1DA1F2?style=flat-square&logo=twitter&logoColor=white" alt="Share on Twitter">
  </a>
  <a href="https://www.linkedin.com/sharing/share-offsite/?url=https://github.com/awrshift1/awrshift" target="_blank">
    <img src="https://img.shields.io/badge/Share%20on-LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="Share on LinkedIn">
  </a>
  <a href="https://reddit.com/submit?url=https://github.com/awrshift1/awrshift&title=awrshift%20—%20Decision-Making%20Methodology%20for%20AI" target="_blank">
    <img src="https://img.shields.io/badge/Share%20on-Reddit-FF4500?style=flat-square&logo=reddit&logoColor=white" alt="Share on Reddit">
  </a>
  <a href="https://news.ycombinator.com/submitlink?u=https://github.com/awrshift1/awrshift&t=awrshift%20—%20Decision-Making%20Methodology%20for%20AI" target="_blank">
    <img src="https://img.shields.io/badge/Submit%20to-Hacker%20News-FF4500?style=flat-square&logo=y-combinator&logoColor=white" alt="Submit to Hacker News">
  </a>
</p>

---

## Contribute

awrshift gets better when people share how they use it. There's something for everyone, whether you've never made a pull request or you live in your terminal.

**Share your experience** -- [Open an issue](https://github.com/awrshift1/awrshift/issues) and tell us how awrshift worked for your use case. What went well? What was confusing? What would you change? This is the easiest and most valuable way to help.

**Add an example** -- Used awrshift for an interesting decision? Write it up and [submit a pull request](https://github.com/awrshift1/awrshift/blob/main/CONTRIBUTING.md) to the `examples/` folder. Life decisions, business decisions, technical decisions -- anything works. Real-world examples are the most valuable content in this repo.

**Improve the framework** -- Found a gap in the methodology? A phase that could be explained better? A checkpoint that feels unnecessary? PRs welcome. See the [contributing guide](CONTRIBUTING.md).

**Translate** -- awrshift should work in every language. If you'd like to translate the framework or examples into your language, [open an issue](https://github.com/awrshift1/awrshift/issues) and we'll coordinate.

### Contribution ideas

Not sure where to start? Here are some things that would make a real difference:

- A "choosing health insurance" example (Standard mode, life decision)
- A "hiring your first employee" example (Scientific mode, business decision)
- A "migrating from monolith to microservices" example (Scientific mode, technical decision)
- Translations into Spanish, Portuguese, German, Ukrainian, Japanese
- A "How I used awrshift for..." blog post (link it in an issue and we'll feature it)

---

## License

[MIT](LICENSE) -- Use it however you want. Build on it, adapt it, share it.

Attribution appreciated but not required. If awrshift helps you make better decisions, that's all the thanks we need.

---

<p align="center">
  <sub>Built by <a href="https://github.com/awrshift1">awrshift</a> -- battle-tested across 650+ AI problem-solving sessions.</sub>
</p>
<p align="center">
  <sub>Research first. Build right.</sub>
</p>
