CREATE TABLE employee (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  age INTEGER,
  salary NUMERIC,
  position VARCHAR(50)
);

INSERT INTO employee (name, age, salary, position) VALUES
('John Doe', 25, 2500, 'Developer'),
('Jane Smith', 30, 3500, 'Manager'),
('Bob Johnson', 45, 5000, 'Director'),
('Mike Brown', 22, 2000, 'Intern');


SELECT * FROM employee;


SELECT name, salary,
CASE
WHEN salary < 3000 THEN 'low'
WHEN salary BETWEEN 3000 AND 4000 THEN 'medium'
ELSE 'high'
END
AS salary_range
FROM employee;



SELECT
CASE
WHEN salary < 3000 THEN 'low'
WHEN salary BETWEEN 3000 AND 4000 THEN 'medium'
ELSE 'high'
END
AS salary_range,
COUNT(*)
FROM employee
GROUP BY salary_range;




