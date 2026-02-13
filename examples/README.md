# Examples

Real-world walkthroughs showing how AWRSHIFT works — from life decisions to technical architecture. Each example uses a different mode and shows exactly what the process looks like, including every checkpoint where you stay in control.

## Life Decisions

Everyday decisions with long-term impact. No code, no jargon — just structured thinking.

| Example | Mode | Scenario | Key Takeaway |
|---------|------|----------|--------------|
| [Choosing a School](life/choosing-a-school.md) | Scientific | Evaluating 3 elementary schools with weighted criteria | Same metrics applied to every option. The kid's reaction during shadow days mattered as much as test scores. |
| [Planning a Move](life/planning-a-move.md) | Standard | Relocating a family from Austin to Denver in 12 weeks | The scout trip collapsed uncertainty into one 3-day trip and made everything else a logistics exercise. |
| [Hiring a Candidate](life/hiring-a-candidate.md) | Standard | Hiring a senior developer for a startup in 6 weeks | The structured process caught a "gut feeling" hire that would have failed on a critical requirement. Blind take-home scoring flipped assumptions. |

## Business Decisions

Strategy, product, and growth decisions where money and reputation are on the line.

| Example | Mode | Scenario | Key Takeaway |
|---------|------|----------|--------------|
| [GTM Strategy for Europe](business/gtm-strategy-europe.md) | Scientific | Three go-to-market approaches for entering Europe | A regulatory advantage nobody expected changes the "obvious" winner. Flagship example. |
| [Product Launch](business/product-launch.md) | Standard | Building a SaaS notification system | 5 checkpoints caught a security gap in the plan. Research-backed metrics set realistic targets. |
| [Marketing Strategy](business/marketing-strategy.md) | Standard | Planning Q3 marketing with a $50K budget | Research killed the "just run Facebook ads" instinct. That one insight redirected $15K toward channels that actually convert for B2B. |

## Technical Decisions

Architecture and engineering decisions where the wrong choice costs months.

| Example | Mode | Scenario | Key Takeaway |
|---------|------|----------|--------------|
| [Architecture Decision](technical/architecture-decision.md) | Scientific | Choosing between ClickHouse, DuckDB, and BigQuery for analytics | Three databases tested with identical metrics. DuckDB won on data, not opinions. Migration path to ClickHouse built in from day one. |
| [Bug Investigation](technical/bug-investigation.md) | Quick -> Standard | Debugging intermittent file upload failures | Quick fix failed. Upgrading to Standard mode found the root cause: a "cleanup refactor" had silently replaced streaming with buffering. |

## Modes at a Glance

| Mode | When to use | Phases | Examples |
|------|------------|--------|----------|
| **Quick** | Known fix, low risk, just try it | 3 | [Bug Investigation](technical/bug-investigation.md) (starting point) |
| **Standard** | Most decisions — features, plans, hires | 11 | [Planning a Move](life/planning-a-move.md), [Product Launch](business/product-launch.md), [Hiring](life/hiring-a-candidate.md), [Marketing](business/marketing-strategy.md) |
| **Scientific** | High stakes, multiple options, no clear winner | 13 | [GTM Strategy](business/gtm-strategy-europe.md), [Choosing a School](life/choosing-a-school.md), [Architecture](technical/architecture-decision.md) |

## How to Read These Examples

1. **Start with your world.** If you're non-technical, start with [Choosing a School](life/choosing-a-school.md) or [Planning a Move](life/planning-a-move.md). If you're a builder, start with [Product Launch](business/product-launch.md) or [Bug Investigation](technical/bug-investigation.md).

2. **Notice the checkpoints.** Every example has moments marked "Checkpoint" where the human reviews, adjusts, and approves. That's the core of AWRSHIFT — AI does the work, you make the calls.

3. **Watch for the "aha" moment.** In every example, there's a point where the structured process catches something that gut instinct would have missed. That's why the method exists.

## File Structure

```
examples/
├── README.md                          ← You are here
├── life/
│   ├── choosing-a-school.md           (Scientific mode)
│   ├── planning-a-move.md             (Standard mode)
│   └── hiring-a-candidate.md          (Standard mode)
├── business/
│   ├── gtm-strategy-europe.md         (Scientific mode) ★ flagship
│   ├── product-launch.md              (Standard mode)
│   └── marketing-strategy.md          (Standard mode)
└── technical/
    ├── architecture-decision.md       (Scientific mode)
    └── bug-investigation.md           (Quick → Standard mode)
```
