#1
SELECT name, salary 
FROM employees
WHERE salary > 80000 AND hire_date > '2021-01-01';

#2
SELECT d.name
FROM departments d
JOIN employees e
ON d.id = e.department_id
GROUP BY d.id, d.name
HAVING AVG(e.salary) > 70000;

#3
SELECT department_id, COUNT(*)
FROM employees
WHERE salary >= 50000
GROUP BY department_id
HAVING COUNT(id) > 5;

#4
SELECT d.name
FROM departments d
JOIN employees e
ON d.id = e.department_id
GROUP BY d.id, d.name
HAVING COUNT(e.id) >= 3 AND MAX(e.salary) > 100000;

#5
SELECT c.name
FROM  customers c
JOIN orders o
ON c.id = o.customer_id
WHERE c.city = 'Москва' AND o.status = 'completed'
GROUP BY c.id, c.name
HAVING SUM(o.amount) > 10000;
