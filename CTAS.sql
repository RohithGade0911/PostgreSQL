CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL,
  salary INTEGER NOT NULL
);

INSERT INTO employees (name, department, salary) VALUES
('John Doe', 'Sales', 50000),
('Jane Smith', 'Marketing', 60000),
('Bob Johnson', 'Finance', 70000),
('Karen Williams', 'Sales', 55000),
('Mike Johnson', 'Marketing', 65000),
('Sarah Lee', 'Finance', 75000);

SELECT * FROM employees;


CREATE TABLE employee_salary_70 AS
SELECT *
FROM employees
WHERE salary >= 70000;

SELECT * FROM employee_salary_70;
