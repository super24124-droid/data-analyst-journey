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

#4
SELECT user_id, CONCAT(UPPER(SUBSTRING(name,1,1)), LOWER(SUBSTRING(name,2))) AS name
FROM Users
ORDER BY user_id;

#5
(SELECT u.name AS results
FROM Users u
JOIN MovieRating mr
ON u.user_id = mr.user_id
GROUP BY mr.user_id
ORDER BY COUNT(mr.rating) DESC, u.name ASC
LIMIT 1)
UNION ALL
(SELECT m.title AS results
FROM Movies m
JOIN MovieRating mr
ON m.movie_id = mr.movie_id
WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY mr.movie_id
ORDER BY AVG(mr.rating) DESC, m.title ASC
LIMIT 1)
;


