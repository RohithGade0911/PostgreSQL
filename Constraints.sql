CREATE TABLE student(
id int PRIMARY KEY,
name varchar(50),
age int,
gender varchar(10)
);

INSERT INTO student (id, name, age, gender)
VALUES (2, 'Ajiz', 21, 'Male');

SELECT * FROM student;

ALTER TABLE student ADD COLUMN cid int;

UPDATE student SET cid=1;

UPDATE student SET cid=2 WHERE id=2;


CREATE TABLE course(
cid int PRIMARY KEY,
name varchar(50),
duration int
);

DROP TABLE student;


CREATE TABLE student(
id int PRIMARY KEY,
name varchar(50),
age int,
gender varchar(10),
cid int,
FOREIGN KEY (cid) REFERENCES course(cid)
);


INSERT INTO course (cid, name, duration)
VALUES (1, 'hi', 10);

INSERT INTO student (id, name, age, gender, cid)
VALUES (1,'Abi', 21, 'Male', 1);

SELECT * FROM student;
SELECT * FROM course;




