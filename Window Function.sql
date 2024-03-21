DROP TABLE sales;

CREATE TABLE sales (
  date DATE,
  salesperson VARCHAR(50),
  sales_amount INT
);

INSERT INTO sales (date, salesperson, sales_amount)
VALUES
  ('2022-01-01', 'Alice', 1000),
  ('2022-01-01', 'Bob', 1500),
  ('2022-01-02', 'Alice', 2000),
  ('2022-01-02', 'Bob', 2500),
  ('2022-01-03', 'Alice', 3000),
  ('2022-01-03', 'Bob', 3500),
  ('2022-01-04', 'Alice', 4000),
  ('2022-01-04', 'Bob', 4500),
  ('2022-01-05', 'Alice', 5000),
  ('2022-01-05', 'Bob', 5500);
  
SELECT * FROM sales;
  
  
-- calculate the running total of sales over time for each salesperson.
  
SELECT salesperson, SUM(sales_amount) FROM sales
GROUP BY salesperson
; 


SELECT date, salesperson, sales_amount,
SUM(sales_amount) 
OVER (PARTITION BY salesperson
	  ORDER BY date ASC) AS running_total
FROM sales;


-- calculate the percentage of total sales for each salesperson and for each day.


SELECT date, salesperson, sales_amount,
100.0 * sales_amount / SUM(sales_amount) OVER (PARTITION BY salesperson, date) AS percentage
FROM sales;

