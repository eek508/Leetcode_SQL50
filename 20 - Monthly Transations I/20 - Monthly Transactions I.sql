WITH total_trans AS (SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month, country, COUNT(id) as trans_count,
SUM(amount) as trans_total_amount
FROM Transactions
GROUP BY TO_CHAR(trans_date, 'YYYY-MM'), country),
approved_trans AS (
SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month, country, COUNT(id) as approved_count,
SUM(amount) as approved_total_amount
FROM Transactions
WHERE state = 'approved'
GROUP BY TO_CHAR(trans_date, 'YYYY-MM'), country)

SELECT t.month, t.country, t.trans_count, 
CASE WHEN a.approved_count IS NULL THEN 0
ELSE a.approved_count END AS approved_count, t.trans_total_amount, 
CASE WHEN a.approved_total_amount IS NULL THEN 0
ELSE a.approved_total_amount END AS approved_total_amount
FROM total_trans t
LEFT JOIN approved_trans a ON t.month = a.month
                        AND t.country IS NOT DISTINCT FROM a.country
