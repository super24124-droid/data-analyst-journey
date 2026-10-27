1)SELECT customer_id
FROM Customer c
GROUP BY c.customer_id
HAVING COUNT(DISTINCT(c.product_key)) = (SELECT COUNT(*) FROM Product);

2)SELECT
    a.visited_on,
    SUM(b.amount) AS amount,
    ROUND(SUM(b.amount) / 7, 2) AS average_amount
FROM
    (SELECT DISTINCT visited_on FROM customer) AS a
    JOIN customer AS b ON DATEDIFF(a.visited_on, b.visited_on) BETWEEN 0 AND 6
WHERE a.visited_on >= (SELECT MIN(visited_on) FROM customer) + 6
GROUP BY 1
ORDER BY 1;

3)WITH T AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
)
SELECT id, COUNT(*) AS num
FROM T
GROUP BY id
ORDER BY num DESC
LIMIT 1;

4)SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance i1
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance i2
    WHERE i2.pid <> i1.pid
)
AND NOT EXISTS (
    SELECT 1
    FROM Insurance i3
    WHERE i3.pid <> i1.pid
      AND i3.lat = i1.lat
      AND i3.lon = i1.lon
);
