CREATE TABLE sales_data (
    id SERIAL PRIMARY KEY,
    date DATE,
    item TEXT,
    units_sold INTEGER,
    price_per_unit NUMERIC(10, 2)
);


INSERT INTO sales_data (date, item, units_sold, price_per_unit)
VALUES
    ('2021-01-01', 'apple', 10, 1.50),
    ('2021-01-02', 'banana', 20, 0.75),
    ('2021-01-03', 'orange', 15, 1.00),
    ('2021-01-04', 'apple', 12, 1.50),
    ('2021-01-05', 'banana', 18, 0.75),
    ('2021-01-06', 'orange', 20, 1.00),
    ('2021-01-07', 'apple', 8, 1.50),
    ('2021-01-08', 'banana', 22, 0.75),
    ('2021-01-09', 'orange', 10, 1.00);
	
	
SELECT * FROM sales_data;

SELECT item, units_sold,
RANK() OVER(ORDER BY units_sold ASC) unit_rank,
DENSE_RANK() OVER(ORDER BY units_sold ASC) unit_dense_rank,
ROW_NUMBER() OVER(ORDER BY units_sold ASC) unit_row_number
FROM sales_data;



SELECT item, units_sold,
LAG(units_sold) OVER(ORDER BY date) AS previous_unit,
LEAD(units_sold) OVER(ORDER BY date) AS later_unit
FROM sales_data;


