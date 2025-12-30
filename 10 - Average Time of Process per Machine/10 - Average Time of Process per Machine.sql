-- Write your PostgreSQL query statement below
WITH starttime AS (SELECT machine_id, process_id, timestamp as start_time
FROM Activity
WHERE activity_type = 'start'),
endtime AS 
(SELECT machine_id, process_id, timestamp as end_time
FROM Activity
WHERE activity_type = 'end')

SELECT t.machine_id, ROUND((CAST((SUM(t.process_duration)) AS numeric)/COUNT(t.process_id)),3) AS processing_time
FROM (
SELECT a.machine_id, a.process_id, (b.end_time - a.start_time) as process_duration
FROM starttime a 
INNER JOIN endtime b ON a.machine_id = b.machine_id and a.process_id = b.process_id) t
GROUP BY t.machine_id
