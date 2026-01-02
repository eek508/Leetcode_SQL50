-- Write your PostgreSQL query statement below
WITH confirmation AS (SELECT s.user_id, COUNT(s.user_id) as confirmation_ct
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
WHERE c.action = 'confirmed'
GROUP BY s.user_id),
Total AS (
SELECT s.user_id, COUNT(s.user_id) as total_ct
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id)

SELECT t.user_id, 
CASE 
WHEN c.confirmation_ct IS NULL THEN 0
ELSE ROUND((CAST(c.confirmation_ct AS numeric)/t.total_ct),2)
END AS confirmation_rate
FROM confirmation c
RIGHT JOIN Total t ON c.user_id = t.user_id
