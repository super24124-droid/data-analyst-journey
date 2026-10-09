задачи с LeetCode
#1
Select unique_id, name from Employees
left join EmployeeUNI
    ON Employees.id = EmployeeUNI.id;
#2
SELECT product_name, year, price from sales
inner join product
on sales.product_id = product.product_id;
