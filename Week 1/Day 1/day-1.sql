-- CREATE


CREATE DATABASE practice_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name TEXT NOT NULL,
    department TEXT NOT NULL,
    gpa NUMERIC(3,2) NOT NULL CHECK(gpa >= 0.00 AND gpa <= 4.00)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    name TEXT NOT NULL,
    credit_hours INT NOT NULL CHECK(credit_hours >= 1 AND credit_hours <= 3)
);

CREATE TABLE enrollments (
    student_id INT, 
    course_id INT, 
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);



-- INSERT

INSERT INTO students (student_id, name, department, gpa) VALUES

(201, 'James Wilson', 'Mechanical Engineering', 3.40),
(202, 'Sophia Martinez', 'Mechanical Engineering', 2.85),
(203, 'Liam Anderson', 'Mechanical Engineering', 3.10),
(204, 'Mia Thomas', 'Mechanical Engineering', 3.65),
(205, 'Noah Jackson', 'Mechanical Engineering', 2.25),
(206, 'Ava White', 'Mechanical Engineering', 3.90),
(207, 'Lucas Harris', 'Mechanical Engineering', 3.05),
(208, 'Harper Martin', 'Mechanical Engineering', 2.70),


(209, 'Ethan Thompson', 'Computer Science', 3.80),
(210, 'Isabella Garcia', 'Computer Science', 3.15),
(211, 'Oliver Martinez', 'Computer Science', 2.60),
(212, 'Amelia Robinson', 'Computer Science', 3.92),
(213, 'Elijah Clark', 'Computer Science', 3.45),
(214, 'Charlotte Rodriguez', 'Computer Science', 2.95),
(215, 'William Lewis', 'Computer Science', 3.70),
(216, 'Chloe Lee', 'Computer Science', 3.10),


(217, 'Mason Walker', 'Chemical Engineering', 3.30),
(218, 'Evelyn Hall', 'Chemical Engineering', 2.80),
(219, 'Logan Allen', 'Chemical Engineering', 3.55),
(220, 'Abigail Young', 'Chemical Engineering', 3.60),
(221, 'Alexander King', 'Chemical Engineering', 2.45),
(222, 'Emily Wright', 'Chemical Engineering', 3.88),
(223, 'Jacob Scott', 'Chemical Engineering', 3.12),
(224, 'Elizabeth Torres', 'Chemical Engineering', 2.90),


(225, 'Michael Nguyen', 'Management Sciences', 3.25),
(226, 'Sofia Hill', 'Management Sciences', 3.75),
(227, 'Daniel Flores', 'Management Sciences', 2.65),
(228, 'Avery Green', 'Management Sciences', 3.40),
(229, 'Henry Adams', 'Management Sciences', 3.00),
(230, 'Ella Baker', 'Management Sciences', 3.95),
(231, 'Sebastian Gonzalez', 'Management Sciences', 2.10),
(232, 'Camila Nelson', 'Management Sciences', 3.50),


(233, 'Jackson Carter', 'Cyber Security', 3.60),
(234, 'Scarlett Mitchell', 'Cyber Security', 3.15),
(235, 'Sebastian Perez', 'Cyber Security', 2.80),
(236, 'Victoria Roberts', 'Cyber Security', 3.72),
(237, 'Matthew Turner', 'Cyber Security', 3.33),
(238, 'Madison Phillips', 'Cyber Security', 2.50),
(239, 'David Campbell', 'Cyber Security', 3.89),
(240, 'Luna Parker', 'Cyber Security', 3.05);



INSERT INTO courses (course_id, name, credit_hours) VALUES
(601, 'Thermodynamics', 3),
(602, 'Fluid Mechanics', 3),
(603, 'Database Systems', 3),
(604, 'Web Development', 3),
(605, 'Organic Chemistry', 3),
(606, 'Chemical Reactor Design', 3),
(607, 'Principles of Management', 2),
(608, 'Corporate Finance', 3),
(609, 'Network Security', 3),
(610, 'Ethical Hacking', 3),
(611, 'Technical Writing', 1),
(612, 'Professional Ethics', 1);



INSERT INTO enrollments (student_id, course_id) VALUES

(201, 601), (201, 602), (201, 611),
(202, 601), (202, 602), (202, 612),
(203, 601), (203, 602), (203, 611),
(204, 601), (204, 602), (204, 612),
(205, 601), (205, 602), (205, 611),
(206, 601), (206, 602), (206, 612),
(207, 601), (207, 602), (207, 611),
(208, 601), (208, 602), (208, 612),


(209, 603), (209, 604), (209, 611),
(210, 603), (210, 604), (210, 612),
(211, 603), (211, 604), (211, 611),
(212, 603), (212, 604), (212, 612),
(213, 603), (213, 604), (213, 611),
(214, 603), (214, 604), (214, 612),
(215, 603), (215, 604), (215, 611),
(216, 603), (216, 604), (216, 612),

(217, 605), (217, 606), (217, 611),
(218, 605), (218, 606), (218, 612),
(219, 605), (219, 606), (219, 611),
(220, 605), (220, 606), (220, 612),
(221, 605), (221, 606), (221, 611),
(222, 605), (222, 606), (222, 612),
(223, 605), (223, 606), (223, 611),
(224, 605), (224, 606), (224, 612),

(225, 607), (225, 608), (225, 611),
(226, 607), (226, 608), (226, 612),
(227, 607), (227, 608), (227, 611),
(228, 607), (228, 608), (228, 612),
(229, 607), (229, 608), (229, 611),
(230, 607), (230, 608), (230, 612),
(231, 607), (231, 608), (231, 611),
(232, 607), (232, 608), (232, 612),

(233, 609), (233, 610), (233, 611),
(234, 609), (234, 610), (234, 612),
(235, 609), (235, 610), (235, 611),
(236, 609), (236, 610), (236, 612),
(237, 609), (237, 610), (237, 611),
(238, 609), (238, 610), (238, 612),
(239, 609), (239, 610), (239, 611),
(240, 609), (240, 610), (240, 612);




-- TASKS


-- 1. Task: Retrieve the names and GPAs of all students in the 'Computer Science' department.

SELECT 
    name, gpa 
FROM students 
WHERE department = 'Computer Science' 
ORDER BY student_id;


-- 2. Find all courses that offer exactly 3 credit hours.

SELECT 
    name
FROM courses 
WHERE credit_hours = 3;

-- 3. List all students sorted by their GPA from highest to lowest.

SELECT
    name, gpa, department
FROM students
ORDER BY gpa DESC;

-- 4. Find the average GPA of students for each department.

SELECT 
    department, AVG(gpa)::NUMERIC(3,2)
FROM students
GROUP BY department;

-- 5. Count how many students have a GPA greater than or equal to 3.50.

SELECT 
    COUNT(*)::INT
FROM students
WHERE gpa >= 3.50;

-- 6. Get a list of student names alongside the names of the courses they are enrolled in.

SELECT students.name, courses.name
FROM enrollments
INNER JOIN students ON students.student_id = enrollments.student_id
INNER JOIN courses ON courses.course_id = enrollments.course_id
ORDER BY students.name;

-- 7. List all courses along with the total number of students enrolled in each course.

SELECT 
    courses.name AS course_name, COUNT(student_id) AS students_enrolled
FROM enrollments
INNER JOIN courses ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.name;