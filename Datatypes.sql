CREATE TABLE temperature_logs (
	id integer,
	timestamp_val timestamp,
	temperature real
);

INSERT INTO temperature_logs (id, timestamp_val, temperature)
VALUES (1, '2022-01-01 12:00:00', 25.5);

SELECT * FROM temperature_logs; 

CREATE TABLE customer(
	id integer,
	name varchar(255),
	email varchar(255)
);

INSERT INTO customer (id, name, email)
VALUES (123, 'John Smith', 'john.smith@example.com');

SELECT * FROM customer;

CREATE TABLE sample(
	id integer,
	name varchar(255),
	dob date,
	interested boolean

)

INSERT INTO sample (id, name, dob, interested)
VALUES (123, 'Ck', '2000-02-01', true);

SELECT * FROM sample;
