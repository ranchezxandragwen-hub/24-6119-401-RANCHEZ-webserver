CREATE DATABASE school;
USE school;
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    year_level INT
    );
INSERT INTO students (name, course, year_level)
    VALUES
    ('Juan Dela Cruz','BSIT',1),
    ('Maria Santos','BSCS',2),
    ('Pedro Reyes','BSIT',3);
SELECT*FROM students;
SELECT*FROM students 
    WHERE course ='BSIT';
SELECT*FROM students
    WHERE year_level >=2;
INSERT INTO students(name,course, year_level)
    VALUES('Xandra Gwen Ranchez','BSIT',3);
UPDATE students
    SET year_level = 2
    WHERE name = 'Juan Dela Cruz';
 DELETE FROM students
    WHERE name = 'Pedro Reyes';
CREATE TABLE courses(
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR (100),
    description VARCHAR(255),
    units INT
    );
INSERT INTO courses (course_name,description,units)
    VALUES
    ('CIT17','Web Information System',3),
    ('ÇIT6','Capstone 1',3),
    ('CC13','Systems Analysis and Design',3),
    ('CC6','Emerging Technologies',3),
    ('CC17','Mobile Application Design and Development',3);
SELECT*FROM courses;
