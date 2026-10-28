1)SELECT id, DATEDIFF(CURDATE(), order_date) AS days_since_order FROM orders;

2)SELECT id, DATE_FORMAT(order_date, '%d.%m.%Y') AS formatted_date FROM orders;

3)SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, SUM(amount) AS sum_amount
FROM orders
GROUP BY year, month
ORDER BY year, month;

4)SELECT id, order_date
FROM orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

5)SELECT id,
       DATE_ADD(order_date, INTERVAL '1-3' YEAR_MONTH)
FROM orders;
