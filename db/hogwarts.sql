
DROP TABLE students;
DROP TABLE houses;


CREATE TABLE houses (
  id serial4 primary key,
  name varchar(255)
);


CREATE TABLE students (
  id serial4 primary key,
  first_name varchar(255),
  last_name varchar(255),
  age INT4,
  house_id INT4 REFERENCES houses(id)
);
