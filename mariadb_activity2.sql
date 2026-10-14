DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    year_level INT
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    description VARCHAR(255),
    units INT
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

ALTER TABLE enrollments
ADD COLUMN enrollment_date DATE;

INSERT INTO students (name, course, year_level) VALUES
('Juan Dela Cruz','BSIT',1),
('Maria Santos','BSCS',2),
('Xandra Gwen Ranchez','BSIT',3),
('Pedro Penduko','BSDA',2),
('Katelynne Salapong','BSIT',3),
('Nicole Tibayan','BSIT',3),
('Janelle Villanueva','BSIT',3),
('Charles Carling','BSCS',2),
('Marian Dela Cruz','BSDA',1);

INSERT INTO courses (course_name, description, units) VALUES
('TECHNO 100','Technopreneurship',3),
('CC17','Mobile Application Design and Development',3),
('CIT17','Web Information System',3),
('CC6','Emerging Technologies',3),
('CIT6','Capstone Project 1',3),
('HIST 101','The Life and Works of Rizal',3),
('ENGL 100','Purposive Communication',3),
('CC21','Introduction to ERP',3),
('CC10','Introduction to Networks',3),
('CIT5','Accouting Essesntials',3);

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1,1, '2026-10-14'),
(1,2, '2026-10-14'),
(3,4, '2026-10-14'),
(2,8, '2026-10-14'),
(5,10, '2026-10-14'),
(1,8, '2026-10-14'),
(3,5, '2026-10-14'),
(3,10, '2026-10-14'),
(7,9, '2026-10-14'),
(9,6, '2026-10-14');

SELECT s.id, s.name, s.course AS program, c.course_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'CC10';

SELECT c.course_id, c.course_name, c.description, c.units
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON e.student_id = s.id 
WHERE s.name = 'Xandra Gwen Ranchez';

SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM courses c 
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM courses c 
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY student_count DESC;

SELECT * FROM students
ORDER BY name ASC;

SELECT COUNT(*) AS total_enrollments
FROM enrollments;