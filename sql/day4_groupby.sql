#1
SELECT MAX(num) AS num
FROM MyNumbers
WHERE num IN (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1)
;

#2
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;

#3
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year) AS year
    FROM Sales
    GROUP BY product_id
)
;

#4
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'  
GROUP BY activity_date;

#5
SELECT teacher_id, count(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY teacher_id;
