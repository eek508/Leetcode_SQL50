-- Write your PostgreSQL query statement below
WITH quality AS (SELECT query_name, ROUND(AVG((CAST(rating AS NUMERIC)/position)),2) AS quality
FROM Queries
GROUP BY query_name),
poor_percentage_ct AS (
    SELECT query_name, COUNT(rating) AS poor_query_ct
    FROM Queries
    WHERE rating < 3
    GROUP BY query_name
),
total AS (
    SELECT query_name, COUNT(*) as total
    FROM Queries
    GROUP BY query_name
)

SELECT q.query_name, q.quality, 
CASE
WHEN p.poor_query_ct IS NULL THEN 0
ELSE ROUND((p.poor_query_ct / CAST(t.total AS NUMERIC))*100,2) 
END AS poor_query_percentage
FROM quality q
LEFT JOIN poor_percentage_ct p ON q.query_name = p.query_name
JOIN total t ON q.query_name = t.query_name
