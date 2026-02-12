# Contributing to AWShift

Thank you for your interest in improving AWShift. This guide explains how to contribute.

---

## Contribution Tiers

### Tier 1: Share Your Experience (Easy)

Share how you used AWShift. Open a [Use Case issue](../../issues/new?template=use-case.md) with:

- What problem you solved
- Which mode you used (Quick/Standard/Scientific)
- What worked and what didn't
- Any adaptations you made

No code required. Your experience helps others.

### Tier 2: Add an Example (Medium)

Create a new example in `examples/`. Follow the existing format:

1. Fork the repo
2. Create `examples/your-example.md`
3. Include: scenario, mode used, phase-by-phase walkthrough, outcome
4. Submit a PR

Good example topics:
- Domain-specific use cases (marketing, hiring, DevOps)
- Platform-specific adaptations (ChatGPT, Gemini, Copilot)
- Mode upgrade stories (Quick → Standard, Standard → Scientific)

### Tier 3: Platform Adaptation (Medium)

Adapt AWShift for a new AI platform. Create a folder under a new platform directory:

```
platforms/
├── chatgpt/
│   └── instructions.md
├── gemini/
│   └── system-prompt.md
└── cursor/
    └── .cursorrules
```

Each adaptation should:
- Map AWShift phases to the platform's capabilities
- Include setup instructions
- Test that the AI follows the framework

### Tier 4: Core Framework Changes (Advanced)

Changes to `framework/awrshift.md` or the phase structure itself.

**Process:**
1. Open a Discussion first (don't go straight to PR)
2. Describe the problem with the current framework
3. Propose the change with rationale
4. Community discusses
5. If consensus → submit PR

Core changes should be:
- Backed by real usage data ("I used AWShift 50 times and phase X consistently fails because...")
- Backwards compatible when possible
- Documented with clear reasoning

---

## Pull Request Guidelines

- Keep PRs focused — one change per PR
- Follow existing file formats and naming conventions
- Use clear, descriptive commit messages
- Link to relevant issues or discussions

## Code of Conduct

Be respectful. Give constructive feedback. Help others succeed.

---

## Questions?

Open a Discussion on GitHub. We're happy to help.
