1) SELECT name, salary, (SELECT AVG(salary) FROM employees) AS company_avg
FROM employees;

2)SELECT e.name, e.department_id, e.salary, d.avg_salary AS dept_avg
FROM employees e
LEFT JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) d ON d.department_id = e.department_id; 
ИЛИ
SELECT a.name, a.department_id, a.salary,
       (SELECT AVG(b.salary) FROM employees b
        WHERE b.department_id = a.department_id) AS dept_avg
FROM employees a;

3)SELECT c.name,
       (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.id) AS orders_cnt
FROM customers c;

4)SELECT department_id, avg_salary
FROM (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS stats
WHERE avg_salary > 70000;

5)SELECT department_id, total_salary
FROM (
    SELECT department_id, SUM(salary) AS total_salary
    FROM employees
    GROUP BY department_id
) AS dep_salary
ORDER BY total_salary DESC
LIMIT 3;

6)SELECT e.name, e.salary,
       (SELECT d.name FROM departments d WHERE d.id = e.department_id) AS dept_name
FROM employees e;
