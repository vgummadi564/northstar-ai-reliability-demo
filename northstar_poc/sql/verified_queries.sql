-- Run from the repository root after loading.
SELECT EXTRACT(YEAR FROM transaction_date)::int AS year,
 SUM(CASE WHEN transaction_type='sale' THEN amount_usd ELSE 0 END) AS gross_sales,
 SUM(CASE WHEN transaction_type='refund' THEN amount_usd ELSE 0 END) AS refunds,
 SUM(CASE WHEN transaction_type='credit' THEN amount_usd ELSE 0 END) AS credits,
 SUM(CASE WHEN transaction_type='sale' THEN amount_usd ELSE -amount_usd END) AS net_revenue
FROM finance_transactions WHERE status='posted' AND currency='USD'
GROUP BY 1 ORDER BY 1;

-- Expected FY2025: 12800000.00, 1600000.00, 800000.00, 10400000.00
-- Expected FY2024: 10800000.00, 1100000.00, 600000.00, 9100000.00
