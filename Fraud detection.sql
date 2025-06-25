use fraud_detection

-- 1. Count total transactions
SELECT COUNT(*) AS total_transactions FROM transaction_log;

-- 2. Top 10 'CASH_OUT' transactions
SELECT * FROM transaction_log WHERE type = 'CASH_OUT' ORDER BY amount DESC LIMIT 10;

-- 3. Total amount by transaction type
SELECT type, SUM(amount) AS total_amount FROM transactions_log GROUP BY type;

-- 4. Average amount of TRANSFER transactions
SELECT AVG(amount) AS avg_transfer_amount FROM transaction_log WHERE type = 'TRANSFER';

-- 5. Highest avg transaction type
SELECT type, AVG(amount) AS avg_amount FROM transaction_log GROUP BY type ORDER BY avg_amount DESC LIMIT 1;

-- 6. Transactions with amount > 1M
SELECT COUNT(*) AS big_txns FROM transaction_log WHERE amount > 1000000;

-- 7. Flagged but not fraud transactions
SELECT * FROM transaction_log WHERE isFraud = 0 AND isFlaggedFraud = 1;

-- 8. Count of frauds by type
SELECT type, COUNT(*) AS fraud_count FROM transaction_log WHERE isFraud = 1 GROUP BY type;

-- 9. Transaction types with total amount > 1M
SELECT type, SUM(amount) AS total FROM transaction_log GROUP BY type HAVING total > 1000000;

-- 10. Senders with more than 5 transfers
SELECT nameOrig, COUNT(*) AS num_txns FROM transaction_log WHERE type = 'TRANSFER' GROUP BY nameOrig HAVING num_txns > 5;

-- 11. Rank sender's transactions by amount
SELECT *, RANK() OVER (PARTITION BY nameOrig ORDER BY amount DESC) AS txn_rank FROM transaction_log;

-- 12. Running total per sender
SELECT *, SUM(amount) OVER (PARTITION BY nameOrig ORDER BY step) AS running_total FROM transaction_log;

-- 13. Join with user info (assuming users table exists)
SELECT u.name, t.amount FROM transaction_log t JOIN users u ON t.nameOrig = u.name WHERE t.type = 'PAYMENT';

-- 14. Negative balances
SELECT * FROM transaction_log WHERE newbalanceOrig < 0;

-- 15. Balance mismatch check
SELECT * FROM transaction_log WHERE ROUND(oldbalanceOrg - amount, 2) != ROUND(newbalanceOrig, 2);

-- 16. First 5 characters of sender
SELECT DISTINCT nameOrig, LEFT(nameOrig, 5) AS short_name FROM transaction_log;

-- 17. Top user by transaction amount
SELECT nameOrig, SUM(amount) AS total FROM transaction_log GROUP BY nameOrig ORDER BY total DESC LIMIT 1;

-- 18. Categorize transactions with CASE
SELECT *, CASE
    WHEN amount > 1000000 THEN 'High'
    WHEN amount BETWEEN 100000 AND 1000000 THEN 'Medium'
    ELSE 'Low' END AS category
FROM transaction_log;

-- 19. Suspicious fraud pattern
SELECT * FROM transaction_log
WHERE isFraud = 1 AND type IN ('TRANSFER', 'CASH_OUT')
  AND oldbalanceDest = 0 AND newbalanceDest = 0;

-- 20. Type usage > average (using subquery)
SELECT type, COUNT(*) AS cnt FROM transaction_log
GROUP BY type
HAVING cnt > (
  SELECT AVG(t_count) FROM (
    SELECT COUNT(*) AS t_count FROM transaction_log GROUP BY type
  ) AS sub
);
