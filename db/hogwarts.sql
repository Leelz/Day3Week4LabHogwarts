DROP TABLE students;
DROP TABLE houses;

CREATE TABLE students (
id SERIAL8 PRIMARY KEY,
first_name VARCHAR(255),
second_name VARCHAR(255),
house VARCHAR(255),
age INT4 
-- add in house id
);

CREATE TABLE houses (
id SERIAL8 PRIMARY KEY,
house_name VARCHAR(255),
logo VARCHAR(255)
)