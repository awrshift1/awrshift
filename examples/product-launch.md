# Example: Product Launch — Standard Mode

**Scenario:** You're building a notifications system for a SaaS product. The team needs to decide on the architecture and implementation approach.

**Outcome:** A SaaS notification system built in 2.5 days. 5 human gates caught a security gap in the plan. Read rate hit 67% — above the 60% industry bar.

---

## Phase 1: IDENTIFY (Name the problem)

```
Problem:  Users miss important events (payment failures, security alerts)
          because the app has no notification system.
Current:  Email-only alerts with 12% open rate.
Target:   In-app + push notifications with >60% read rate.
Gap:      No notification infrastructure exists.
Unknowns: Best delivery method, real-time requirements, user preferences.
```

## Phase 2: FORMULATE (Ask the right questions) ← Human Gate

AI proposes research questions:

1. **Architecture:** What notification architectures do similar SaaS products use? (WebSockets vs SSE vs polling?)
2. **Services:** What are the top notification services? (Novu, Knock, OneSignal, custom?)
3. **UX patterns:** What notification UX patterns have highest engagement?
4. **Scale:** What throughput do we need? (current user count × event frequency)

**Human reviews:** "Good, but add question about notification fatigue — we don't want to spam users."

→ Research brief updated with 5 questions.

## Phase 3: RESEARCH (Find the evidence)

Four parallel research agents investigate:

- **Agent 1:** Notification architecture patterns (WebSocket for real-time, SSE for one-way, polling as fallback)
- **Agent 2:** Service comparison — Novu (open source, self-host), Knock (managed, $0.01/notification), OneSignal (push-focused)
- **Agent 3:** UX research — categorized notifications (urgent/info/marketing), user preference controls, quiet hours
- **Agent 4:** Scale analysis — 5K DAU × 3 events/day = 15K notifications/day. Any service handles this.

Compiled findings → research document.

## Phase 4: HYPOTHESIZE (Pick your best guess) ← Human Gate

```
H1: If we use Novu (self-hosted) with WebSocket delivery,
    then read rate will exceed 60% because real-time delivery
    + open-source = full control over UX.

H2: If we use Knock (managed) with SSE delivery,
    then read rate will exceed 60% with lower engineering cost
    because Knock handles routing, preferences, and templates.
```

**Human decides:** "Test H1 only — we prefer self-hosted. Standard mode."

## Phase 5: EVAL-DESIGN (Set the bar) ← Human Gate

Research-backed metrics:

| Metric | Threshold | Source |
|--------|-----------|--------|
| Notification read rate | > 60% | Industry avg for in-app: 45-70% |
| Delivery latency (p95) | < 2 seconds | User expectation for "real-time" |
| Setup time | < 3 days | Sprint capacity |
| User preference controls | Yes/No per category | UX research finding |
| Notification fatigue score | < 5 notifications/day default | Research: >7/day = user disables |

**Human approves:** "Good. Add 'works offline' as a nice-to-have."

## Phase 6: PLAN (Map it out) ← Human Gate

AI enters planning mode, explores the codebase, and proposes:

```
1. Set up Novu self-hosted (Docker compose) — Day 1
2. Create notification service abstraction layer — Day 1
3. Implement WebSocket connection with fallback to SSE — Day 2
4. Build notification center UI component — Day 2
5. Add user preference controls (per-category toggle) — Day 3
6. Wire up 3 event types: payment failure, security alert, feature update — Day 3
```

Rollback: Feature flag. Disable notifications → fall back to email.

**Human approves plan.**

## Phase 7: VERIFY (Fact-check the plan)

- [x] Research supports Novu + WebSocket? → Yes (Agent 1 + 2 confirmed)
- [x] No conflicts with existing architecture? → Checked — no WebSocket server exists, need to add
- [x] Feasible in 3 days? → Yes, Novu has Docker quickstart
- [x] Security risks? → WebSocket auth needed — **FIX:** add JWT validation to plan
- [x] Metrics achievable? → Yes, all within capability

**Verdict:** PASS WITH FIXES (added WebSocket auth to plan)

## Phase 8: IMPLEMENT (Build it)

6 tasks executed in dependency order. Each marked in_progress → completed.

## Phase 9: TEST (Run the checks)

- Notification delivery: 1.2s p95 latency ✅
- Preference controls: toggles work per category ✅
- Offline: notifications queue and deliver on reconnect ✅
- Feature flag: disabling cuts all notifications, email fallback works ✅

## Phase 10: EVALUATE (Score against the bar)

| Metric | Threshold | Actual | Pass? |
|--------|-----------|--------|-------|
| Read rate | > 60% | 67% (internal test) | ✅ |
| Delivery latency p95 | < 2s | 1.2s | ✅ |
| Setup time | < 3 days | 2.5 days | ✅ |
| User preferences | Per category | Yes | ✅ |
| Fatigue score | < 5/day default | 3/day | ✅ |

## Phase 11: DECIDE (Ship, iterate, or rollback) ← Human Gate

**Outcome: SUCCESS**

Ship to staging. Schedule A/B test with 10% of users. Monitor read rate for 1 week before full rollout.

Decision documented. Sprint retrospective updated.

---

*This example shows Standard mode for a feature build — 11 phases, 5 human gates, research-informed decisions.*
