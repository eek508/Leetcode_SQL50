-- Write your PostgreSQL query statement below
WITH setup AS (SELECT t.player_id, t.login_rnk, t.diff_from_first_login
FROM (SELECT player_id,
ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS login_rnk,
event_date - LAG(event_date) OVER (PARTITION BY player_id ORDER BY event_date) as diff_from_first_login
FROM Activity) t
WHERE t.login_rnk <= 2)

SELECT
ROUND(((SELECT COUNT(distinct player_id)
FROM setup
WHERE diff_from_first_login = 1)
/
CAST((SELECT COUNT(distinct player_id)
FROM setup) AS Numeric)),2) AS fraction
