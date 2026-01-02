-- Write your PostgreSQL query statement below
SELECT t.name
FROM
(SELECT e1.managerId, e2.name, COUNT(e1.managerId)
FROM Employee e1
JOIN Employee e2 ON e1.managerId = e2.id
GROUP BY e1.managerId, e2.name
HAVING COUNT(e1.managerId) >= 5) t
