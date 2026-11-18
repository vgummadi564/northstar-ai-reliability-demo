# Northstar Analytics — Synthetic AI Reliability Demo Dataset

All data and policies in this package are **fictional**. Seed: `20261118`.

## Contents
- `data/transactions.csv`: 3,000 transactions (1,500 each for 2024 and 2025)
- `data/customers.csv`: 150 customers
- `data/revenue_summary.csv`: intentionally ambiguous annual gross-sales summary
- `data/monthly_finance_reconciliation.csv`: derived monthly reconciliation
- `docs/`: current and superseded policies, metric definitions, dictionary, scenario
- `sql/`: PostgreSQL schema, load script, validation queries
- `evals/evaluation_cases.json`: 20 evaluation cases

## Verified synthetic totals
| Year | Gross | Refunds | Credits | Net |
|---|---:|---:|---:|---:|
| 2024 | $10,800,000 | $1,100,000 | $600,000 | $9,100,000 |
| 2025 | $12,800,000 | $1,600,000 | $800,000 | $10,400,000 |

## Load into PostgreSQL
Create an empty database and run from this package root:
```bash
psql "$DATABASE_URL" -f sql/load_psql.sql
psql "$DATABASE_URL" -f sql/verified_queries.sql
```
The load script is intended for a fresh database; do not run it twice without truncating tables. If your psql client rejects the `\i` path, run from the extracted package root.

## Suggested deployment
1. Commit `data/`, `docs/`, `sql/`, and `evals/` to a dedicated GitHub repo. They are entirely synthetic.
2. For a live POC, import CSVs into hosted PostgreSQL (e.g. Supabase or Neon). Keep the database credentials **only** in the FastAPI server environment.
3. Have FastAPI expose a narrow read-only tool to compute approved aggregates. Do not accept arbitrary model-generated SQL without validation/authorization. Use a DB account restricted to SELECT on the demo tables, plus timeouts and row limits.
4. Index the documents for retrieval; include status, effective date, document ID, and source path in metadata.
5. Expose an `/api/ask` endpoint returning answer, metric, evidence references, executed tool result, and validation outcome. The React frontend calls FastAPI, not the database or LLM provider directly.
6. Host React on GitHub Pages/Vercel and FastAPI on a backend hosting service. GitHub Pages alone cannot run Python or PostgreSQL. Configure CORS for the frontend origin.

## Demo flow
- Baseline: allow only the misleading `revenue_summary.csv`; illustrate wrong gross-sales answer $12.8M.
- Diagnosis: show missing policy and SQL query, and identify gross/net confusion.
- Fixed: retrieve current policy, execute approved aggregation, validate $10.4M, show citations and trace.
- Evals: run all 20 cases; use deterministic checks for numeric cases and rubric/manual checks for explanations.

## Security and honesty
Never commit API keys, service-role database keys, or connection strings. Label the baseline as a **controlled failure**. Do not display invented confidence percentages or simulated traces as if they were real. No real customer or financial data is included.
