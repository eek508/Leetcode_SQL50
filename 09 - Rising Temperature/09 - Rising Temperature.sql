-- Write your PostgreSQL query statement below
WITH setup AS (SELECT *,
CASE 
WHEN (recordDate::date - (LAG(recordDate, 1) OVER (ORDER BY recordDate))::date) = 1 THEN  LAG(temperature, 1) OVER (ORDER BY recordDate)
ELSE null
END AS prev_day_temp
FROM Weather)

SELECT id
FROM setup
WHERE temperature > prev_day_temp


