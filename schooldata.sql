------------------------------------------------------------
-- Use same date format style as the sample file
------------------------------------------------------------
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-RR';

------------------------------------------------------------
-- DEPARTMENT
-- assumed: DEPARTMENT(department_id, name)
------------------------------------------------------------
INSERT INTO department (department_id, dname) VALUES (10, 'Computer Science');
INSERT INTO department (department_id, dname) VALUES (20, 'Mathematics');
INSERT INTO department (department_id, dname) VALUES (30, 'Physics');
INSERT INTO department (department_id, dname) VALUES (40, 'English');

------------------------------------------------------------
-- ADVISOR
-- assumed: ADVISOR(advisor_id, fname, minit, lname, department_id)
------------------------------------------------------------
INSERT INTO advisor (advisor_id, fname, minit, lname, department_id) 
VALUES (9001, 'Alice',  'R', 'Adams', 10);

INSERT INTO advisor (advisor_id, fname, minit, lname, department_id) 
VALUES (9002, 'Brian',  'K', 'Baker', 20);

------------------------------------------------------------
-- PROFESSOR
-- assumed: PROFESSOR(professor_id, fname, minit, lname, age, birthday, department_id)
------------------------------------------------------------
INSERT INTO professor (professor_id, fname, minit, lname, age, birthday, department_id)
VALUES (5001, 'Helen', 'J', 'Hughes', 52, '14-MAR-73', 10);

INSERT INTO professor (professor_id, fname, minit, lname, age, birthday, department_id)
VALUES (5002, 'Carl',  'D', 'Campbell', 47, '09-SEP-78', 20);

INSERT INTO professor (professor_id, fname, minit, lname, age, birthday, department_id)
VALUES (5003, 'Irene', 'M', 'Ibarra', 61, '02-DEC-64', 30);

INSERT INTO professor (professor_id, fname, minit, lname, age, birthday, department_id)
VALUES (5004, 'David', 'L', 'Dorsey', 45, '21-JAN-80', 40);

------------------------------------------------------------
-- STUDENT
-- assumed: STUDENT(student_id, fname, minit, lname, age, birthday,
--                  department_id, advisor_id)
------------------------------------------------------------
INSERT INTO student (student_id, fname, minit, lname, birthday, age, department_id)
VALUES (1001, 'John',   'A', 'Smith', '12-AUG-06', 19, 10);

INSERT INTO student (student_id, fname, minit, lname, birthday, age, department_id)
VALUES (1002, 'Kevin',   'B', 'Smath', '13-AUG-06', 19, 10);

INSERT INTO student (student_id, fname, minit, lname, birthday, age, department_id)
VALUES (1003, 'Tasha',   'C', 'Smuth', '14-AUG-06', 19, 10);

INSERT INTO student (student_id, fname, minit, lname, birthday, age, department_id)
VALUES (1004, 'Jerome',   'D', 'Jones', '15-AUG-06', 19, 10);

INSERT INTO student (student_id, fname, minit, lname, birthday, age, department_id)
VALUES (1005, 'Alex',   'E', 'Smeth', '16-AUG-06', 19, 10);

------------------------------------------------------------
-- BOOKSTORE
-- assumed: BOOKSTORE(store_id, name)
------------------------------------------------------------
INSERT INTO bookstore (store_id, sname)
VALUES (3001, 'Campus Bookstore North');

INSERT INTO bookstore (store_id, sname)
VALUES (3002, 'Campus Bookstore South');

------------------------------------------------------------
-- COURSE
-- assumed: COURSE(course_id, name, department_id)
------------------------------------------------------------
INSERT INTO course (course_id, cname, department_id)
VALUES (4001, 'Intro to Programming',     10);

INSERT INTO course (course_id, cname, department_id)
VALUES (4002, 'Data Structures',          10);

INSERT INTO course (course_id, cname, department_id)
VALUES (4003, 'Discrete Mathematics',     20);

INSERT INTO course (course_id, cname, department_id)
VALUES (4004, 'Linear Algebra',           20);

INSERT INTO course (course_id, cname, department_id)
VALUES (4005, 'General Physics I',        30);

INSERT INTO course (course_id, cname, department_id)
VALUES (4006, 'Technical Writing for CS', 40);

------------------------------------------------------------
-- ENROLLMENT (enrolls_in)
-- assumed: ENROLLMENT(student_id, course_id, enroll_date)
------------------------------------------------------------
INSERT INTO enrollment (student_id, course_id, enroll_date)
VALUES (1001, 4001, '20-AUG-24');

INSERT INTO enrollment (student_id, course_id, enroll_date)
VALUES (1001, 4003, '20-AUG-24');

INSERT INTO enrollment (student_id, course_id, enroll_date)
VALUES (1002, 4001, '20-AUG-24');

INSERT INTO enrollment (student_id, course_id, enroll_date)
VALUES (1002, 4002, '20-AUG-24');

INSERT INTO enrollment (student_id, course_id, enroll_date)
VALUES (1003, 4003, '20-AUG-24');

INSERT INTO enrollment (student_id, course_id, enroll_date)
VALUES (1003, 4004, '20-AUG-24');

INSERT INTO enrollment (student_id, course_id, enroll_date)
VALUES (1004, 4005, '20-AUG-24');

INSERT INTO enrollment (student_id, course_id, enroll_date)
VALUES (1005, 4006, '20-AUG-24');

------------------------------------------------------------
-- TEACHES
-- assumed: TEACHES(professor_id, course_id)
------------------------------------------------------------
INSERT INTO teaches (professor_id, course_id) VALUES (5001, 4001);
INSERT INTO teaches (professor_id, course_id) VALUES (5001, 4002);
INSERT INTO teaches (professor_id, course_id) VALUES (5002, 4003);
INSERT INTO teaches (professor_id, course_id) VALUES (5002, 4004);
INSERT INTO teaches (professor_id, course_id) VALUES (5003, 4005);
INSERT INTO teaches (professor_id, course_id) VALUES (5004, 4006);

------------------------------------------------------------
-- GETS_BOOKS
-- assumed: GETS_BOOKS(student_id, store_id)
------------------------------------------------------------
INSERT INTO gets_books (student_id, store_id) VALUES (1001, 3001);
INSERT INTO gets_books (student_id, store_id) VALUES (1002, 3001);
INSERT INTO gets_books (student_id, store_id) VALUES (1003, 3001);
INSERT INTO gets_books (student_id, store_id) VALUES (1003, 3002);
INSERT INTO gets_books (student_id, store_id) VALUES (1004, 3002);
INSERT INTO gets_books (student_id, store_id) VALUES (1005, 3002);

------------------------------------------------------------
-- REQUESTS_FROM
-- assumed: REQUESTS_FROM(professor_id, store_id)
------------------------------------------------------------
INSERT INTO requests_from (professor_id, store_id) VALUES (5001, 3001);
INSERT INTO requests_from (professor_id, store_id) VALUES (5002, 3001);
INSERT INTO requests_from (professor_id, store_id) VALUES (5003, 3002);
INSERT INTO requests_from (professor_id, store_id) VALUES (5004, 3002);

------------------------------------------------------------
-- OFFERS
-- assumed: OFFERS(store_id, course_id)
------------------------------------------------------------
INSERT INTO offers (store_id, course_id) VALUES (3001, 4001);
INSERT INTO offers (store_id, course_id) VALUES (3001, 4002);
INSERT INTO offers (store_id, course_id) VALUES (3001, 4003);
INSERT INTO offers (store_id, course_id) VALUES (3002, 4004);
INSERT INTO offers (store_id, course_id) VALUES (3002, 4005);
INSERT INTO offers (store_id, course_id) VALUES (3002, 4006);

------------------------------------------------------------
-- OPTIONAL: if you modeled Student–Advisor as a separate table
-- WORKS_WITH(student_id, advisor_id)
------------------------------------------------------------
INSERT INTO works_with (student_id, professor_id, advisor_id) VALUES (1001, 5001, 9001);
INSERT INTO works_with (student_id, professor_id, advisor_id) VALUES (1002, 5002, 9002);
INSERT INTO works_with (student_id, professor_id, advisor_id) VALUES (1003, 5003, 9002);
INSERT INTO works_with (student_id, professor_id, advisor_id) VALUES (1004, 5004, 9001);
INSERT INTO works_with (student_id, professor_id, advisor_id) VALUES (1005, 5004, 9001);

