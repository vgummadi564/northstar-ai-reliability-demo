# Data Dictionary

`finance_transactions` / `data/transactions.csv`: transaction_id (unique), transaction_date (ISO date), customer_id, transaction_type (`sale`, `refund`, `credit`), amount_usd (positive decimal USD), currency, status (`posted`), product, description. All transactions are synthetic.

`customers` / `data/customers.csv`: customer_id (unique), customer_name, region, segment, industry, active.

`revenue_summary.csv`: annual gross sales under a misleading generic report title. `source_metric` clarifies that this is gross sales, not net revenue.

`monthly_finance_reconciliation.csv`: monthly totals derived from transactions, not an independent source of truth.

Use transaction_date for calendar-year reporting; FY equals calendar year for Northstar Analytics.
