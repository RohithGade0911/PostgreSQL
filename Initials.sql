CREATE TABLE sales(
id int,
sales_date date,
product varchar(255),
quantity int,
revenue decimal(10,2)
);

INSERT INTO sales (id, sales_date, product, quantity, revenue)
VALUES (1, '2021-01-01', 'Product A', 10, 100.00)

SELECT * FROM sales;

INSERT INTO sales (id, sales_date, product, quantity, revenue)
VALUES
  (2, '2021-01-02', 'Product B', 5, 50.00),
  (3, '2021-01-03', 'Product C', 15, 150.00),
  (4, '2021-01-04', 'Product A', 8, 80.00),
  (5, '2021-01-05', 'Product B', 12, 120.00),
  (6, '2021-01-06', 'Product C', 20, 200.00),
  (7, '2021-01-07', 'Product A', 6, 60.00),
  (8, '2021-01-08', 'Product B', 18, 180.00),
  (9, '2021-01-09', 'Product C', 10, 100.00),
  (10, '2021-01-10', 'Product A', 4, 40.00);
  
SELECT * FROM sales;
  
SELECT * FROM sales WHERE product = 'Product A'; -- shows all the data with product name Product A
  
SELECT sales_date, SUM(revenue) FROM sales
GROUP BY sales_date;  -- shows total revenue for each day

SELECT product, SUM(revenue) FROM sales
GROUP BY product
ORDER BY SUM(revenue) DESC;  -- retrives total revenue for each product, in Descending order
  
SELECT product, SUM(quantity) FROM sales
GROUP BY product
ORDER BY SUM(quantity) DESC;  -- retrives top-selling products in descending order by quantity sold

--OPERATORS

SELECT * FROM sales WHERE product = 'Product B';

SELECT * FROM sales WHERE product != 'Product B'
AND quantity > 10;

SELECT * FROM sales WHERE sales_date BETWEEN '2021-01-01' AND '2021-01-05';

SELECT * FROM sales WHERE product LIKE 'Pro%';


ALTER TABLE sales RENAME COLUMN quantity TO quantities;

SELECT * FROM sales;

ALTER TABLE sales ADD COLUMN email VARCHAR(255);

ALTER TABLE sales ALTER COLUMN id TYPE BIGINT;

ALTER TABLE sales DROP COLUMN email;

ALTER TABLE sales ALTER COLUMN id SET NOT NULL;

ALTER TABLE sales ALTER COLUMN sales_date SET NOT NULL;

ALTER TABLE sales ADD CONSTRAINT unique_id UNIQUE (id);

INSERT INTO sales (id, sales_date, product, quantities, revenue)
VALUES
  (12, '2021-01-02', 'Product B', 5, 50.00);
  







