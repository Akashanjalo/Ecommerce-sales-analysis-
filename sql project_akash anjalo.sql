create database if not exists projectdb;
show create database projectdb;
use projectdb;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE
);
show tables from projectdb;
create table Products (
Product_id int primary key,
Name varchar (50),
category_id int,
price decimal(10,2),
foreign key(category_id) references categories(category_id)
);
create table categories (
category_id int primary key,
category_name varchar(50)
);
create table orders(
order_id int primary key,
customer_id int,
order_date date,
status varchar(50),
foreign key (customer_id) references customers(customer_id)
);
create table order_items(
order_item_id int primary key,
order_id int,
product_id int,
quantity int,
total_price decimal (10,2),
foreign key (order_id) references orders(order_id),
foreign key(product_id) references products(product_id)
);
create table payments(
payment_id int primary key,
order_id int,
payment_method varchar(50),
payment_status varchar(20),
foreign key(order_id)references orders(order_id)
);
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

INSERT INTO customers VALUES

(1, 'Arun Kumar', 'arun@gmail.com', 'Chennai', '2023-01-10'),
(2, 'Priya Sharma', 'priya@gmail.com', 'Bangalore', '2023-02-15'),
(3, 'Rahul Verma', 'rahul@gmail.com', 'Mumbai', '2023-03-20'),
(4, 'Sneha Iyer', 'sneha@gmail.com', 'Delhi', '2023-04-05'),
(5, 'Kiran Reddy', 'kiran@gmail.com', 'Hyderabad', '2023-05-12');

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Accessories'),
(3, 'Fashion');

INSERT INTO products VALUES
(101, 'Laptop', 1, 60000),
(102, 'Smartphone', 1, 20000),
(103, 'Headphones', 2, 2000),
(104, 'Running Shoes', 3, 3000),
(105, 'Wrist Watch', 3, 5000);

INSERT INTO order_items VALUES
(1, 1001, 101, 1, 6000.0),
(2, 1001, 103, 2, 4000.00),
(3, 1002, 102, 1, 20000),
(4, 1003, 104, 1, 3000),
(5, 1004, 105, 1, 5000),
(6, 1005, 101, 1, 60000),
(7, 1006, 102, 1, 20000);

INSERT INTO orders VALUES
(1001, 1, '2024-01-10', 'delivered'),
(1002, 2, '2024-01-12', 'delivered'),
(1003, 1, '2024-02-01', 'cancelled'),
(1004, 3, '2024-02-10', 'delivered'),
(1005, 4, '2024-03-05', 'pending'),
(1006, 1, '2024-03-15', 'delivered');

INSERT INTO payments VALUES
(1, 1001, 'Credit Card', 'Completed'),
(2, 1002, 'UPI', 'Completed'),
(3, 1003, 'Debit Card', 'Failed'),
(4, 1004, 'Net Banking', 'Completed'),
(5, 1005, 'UPI', 'Pending'),
(6, 1006, 'Credit Card', 'Completed');

-- TOTAL REVENUE QUERY:
select sum(total_price) as total_revenue
from order_items ;
-- TOTAL ORDER COUNT
select count(*) as total_order
from orders;
-- AVERAGE ORDER VALUE 
select avg(order_total) as avg_order_value 
FROM (
    SELECT order_id, SUM(total_price) AS order_total
    FROM order_items
    GROUP BY order_id
) AS order_summary;
-- TOP SELLING PRODUCT
select product_id ,sum(quantity)as total_sold 
FROM order_items
group by product_id
order by total_sold desc
limit 1;
-- revenue per product
SELECT product_id, SUM(total_price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC;
-- Top spending customers
SELECT 
    c.customer_id,
    c.name,
    SUM(oi.total_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

SELECT product_id, SUM(total_price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC;
-- repeated customer
select
customer_id,
count(order_id) as total_order
from orders
group by customer_id
having count(order_id)>1;
-- city-wise revenue
select
c.city ,
sum(oi.total_price) as revenue
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on  o.order_id =oi.order_id
group by c.city
order by revenue desc;
-- lost revenue
select
sum(oi.total_price) as lost_revenue
from orders o
join order_items oi on o.order_id =oi.order_id
where o.status ='cancelled';
-- Customer Lifetime Value
SELECT 
    c.customer_id,
    c.name,
    SUM(oi.total_price) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
ORDER BY lifetime_value DESC

-- Monthly revenue trend
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(oi.total_price) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;