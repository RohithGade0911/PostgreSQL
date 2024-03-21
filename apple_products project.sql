SELECT * FROM apple_product;

SELECT COUNT(*) FROM apple_product;

SELECT AVG(mrp) FROM apple_product;

SELECT MAX(mrp) FROM apple_product;

SELECT MIN(mrp) FROM apple_product;

SELECT * FROM apple_product WHERE ram='4 GB' AND star_rating > 4.0 AND mrp < 50000;