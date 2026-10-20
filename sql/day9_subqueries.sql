#1
SELECT employee_id 
FROM Employees 
WHERE salary < 30000
AND manager_id IS NOT NULL 
AND manager_id NOT IN (
    SELECT employee_id
    FROM Employees
) 
ORDER BY employee_id;

#2
SELECT user_id, COUNT(*) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

#3
SELECT 
CASE 
WHEN id = (SELECT MAX(id) FROM Seat) AND id % 2 = 1 THEN id
WHEN id % 2 = 1 THEN id + 1
ELSE id - 1
END AS id, student
FROM Seat
ORDER BY id;
