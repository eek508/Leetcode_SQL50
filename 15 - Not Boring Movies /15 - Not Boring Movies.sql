-- Write your PostgreSQL query statement below
SELECT *
FROM Cinema
WHERE id %2 <> 0 AND description not like '%boring%'
ORDER BY rating DESC;
