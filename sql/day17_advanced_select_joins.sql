1) SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 
ON l1.id = l2.id - 1
JOIN Logs l3
ON l2.id = l3.id - 1
WHERE L1.num = l2.num AND l2.num = l3.num;

2) SELECT 
    product_id, 
    new_price AS price 
FROM 
    Products 
WHERE 
    (product_id, change_date) IN (
        SELECT 
            product_id, 
            MAX(change_date) 
        FROM 
            Products 
        WHERE 
            change_date <= '2019-08-16' 
        GROUP BY 
            product_id)
UNION
SELECT 
    product_id, 
    10 AS price 
FROM 
    Products 
GROUP BY 
    product_id 
HAVING 
    MIN(change_date) > '2019-08-16';

3)WITH CumulativeWeight AS (
    SELECT 
        person_name,
        SUM(weight) OVER (ORDER BY turn ASC) AS total_weight
    FROM 
        Queue
)
SELECT 
    person_name
FROM 
    CumulativeWeight
WHERE 
    total_weight <= 1000
ORDER BY 
    total_weight DESC
LIMIT 1;
