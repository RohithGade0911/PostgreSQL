CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  age INTEGER,
  marks FLOAT(2)
);

INSERT INTO students (name, age, marks) VALUES
  ('John', 20, 78.5),
  ('Jane', 22, 89.2),
  ('Peter', 21, 92.3),
  ('Mary', 23, 86.7),
  ('David', 19, 73.9);
  
  
SELECT * FROM students;


SELECT age,marks::int FROM students;
SELECT CAST(age AS text), CAST(marks AS int) FROM students;


SELECT EXTRACT(day from CAST('2022-01-01' AS date));



