-- Write your PostgreSQL query statement below
WITH units AS (SELECT p.product_id, p.start_date, p.end_date, u.purchase_date, p.price, u.units,
CASE 
WHEN (u.purchase_date >= p.start_date) and (u.purchase_date <= p.end_date) THEN u.units
ELSE 0 
END AS final_units
FROM Prices p 
LEFT JOIN UnitsSold u ON p.product_id = u.product_id)

SELECT product_id,
CASE 
WHEN SUM(final_units) = 0 THEN 0
ELSE ROUND((CAST(SUM(price*final_units) AS numeric) / SUM(final_units)),2) 
END AS average_price
FROM units
GROUP BY product_id
