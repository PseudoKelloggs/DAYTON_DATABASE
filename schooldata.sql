------------------------------------------------------------
-- DROP OLD TABLES (relationships first, then entities)
------------------------------------------------------------
DROP TABLE enrollment    CASCADE CONSTRAINTS;
DROP TABLE teaches       CASCADE CONSTRAINTS;
DROP TABLE gets_books    CASCADE CONSTRAINTS;
DROP TABLE requests_from CASCADE CONSTRAINTS;
DROP TABLE offers        CASCADE CONSTRAINTS;
DROP TABLE works_with    CASCADE CONSTRAINTS;

DROP TABLE student       CASCADE CONSTRAINTS;
DROP TABLE professor     CASCADE CONSTRAINTS;
DROP TABLE advisor       CASCADE CONSTRAINTS;
DROP TABLE course        CASCADE CONSTRAINTS;
DROP TABLE bookstore     CASCADE CONSTRAINTS;
DROP TABLE department    CASCADE CONSTRAINTS;

------------------------------------------------------------
-- DEPARTMENT
-- matches: INSERT INTO department (department_id, name) ...
------------------------------------------------------------
CREATE TABLE department (
  department_id  NUMBER(4),
  name           VARCHAR2(40) NOT NULL,
  PRIMARY KEY (department_id),
  UNIQUE (name)
);

------------------------------------------------------------
-- ADVISOR
-- matches: INSERT INTO advisor (advisor_id, fname, minit, lname, department_id)
------------------------------------------------------------
CREATE TABLE advisor (
  advisor_id     NUMBER(6),
  fname          VARCHAR2(15) NOT NULL,
  minit          VARCHAR2(1),
  lname          VARCHAR2(15) NOT NULL,
  department_id  NUMBER(4) NOT NULL,
  PRIMARY KEY (advisor_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);

------------------------------------------------------------
-- PROFESSOR
-- matches: INSERT INTO professor (professor_id, fname, minit, lname,
--                                age, birthday, department_id)
------------------------------------------------------------
CREATE TABLE professor (
  professor_id   NUMBER(6),
  fname          VARCHAR2(15) NOT NULL,
  minit          VARCHAR2(1),
  lname          VARCHAR2(15) NOT NULL,
  birthday       DATE,
  age            NUMBER(3),
  department_id  NUMBER(4) NOT NULL,
  PRIMARY KEY (professor_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);

------------------------------------------------------------
-- STUDENT
-- matches: INSERT INTO student (student_id, fname, minit, lname,
--                               age, birthday, department_id, advisor_id)
------------------------------------------------------------
CREATE TABLE student (
  student_id     NUMBER(6),
  fname          VARCHAR2(15) NOT NULL,
  minit          VARCHAR2(1),
  lname          VARCHAR2(15) NOT NULL,
  age            NUMBER(3),
  birthday       DATE,
  department_id  NUMBER(4) NOT NULL,
  advisor_id     NUMBER(6),
  PRIMARY KEY (student_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id),
  FOREIGN KEY (advisor_id)    REFERENCES advisor(advisor_id)
);

------------------------------------------------------------
-- BOOKSTORE
-- matches: INSERT INTO bookstore (store_id, name) ...
------------------------------------------------------------
CREATE TABLE bookstore (
  store_id  NUMBER(4),
  name      VARCHAR2(40) NOT NULL,
  PRIMARY KEY (store_id),
  UNIQUE (name)
);

------------------------------------------------------------
-- COURSE
-- matches: INSERT INTO course (course_id, name, department_id) ...
------------------------------------------------------------
CREATE TABLE course (
  course_id      NUMBER(6),
  name           VARCHAR2(40) NOT NULL,
  department_id  NUMBER(4) NOT NULL,
  PRIMARY KEY (course_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);

------------------------------------------------------------
-- ENROLLMENT (enrolls_in)
-- matches: INSERT INTO enrollment (student_id, course_id, enroll_date)
------------------------------------------------------------
CREATE TABLE enrollment (
  student_id   NUMBER(6),
  course_id    NUMBER(6),
  enroll_date  DATE,
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (course_id)  REFERENCES course(course_id)
);

------------------------------------------------------------
-- TEACHES
-- matches: INSERT INTO teaches (professor_id, course_id)
------------------------------------------------------------
CREATE TABLE teaches (
  professor_id  NUMBER(6),
  course_id     NUMBER(6),
  PRIMARY KEY (professor_id, course_id),
  FOREIGN KEY (professor_id) REFERENCES professor(professor_id),
  FOREIGN KEY (course_id)    REFERENCES course(course_id)
);

------------------------------------------------------------
-- GETS_BOOKS
-- matches: INSERT INTO gets_books (student_id, store_id)
------------------------------------------------------------
CREATE TABLE gets_books (
  student_id  NUMBER(6),
  store_id    NUMBER(4),
  PRIMARY KEY (student_id, store_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (store_id)   REFERENCES bookstore(store_id)
);

------------------------------------------------------------
-- REQUESTS_FROM
-- matches: INSERT INTO requests_from (professor_id, store_id)
------------------------------------------------------------
CREATE TABLE requests_from (
  professor_id  NUMBER(6),
  store_id      NUMBER(4),
  PRIMARY KEY (professor_id, store_id),
  FOREIGN KEY (professor_id) REFERENCES professor(professor_id),
  FOREIGN KEY (store_id)     REFERENCES bookstore(store_id)
);

------------------------------------------------------------
-- OFFERS
-- matches: INSERT INTO offers (store_id, course_id)
------------------------------------------------------------
CREATE TABLE offers (
  store_id   NUMBER(4),
  course_id  NUMBER(6),
  PRIMARY KEY (store_id, course_id),
  FOREIGN KEY (store_id)  REFERENCES bookstore(store_id),
  FOREIGN KEY (course_id) REFERENCES course(course_id)
);
