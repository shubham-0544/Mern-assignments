create database sunbeam_db;
use sunbeam_db;

CREATE TABLE USERS (
email varchar(20) primary key,
password varchar (10),
role enum ("admin", "student","teacher")
); 

 drop table users;
 
INSERT INTO USERS VALUES ('shubh@example.com', 'shubh123', 'admin')
INSERT INTO users VALUES ('rahul@example.com', 'rahul789', 'student');
INSERT INTO users VALUES ('pooja@example.com', 'pooja456', 'teacher');
INSERT INTO users VALUES ('aman@example.com', 'aman321', 'student');
INSERT INTO users VALUES ('neha@example.com', 'neha999', 'teacher');

select * from USERS;


CREATE TABLE students (
    reg_no int primary key,
    sname varchar(50),
    mobile_no int,
    email varchar(50),
    course_id int,
    profile_pic blob,
        FOREIGN KEY (email) REFERENCES users(email),
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
  
INSERT INTO students VALUES (001, 'ajay', 0000098, 'shubh@gmail.com', 107, NULL);
INSERT INTO students VALUES (002, 'rahul', 9876543210, 'rahul@example.com', 102, NULL);
INSERT INTO students VALUES (003, 'pooja', 9123456780, 'pooja@example.com', 103, NULL);
INSERT INTO students VALUES (004, 'kiran', 9988776655, 'aman@example.com', 104, NULL);
INSERT INTO students VALUES (005, 'neha', 9090909090, 'neha@example.com', 105, NULL);


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255),
    description VARCHAR(500),
    fees INT,
    start_date DATE,
    end_date DATE,
    video_expire_days INT
); 

INSERT INTO courses VALUES (101, 'MERN STACK', 'internship', 5000, '2025-12-10', '2026-01-05', 32);
INSERT INTO courses VALUES (102, 'JAVA FULL STACK', 'internship', 6000, '2025-12-15', '2026-02-10', 45);
INSERT INTO courses VALUES (103, 'PYTHON DATA SCIENCE', 'training', 5500, '2025-12-20', '2026-02-05', 40);
INSERT INTO courses VALUES (104, 'WEB DEVELOPMENT', 'training', 4000, '2025-12-18', '2026-01-25', 30);
INSERT INTO courses VALUES (105, 'C++ PROGRAMMING', 'training', 3500, '2025-12-12', '2026-01-15', 25);
select * from courses;

create table videos(
video_id int primary key,
course_id int,
title varchar(50),
description varchar(50),
youtube_url varchar(50),
added_at date,
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO videos VALUES (1, 101, 'Introduction to MERN', 'Basics of MERN stack', 'https://youtu.be/m1', '2025-12-10');
INSERT INTO videos VALUES (2, 102, 'Java OOP Concepts', 'Core OOP principles in Java', 'https://youtu.be/j2', '2025-12-15');
INSERT INTO videos VALUES (3, 103, 'Python for Data Science', 'Intro to data analysis', 'https://youtu.be/p3', '2025-12-20');
INSERT INTO videos VALUES (4, 104, 'HTML & CSS Basics', 'Web development fundamentals', 'https://youtu.be/w4', '2025-12-18');
INSERT INTO videos VALUES (5, 105, 'C++ Fundamentals', 'Introduction to C++', 'https://youtu.be/c5', '2025-12-12');
 select * from videos;

 -- Q1 --
select *
from courses
where start_date > curdate();

 -- Q2 --
 select 
    students.reg_no,
    students.name,
    students.email,
    students.mobile_no,
    courses.course_name
from students
join courses 
    on students.course_id = courses.course_id;
    
    -- Q3 --
SELECT 
    s.*,
    c.*
FROM students s
LEFT JOIN courses c ON s.course_id = c.course_id
WHERE s.email = 'shubh@example.com';


-- Q4 --
SELECT 
    c.course_id,
    c.course_name,
    c.start_date,
    c.end_date,
    c.video_expire_days,
    v.video_id,
    v.title,
    v.added_at
FROM students s
JOIN courses c 
    ON s.course_id = c.course_id
JOIN videos v
    ON v.course_id = c.course_id
WHERE s.email = 'student_email_here'
  AND DATE_ADD(v.added_at, INTERVAL c.video_expire_days DAY) >= CURDATE();