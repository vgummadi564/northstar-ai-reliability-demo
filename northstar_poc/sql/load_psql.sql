\set ON_ERROR_STOP on
\i sql/schema.sql
\copy customers FROM 'data/customers.csv' WITH (FORMAT csv, HEADER true)
\copy finance_transactions FROM 'data/transactions.csv' WITH (FORMAT csv, HEADER true)
