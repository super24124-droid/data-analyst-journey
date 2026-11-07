1)SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count 
FROM Accounts 
WHERE income < 20000

UNION

SELECT 'Average Salary' AS category, COUNT(*) AS accounts_count 
FROM Accounts 
WHERE income >= 20000 AND income <= 50000

UNION

SELECT 'High Salary' AS category, COUNT(*) AS accounts_count 
FROM Accounts 
WHERE income > 50000;

2)SELECT user_id, CONCAT(UPPER(SUBSTRING(name,1,1)), LOWER(SUBSTRING(name,2))) AS name
FROM Users
ORDER BY user_id;

3)SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%';

4)DELETE FROM Person
WHERE id NOT IN (SELECT MIN(id) FROM (SELECT * FROM Person) AS p GROUP BY email);

