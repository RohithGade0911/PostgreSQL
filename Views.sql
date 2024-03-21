CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    item TEXT,
    quantity INT,
    price NUMERIC(10,2)
);

INSERT INTO customers (customer_id, first_name, last_name)
VALUES (102, 'John', 'Doe');

INSERT INTO orders (order_id, customer_id, order_date, item, quantity, price)
VALUES (1, 101, '2022-01-01', 'Shoes', 2, 50);


CREATE VIEW customer_order_view AS
SELECT customers.customer_id, first_name, last_name, order_date, item, quantity, price
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id;

SELECT * FROM customer_order_view;





