1)(SELECT employee_id, department_id 
FROM Employee
WHERE primary_flag = 'Y')
UNION
(SELECT employee_id, department_id 
FROM Employee 
GROUP BY employee_id
HAVING COUNT(*) = 1)

2) SELECT b.employee_id, b.name, COUNT(DISTINCT a.employee_id) AS reports_count, ROUND(AVG(a.age), 0) AS average_age
FROM Employees a 
CROSS JOIN Employees b
ON a.reports_to = b.employee_id
GROUP BY b.employee_id, b.name
ORDER BY b.employee_id;

3)SELECT x, y, z, (CASE WHEN (x + y) > z and (x + z) > y and (z + y) > x THEN 'Yes' ELSE 'No' END) AS triangle
FROM Triangle;
