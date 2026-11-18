# Northstar Analytics — Approved Metric Definitions
Document ID: FIN-METRICS-2025
Status: APPROVED
Effective date: 2025-01-01
Owner: Finance Operations

## Revenue (default)
When a user asks for "revenue", "total revenue", or "company revenue" without qualification, report **net revenue** for the specified period, unless clarification is required for another reason.

**Net revenue = posted gross sales − posted refunds − posted credits.**
Use `transaction_date` for the reporting period, `status = posted`, and USD amounts.
Gross sales includes posted sale transactions only. Refunds and credits are represented as positive amounts in the source ledger and must be subtracted. Do not subtract them twice.

## Sources of truth
The `finance_transactions` SQL table is authoritative for computed financial figures. `revenue_summary.csv` contains gross sales, despite its generic report title, and must not be interpreted as net revenue.

## Response requirements
State the metric definition, period, computed value, and data source. Cite the policy document and query result. Never claim that the model's subjective confidence is a verified statistical probability.
