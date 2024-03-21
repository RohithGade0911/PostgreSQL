CREATE TABLE customer_orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50),
order_date DATE,
order_amount DECIMAL(10,2)
);

INSERT INTO customer_orders (order_id, customer_name, order_date, order_amount) VALUES
(1, 'John', '2021-01-01', 100),
(2, 'Jane', '2021-01-02', 200),
(3, 'John', '2021-01-03', 50),
(4, 'Jane', '2021-01-04', 300),
(5, 'John', '2021-01-05', 150);


SELECT * FROM customer_orders;

SELECT * FROM customer_orders
ORDER BY order_amount DESC;


SELECT c.customer_name, SUM(order_amount) as Total_Amount FROM customer_orders c
GROUP BY customer_name
ORDER BY Total_Amount ASC;


SELECT c.customer_name, SUM(order_amount) as Total_Amount FROM customer_orders c
GROUP BY customer_name
HAVING SUM(order_amount) > 400;


SELECT c.customer_name, AVG(order_amount) as Total_Amount FROM customer_orders c
GROUP BY customer_name;

SELECT c.customer_name, COUNT(*) as Total_Amount FROM customer_orders c
GROUP BY customer_name;



