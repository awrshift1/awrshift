# Example: Architecture Decision — Scientific Mode

**Scenario:** Your startup needs to choose a database for a new analytics product. The choice will affect the next 2+ years of development. Three viable options, strong opinions on the team, no clear winner.

**Outcome:** Three databases tested with the same 6 metrics. DuckDB won on cost and simplicity. ClickHouse kept as migration path. Decision backed by data, not opinions.

---

## Phase 1: IDENTIFY (Name the problem)

```
Problem:  Current PostgreSQL setup can't handle analytics workloads
          (aggregation queries timeout at 10M+ rows).
Current:  PostgreSQL 15, queries >30s on dashboards, users complaining.
Target:   Sub-second analytics queries on 100M+ rows.
Gap:      Need an OLAP-capable data layer. Three approaches proposed by team.
Unknowns: Cost at scale, migration complexity, real performance benchmarks.
```

## Phase 2: FORMULATE (Ask the right questions) ← Human Gate

Research questions:

1. What are current OLAP database benchmarks for 100M row analytics?
2. What's the total cost of ownership for each option at our scale?
3. How complex is migration from PostgreSQL to each option?
4. What do companies at our stage (Series A, 5-person eng team) typically choose?
5. What are the vendor lock-in risks for each option?

**Human adds:** "Also research hybrid approaches — can we keep Postgres for OLTP and add analytics layer?"

## Phase 3: RESEARCH (Find the evidence)

5 parallel agents research each question. Key findings:

- **ClickHouse:** Fastest for aggregations. Self-hosted or Cloud. Active community. Migration tools exist.
- **DuckDB:** Embedded, zero-ops. Great for <1B rows. No separate server.
- **BigQuery:** Fully managed. Pay-per-query. Best for spiky workloads. Vendor lock-in to GCP.
- **Hybrid (Postgres + analytics layer):** Possible with materialized views, pg_analytics extension, or CDC to separate OLAP.

## Phase 4: HYPOTHESIZE (Pick your best guess) ← Human Gate

```
H1: If we add ClickHouse alongside Postgres (hybrid),
    then query time drops to <1s because ClickHouse is optimized
    for columnar aggregations, and we keep Postgres for OLTP.

H2: If we embed DuckDB for analytics queries,
    then query time drops to <1s with zero infrastructure cost
    because DuckDB runs in-process and handles our current scale.

H3: If we migrate analytics workload to BigQuery,
    then query time drops to <1s with zero ops overhead
    because BigQuery auto-scales, but we accept GCP lock-in.
```

**Independent review confirms:** Hypotheses are well-formed and cover the solution space.

**Human:** "Test all three. This decision affects 2 years. Scientific mode."

## Phase 5: EVAL-DESIGN (Set the bar) ← Human Gate

Research-backed evaluation criteria (applied to ALL hypotheses equally):

| Metric | Threshold | Weight | Source |
|--------|-----------|--------|--------|
| Query performance (p95, 100M rows) | < 1 second | 30% | User requirement |
| Monthly cost at scale | < $500/mo | 20% | Budget constraint |
| Migration effort | < 2 sprints | 20% | Eng capacity |
| Operational complexity | Low-Medium | 15% | 5-person team reality |
| Vendor lock-in risk | Low-Medium | 15% | CTO preference |

**Independent review:** "Metrics are fair across all three. Consider adding 'ecosystem/community' as a tiebreaker."

**Human approves** with community metric added as tiebreaker.

## H1: ClickHouse (Hybrid)

**PLAN (Map it out):** Set up ClickHouse Cloud trial. CDC from Postgres via Debezium. Analytics queries routed to ClickHouse.

**VERIFY (Fact-check the plan):** Plan checks out. One concern: Debezium adds ops complexity. **PASS WITH FIXES** (documented Debezium as maintenance overhead).

**IMPLEMENT (Build it):** ClickHouse Cloud instance + Debezium CDC + query router.

**TEST (Run the checks):** Benchmark on 100M row test dataset.

**EVALUATE (Score against the bar):**
| Metric | Result |
|--------|--------|
| Query p95 | 0.3s ✅ |
| Monthly cost | $280/mo ✅ |
| Migration effort | 1.5 sprints ✅ |
| Ops complexity | Medium ⚠️ (Debezium) |
| Lock-in | Low ✅ (self-host option) |
| Community | Large, active ✅ |

## H2: DuckDB (Embedded)

**PLAN (Map it out):** Embed DuckDB in API layer. Query Parquet files exported from Postgres nightly.

**VERIFY (Fact-check the plan):** Concern: nightly export means data is up to 24h stale. **PASS WITH FIXES** (documented staleness as trade-off).

**IMPLEMENT (Build it):** DuckDB integration + nightly Postgres → Parquet export + analytics API.

**TEST (Run the checks):** Benchmark on same 100M row dataset.

**EVALUATE (Score against the bar):**
| Metric | Result |
|--------|--------|
| Query p95 | 0.8s ✅ |
| Monthly cost | $0 ✅ |
| Migration effort | 1 sprint ✅ |
| Ops complexity | Low ✅ |
| Lock-in | None ✅ |
| Community | Growing, smaller ⚠️ |

**Note:** Data staleness (up to 24h) is a significant trade-off not captured in metrics.

## H3: BigQuery

**PLAN (Map it out):** Set up BigQuery dataset. Streaming inserts from Postgres via Cloud Functions.

**VERIFY (Fact-check the plan):** Concern: cost scales with query volume, not data size. At high query rates, could exceed budget. **PASS WITH FIXES** (added cost monitoring alert).

**IMPLEMENT (Build it):** BigQuery dataset + streaming insert pipeline + analytics API.

**TEST (Run the checks):** Benchmark on same 100M row dataset.

**EVALUATE (Score against the bar):**
| Metric | Result |
|--------|--------|
| Query p95 | 1.2s ❌ (cold start) |
| Monthly cost | $150-600 ⚠️ (variable) |
| Migration effort | 1.5 sprints ✅ |
| Ops complexity | Low ✅ (managed) |
| Lock-in | High ❌ (GCP) |
| Community | Enterprise, not startup ⚠️ |

## COMPARE (Pick the winner) ← Human Gate

| Metric (weight) | H1: ClickHouse | H2: DuckDB | H3: BigQuery | Winner |
|-----------------|----------------|------------|--------------|--------|
| Query p95 (30%) | 0.3s ✅ | 0.8s ✅ | 1.2s ❌ | H1 |
| Cost (20%) | $280 ✅ | $0 ✅ | $150-600 ⚠️ | H2 |
| Migration (20%) | 1.5 sprints | 1 sprint | 1.5 sprints | H2 |
| Ops (15%) | Medium ⚠️ | Low ✅ | Low ✅ | H2/H3 |
| Lock-in (15%) | Low ✅ | None ✅ | High ❌ | H2 |
| Community | Large ✅ | Growing ⚠️ | Enterprise ⚠️ | H1 |

**Score:** H2 wins 3/5 metrics, H1 wins 2/5, H3 wins 0/5.

**Independent review:** "H2 (DuckDB) wins on paper, but the 24h data staleness is a real concern for analytics. If real-time matters, H1 is better. If dashboards refresh daily, H2 is clearly superior."

## DECIDE (Ship, iterate, or rollback) ← Human Gate

**Human decision: H2 (DuckDB) with a migration path to H1.**

Rationale: Current scale is small enough for DuckDB. Zero cost, zero ops. When real-time becomes critical (likely in 6-12 months), migrate to ClickHouse. DuckDB's Parquet files are directly readable by ClickHouse — migration path is clean.

Decision documented. Architecture Decision Record filed.

---

*This example shows Scientific mode — same evaluation criteria across 3 hypotheses, data-driven comparison, human makes the final call with full context.*
