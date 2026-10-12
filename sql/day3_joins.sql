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


#4


#5
