-- Write your PostgreSQL query statement below
WITH immediate_first AS (SELECT *, 
CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate'
ELSE 'scheduled' END AS del_type,
ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date ASC) AS order_rank
FROM Delivery)

SELECT ROUND((((SELECT COUNT(delivery_id)
FROM immediate_first
WHERE order_rank = 1 and del_type = 'immediate') / 
CAST((SELECT COUNT(delivery_id)
FROM immediate_first WHERE order_rank = 1) AS NUMERIC)) * 100),2) AS immediate_percentage
