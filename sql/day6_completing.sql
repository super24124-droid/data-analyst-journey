#1
SELECT s.user_id, ROUND(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END)/ COUNT(*), 2) AS confirmation_rate
FROM Confirmations c 
RIGHT JOIN Signups s
ON s.user_id = c.user_id
GROUP BY user_id;

#2
SELECT m.name
FROM employee e
JOIN employee m ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(*) >= 5;

#3
SELECT ROUND(
    COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 
    2
) AS fraction
FROM Activity
WHERE (player_id, DATE_SUB(event_date, INTERVAL 1 DAY)) IN (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
);

#4
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM 
    Transactions
GROUP BY 
    DATE_FORMAT(trans_date, '%Y-%m'), 
    country;

#5
SELECT 
    ROUND(AVG(order_date = customer_pref_delivery_date) * 100, 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
);
