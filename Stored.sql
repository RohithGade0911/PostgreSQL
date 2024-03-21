CREATE TABLE sales (
  id SERIAL PRIMARY KEY,
  product_name TEXT,
  category TEXT,
  price NUMERIC,
  quantity INTEGER,
  sale_date DATE
);

INSERT INTO sales (product_name, category, price, quantity, sale_date)
VALUES
  ('iPad', 'Electronics', 799, 3, '2022-01-01'),
  ('MacBook', 'Electronics', 1299, 2, '2022-01-02'),
  ('iPhone', 'Electronics', 699, 5, '2022-01-03'),
  ('Samsung TV', 'Electronics', 999, 1, '2022-01-04'),
  ('Nike Shoes', 'Apparel', 99, 10, '2022-01-05');
  
  
SELECT * FROM sales;

DROP FUNCTION get_average_price;

CREATE OR REPLACE FUNCTION get_average_price (category_name TEXT)
RETURNS INT
AS $$
BEGIN
RETURN(SELECT AVG(price) FROM sales WHERE category = category_name);
END;
$$ LANGUAGE plpgsql;


SELECT get_average_price('Electronics');


SELECT product_name, CAST(AVG(get_average_price(category)) AS INT)
FROM sales
GROUP BY product_name;


CREATE OR REPLACE FUNCTION get_total_sales (product_name TEXT, month TEXT)
RETURNS NUMERIC
AS $$
BEGIN
RETURN (SELECT SUM(price * quantity) FROM sales WHERE product_name = product_name AND date_trunc('month', sale_date) = to_date(month, 'Month'));
END;
$$ LANGUAGE plpgsql;


SELECT product_name, get_total_sales(product_name, 'January') as total_sales
FROM sales
WHERE category = 'Electronics';


CREATE OR REPLACE FUNCTION get_total_sale(p_product_name TEXT, p_month TEXT)
RETURNS NUMERIC
AS $$
BEGIN
  RETURN (
    SELECT SUM(price * quantity) 
    FROM sales 
    WHERE product_name = p_product_name 
      AND date_trunc('month', sale_date) = date_trunc('month', to_date(p_month || ' 1', 'Month DD'))
  );
END;
$$ LANGUAGE plpgsql;

SELECT product_name, get_total_sale(product_name, 'January') as total_sales
FROM sales
WHERE category = 'Electronics';





