CREATE TEMPORARY TABLE temp_employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    department VARCHAR(100) NOT NULL
);

INSERT INTO temp_employee (name, age, department)
VALUES
    ('John Doe', 30, 'Sales'),
    ('Jane Smith', 25, 'Marketing'),
    ('Bob Johnson', 45, 'IT');

SELECT * FROM temp_employee;

-- To display the temporary table
SELECT * FROM pg_catalog.pg_tables
WHERE tablename = 'temp_employee';


