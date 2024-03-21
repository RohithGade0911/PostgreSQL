CREATE TABLE employees (
id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
department VARCHAR(50) NOT NULL
);

CREATE TABLE salaries (
id INT PRIMARY KEY,
employee_id INTEGER NOT NULL,
salary INTEGER NOT NULL
);

INSERT INTO employees (id,name, department)
VALUES (1,'John Smith', 'Sales'),
       (2,'Jane Doe', 'Marketing'),
       (3,'Bob Brown', 'Sales'),
       (5,'Sarah Anderson', 'Marketing');

INSERT INTO salaries (id,employee_id, salary)
VALUES (1, 1, 50000),
       (2, 2, 60000),
       (3, 3, 70000),
	     (4, 4, 80000);


SELECT * FROM employees;
SELECT * FROM salaries;


-- INNER JOIN

SELECT * FROM employees as e
INNER JOIN salaries as s ON e.id = s.employee_id;


SELECT e.id, e.name, e.department, s.salary
FROM employees as e
INNER JOIN salaries as s ON e.id = s.employee_id;


-- LEFT JOIN

SELECT * FROM employees as e
LEFT JOIN salaries as s ON e.id = s.employee_id;


SELECT e.id, e.name, e.department, s.salary
FROM employees as e
LEFT JOIN salaries as s ON e.id = s.employee_id;


-- RIGHT JOIN

SELECT * FROM employees as e
RIGHT JOIN salaries as s ON e.id = s.employee_id;


SELECT e.id, e.name, e.department, s.salary
FROM employees as e
RIGHT JOIN salaries as s ON e.id = s.employee_id;

-- FULL OUTER JOIN

SELECT * FROM employees as e
FULL OUTER JOIN salaries as s ON e.id = s.employee_id;


SELECT e.id, e.name, e.department, s.salary
FROM employees as e
FULL OUTER JOIN salaries as s ON e.id = s.employee_id;


-- CROSS JOIN (rarely used)

SELECT e.name, s.salary
FROM employees as e
CROSS JOIN salaries as s;


--SELF JOIN

CREATE TABLE Employee(
emp_id SERIAL PRIMARY KEY,
emp_name VARCHAR(50),
emp_manager_id INTEGER
);

INSERT INTO Employee (emp_name, emp_manager_id) VALUES
('John', NULL),
('Jane', 1),
('Bob', 2),
('Alice', 2),
('Mike', 3);

SELECT * FROM Employee;

SELECT e1.emp_id, e1.emp_name, e1.emp_manager_id, e2.emp_name, e2.emp_manager_id FROM Employee e1
LEFT JOIN employee e2 ON e1.emp_id = e2.emp_manager_id;

SELECT e1.emp_id, e1.emp_name, e2.emp_name FROM Employee e1
LEFT JOIN employee e2 ON e1.emp_id = e2.emp_manager_id;


CREATE TABLE Ecommerce(
order_id SERIAL PRIMARY KEY,
user_id INTEGER,
product VARCHAR(50)
);

INSERT INTO Ecommerce (user_id, product) VALUES
(1,'Shoes'),
(2,'T-Shirt'),
(3,'Jeans'),
(1,'Socks'),
(2,'Pants'),
(1,'Hat');


SELECT * FROM Ecommerce;

SELECT * FROM Ecommerce 
ORDER BY user_id ASC;

SELECT * FROM Ecommerce e1
LEFT JOIN Ecommerce e2 ON e1.user_id = e2.user_id AND e1.order_id <> e2.order_id;

SELECT e1.user_id, e1.product, e2.product FROM Ecommerce e1
LEFT JOIN Ecommerce e2 ON e1.user_id = e2.user_id AND e1.order_id <> e2.order_id;



