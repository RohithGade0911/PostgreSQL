CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date TIMESTAMP,
    customer_name VARCHAR(255),
    total_amount NUMERIC(10,2)
);


INSERT INTO orders (order_date, customer_name, total_amount) VALUES
('2022-01-01 10:00:00', 'John Doe', 100.00),
('2022-01-02 12:30:00', 'Jane Smith', 200.50),
('2022-01-03 14:45:00', 'Bob Johnson', 50.25),
('2022-01-04 20:15:00', 'Sara Lee', 75.80);


SELECT * FROM orders;



SELECT CAST(order_date AS date), order_date 
FROM orders;

SELECT CAST(order_date AS date), order_date, CAST(order_date AS time)
FROM orders;

SELECT id, order_date,
EXTRACT(HOUR FROM order_date) AS order_hour,
EXTRACT(MINUTE FROM order_date) AS order_minute,
EXTRACT(DAY FROM order_date) AS order_day,
EXTRACT(MONTH FROM order_date) AS order_month,
EXTRACT(YEAR FROM order_date) AS order_year
FROM orders;


SELECT id,order_date,
order_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/Los_Angeles' AS order_date_pst
FROM orders;




