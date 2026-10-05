USE upi_intelligence;
-- Optional CLI method if LOCAL INFILE is enabled:
-- LOAD DATA LOCAL INFILE 'C:/path/to/upi_transactions_100k.csv' INTO TABLE transactions FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
SELECT COUNT(*) AS imported_rows FROM transactions;
