задачи с LeetCode
#1
Select unique_id, name from Employees
left join EmployeeUNI
    ON Employees.id = EmployeeUNI.id;

#2
SELECT product_name, year, price from sales
inner join product
on sales.product_id = product.product_id;

#3
SELECT customer_id, COUNT(visits.visit_id) AS count_no_trans from visits
LEFT JOIN transactions
on visits.visit_id = transactions.visit_id
Where transaction_id is null
group by customer_id;

#4
