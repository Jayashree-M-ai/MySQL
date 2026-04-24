create database customer;
use customer;
-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    registration_date DATE
);

INSERT INTO customers (customer_id, customer_name, registration_date) VALUES
(101, 'John Doe', '2022-01-15'),
(102, 'Jane Smith', '2022-02-10'),
(103, 'Alice Johnson', '2022-03-05'),
(104, 'Robert Brown', '2022-05-20'),
(105, 'Emily Davis', '2022-06-01');

-- Create Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO sales (sale_id, customer_id, product_id, amount, sale_date) VALUES
(1, 101, 1, 500.00, '2023-01-15'),
(2, 101, 2, 300.00, '2023-02-15'),
(3, 102, 1, 400.00, '2023-02-10'),
(4, 102, 3, 250.00, '2023-03-05'),
(5, 103, 2, 600.00, '2023-04-20'),
(6, 104, 1, 700.00, '2023-05-10'),
(7, 105, 2, 800.00, '2023-06-15');

-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

INSERT INTO products (product_id, product_name, price, stock_quantity) VALUES
(1, 'Laptop', 1000.00, 5),
(2, 'Mobile', 600.00, 10),
(3, 'Tablet', 400.00, 8),
(4, 'Headphones', 150.00, 20),
(5, 'Smartwatch', 200.00, 3);

-- Create Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees (employee_id, name, department) VALUES
(1, 'John', 'Sales'),
(2, 'Emily', 'Marketing'),
(3, 'Michael', 'HR'),
(4, 'Sara', 'IT'),
(5, 'David', 'Finance');

-- Create Promotions Table
CREATE TABLE promotions (
    promotion_id INT PRIMARY KEY,
    employee_id INT,
    promotion_date DATE
);

INSERT INTO promotions (promotion_id, employee_id, promotion_date) VALUES
(1, 1, '2023-01-10'),
(2, 1, '2023-06-12'),
(3, 2, '2023-03-15'),
(4, 3, '2022-09-30'),
(5, 3, '2023-07-01');

  -- Question 1: Calculate the total sales amount for each customer.
select customer_id, sum(amount) as total_sales
from sales
group by customer_id; 
  
-- Question 2: Identify products with stock quantity less than 5 units.
select product_name, stock_quantity from products where stock_quantity<5;

-- Question 3: Find employees who have been promoted more than once.
select employee_id, count(*) as number_of_times_promoted 
from promotions
group by employee_id
having count(*)>1;

-- Question 4: Calculate total sales for each month.
select year(sale_date) as year, month(sale_date) as month, 
sum(amount) as total_sales 
from sales
group by year(sale_date), month(sale_date) 
order by year, month;

-- Question 5: Find customers who purchased more than one product.
select customer_id
from sales
group by customer_id
having count(distinct product_id)>1;

