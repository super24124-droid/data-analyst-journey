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


#5
