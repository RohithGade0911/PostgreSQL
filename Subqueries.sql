CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    customer_email VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO customers (customer_name, customer_email) VALUES
    ('John Doe', 'johndoe@example.com'),
    ('Jane Smith', 'janesmith@example.com'),
    ('Bob Johnson', 'bobjohnson@example.com');

INSERT INTO orders (customer_id, order_date, order_amount) VALUES
    (1, '2021-01-01', 50.00),
    (1, '2021-02-01', 75.00),
    (2, '2021-02-15', 125.00),
    (3, '2021-03-01', 200.00);
	

SELECT * FROM customers;
SELECT * FROM orders;


-- SUBQUERY

/*We want to retrieve the names of customers who have 
placed orders with an amount greater than $100.*/

SELECT customer_id FROM orders WHERE order_amount > 100;

SELECT customer_name FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE order_amount > 100);


/* Let's say we want to retrieve the customer_name, email, 
and the total number of orders they have placed.*/

SELECT customer_name, customer_email,
(SELECT COUNT(*) FROM orders WHERE orders.customer_id = customers.customer_id) as total_orders,
(SELECT SUM(order_amount) FROM orders WHERE orders.customer_id = customers.customer_id) as total_amount
FROM customers;


/*Let's say we want to retrieve the customer name 
and the average order amount for customers who have placed orders.*/

SELECT * 
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;


SELECT customer_name, order_amount
FROM
(SELECT * 
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id) AS cust_orders;



SELECT customer_name, AVG(order_amount) as avg_order_amount
FROM
(SELECT * 
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id) AS cust_orders
GROUP BY customer_name;

