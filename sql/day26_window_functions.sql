1) WITH filtered AS (
SELECT *, id - ROW_NUMBER() OVER (ORDER BY id) AS grp
FROM Stadium
WHERE people >= 100)
SELECT id, visit_date, people
FROM filtered
WHERE grp IN (
SELECT grp
FROM filtered
GROUP BY grp
HAVING COUNT(*) >=3)
ORDER BY visit_date;

2)WITH ranked AS (
  SELECT *,
         RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
  FROM Employee
)
SELECT d.name AS Department, r.name AS Employee, r.salary
FROM ranked r
JOIN Department d ON r.departmentId = d.id
WHERE r.rnk = 1;


3)WITH with_prev AS (
  SELECT
    id,
    recordDate,
    temperature,
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
    LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
  FROM Weather
)
SELECT id
FROM with_prev
WHERE temperature > prev_temp
  AND DATEDIFF(recordDate, prev_date) = 1;
