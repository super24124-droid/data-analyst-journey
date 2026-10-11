1#
SELECT today.id 
FROM weather AS today
JOIN weather AS yesterday
ON DATEDIFF(today.recordDate, yesterday.recordDate) = 1
WHERE today.temperature > yesterday.temperature;

2#
SELECT e.name, b.bonus
FROM employee e
LEFT JOIN bonus b
ON e.empID = b.empID
WHERE b.bonus < 1000 OR b.bonus IS NULL;

3#
SELECT s.student_id, s.student_name, sub.subject_name, count(e.subject_name) AS attended_exams
FROM students s
CROSS JOIN subjects sub
LEFT JOIN examinations e
ON s.student_id = e.student_id
AND sub.subject_name = e.subject_name
GROUP BY
s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

4#
SELECT product_id 
FROM products
WHERE low_fats LIKE 'Y' AND recyclable LIKE 'Y';

5#
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;

6#
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;

7#
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;

8#
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
