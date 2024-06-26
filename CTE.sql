CREATE TABLE employees (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   salary INTEGER NOT NULL
);

INSERT INTO employees (name, salary) VALUES
   ('John Doe', 45000),
   ('Jane Smith', 55000),
   ('Bob Johnson', 65000),
   ('Alice Lee', 75000);
   
   SELECT * FROM employees;
   
   
/*We can create a CTE that selects all employees 
whose salary is greater than or equal to $50,000.*/

WITH cte AS (
SELECT * FROM employees 
	WHERE salary > 50000
)
SELECT * FROM cte;


DROP TABLE employees;


/*Let's join two tables*/


CREATE TABLE departments (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

INSERT INTO departments (name) VALUES
   ('Sales'),
   ('Marketing'),
   ('IT');

CREATE TABLE employees (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   department_id INTEGER NOT NULL
);

INSERT INTO employees (name, department_id) VALUES
   ('John Doe', 1),
   ('Jane Smith', 2),
   ('Bob Johnson', 1),
   ('Alice Lee', 3);
   

/* create a CTE that joins the two tables and 
selects the name of each employee and the name of their department.*/


WITH employee_cte AS (
	SELECT * FROM employees
	WHERE department_id =1
)
SELECT * FROM employee_cte e 
JOIN departments d ON e.department_id = d.id;

/*OR*/


WITH employee_cte AS(
	SELECT * FROM employees e 
	JOIN departments d ON e.department_id = d.id
)
SELECT * FROM employee_cte;



/*Multiple SELECT CTE*/

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price INTEGER NOT NULL
);

CREATE TABLE sales (
  id SERIAL PRIMARY KEY,
  item_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  sale_date DATE NOT NULL
);

INSERT INTO items (name, price) VALUES
  ('Product A', 100),
  ('Product B', 200),
  ('Product C', 300);

INSERT INTO sales (item_id, quantity, sale_date) VALUES
  (1, 10, '2022-01-01'),
  (2, 5, '2022-01-01'),
  (3, 2, '2022-01-01'),
  (1, 20, '2022-02-01'),
  (2, 10, '2022-02-01'),
  (3, 4, '2022-02-01'),
  (1, 30, '2022-03-01'),
  (2, 15, '2022-03-01'),
  (3, 6, '2022-03-01');
  

SELECT * FROM sales;
SELECT * FROM items;

/*create a CTE that selects the total number of items sold and 
the total revenue generated by the store for each month.*/

SELECT s.sale_date, s.quantity, i.price FROM sales s
JOIN items i ON i.id = s.item_id;


SELECT 
EXTRACT('month' FROM s.sale_date) AS sale_month, 
s.quantity, i.price 
FROM sales s
JOIN items i ON i.id = s.item_id;


SELECT 
EXTRACT('month' FROM s.sale_date) AS sale_month, 
SUM(s.quantity * i.price) AS revenue
FROM sales s
JOIN items i ON i.id = s.item_id
GROUP BY sale_month
ORDER BY revenue DESC;


WITH monthly_revenue AS(
SELECT 
EXTRACT('month' FROM s.sale_date) AS sale_month, 
SUM(s.quantity * i.price) AS revenue
FROM sales s
JOIN items i ON i.id = s.item_id
GROUP BY sale_month
),
monthly_items_sold AS(
	SELECT EXTRACT('month' FROM sale_date) AS sale_month,
	SUM(quantity) AS item_sold
	FROM sales
	GROUP BY sale_month
)

SELECT mr.sale_month, mr.revenue, mis.item_sold 
FROM monthly_revenue mr
JOIN monthly_items_sold mis ON mr.sale_month = mis.sale_month
ORDER BY mr.sale_month ASC;








