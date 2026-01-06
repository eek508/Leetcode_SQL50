-- Write your PostgreSQL query statement below
SELECT t.contest_id, t.percentage
FROM
(SELECT r.contest_id, 
ROUND(((CAST(COUNT(r.user_id) AS numeric) /
(SELECT COUNT(user_id) FROM Users)) * 100),2) AS percentage
FROM Register r
LEFT JOIN Users u ON r.user_id = u.user_id
GROUP BY r.contest_id) t
ORDER BY t.percentage DESC, t.contest_id ASC
