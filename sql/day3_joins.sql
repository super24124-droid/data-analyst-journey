#1
SELECT id, movie, description, rating
FROM Cinema
WHERE id % 2 != 0 AND description NOT LIKE 'boring'
ORDER BY rating DESC;

#2
SELECT p.project_id, ROUND(AVG(experience_years),2) AS average_years
FROM project p
LEFT JOIN employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;

#3
SELECT p.product_id, IFNULL(round(SUM(p.price * u.units)/sum(u.units),2),0) AS average_price
FROM prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id and u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY product_id;

#4
SELECT a.machine_id, ROUND(AVG(e.timestamp - a.timestamp),3) AS processing_time
FROM activity a
INNER JOIN activity e
ON a.machine_id = e.machine_id
AND a.process_id = e.process_id 
AND a.activity_type = 'start'
AND e.activity_type = 'end'
GROUP BY a.machine_id;

#5
SELECT 
    contest_id,
    ROUND(COUNT(DISTINCT user_id) * 100.0 / (SELECT COUNT(user_id) FROM Users), 2) AS percentage
FROM 
    Register
GROUP BY 
    contest_id
ORDER BY 
    percentage DESC,
    contest_id ASC;
