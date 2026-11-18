CREATE TABLE IF NOT EXISTS customers (customer_id TEXT PRIMARY KEY, customer_name TEXT NOT NULL, region TEXT NOT NULL, segment TEXT NOT NULL, industry TEXT NOT NULL, active BOOLEAN NOT NULL);
CREATE TABLE IF NOT EXISTS finance_transactions (transaction_id TEXT PRIMARY KEY, transaction_date DATE NOT NULL, customer_id TEXT NOT NULL REFERENCES customers(customer_id), transaction_type TEXT NOT NULL CHECK (transaction_type IN ('sale','refund','credit')), amount_usd NUMERIC(14,2) NOT NULL CHECK (amount_usd >= 0), currency TEXT NOT NULL, status TEXT NOT NULL, product TEXT NOT NULL, description TEXT);
CREATE INDEX IF NOT EXISTS idx_finance_date_type ON finance_transactions(transaction_date,transaction_type);
CREATE INDEX IF NOT EXISTS idx_finance_customer ON finance_transactions(customer_id);
