------------------------------------------------------------
-- DROP OLD TABLES (RELATIONSHIPS FIRST, THEN ENTITIES)
------------------------------------------------------------
DROP TABLE enrollment      CASCADE CONSTRAINTS;
DROP TABLE teaches         CASCADE CONSTRAINTS;
DROP TABLE gets_books      CASCADE CONSTRAINTS;
DROP TABLE requests_from   CASCADE CONSTRAINTS;
DROP TABLE offers          CASCADE CONSTRAINTS;
DROP TABLE works_with      CASCADE CONSTRAINTS;

DROP TABLE course          CASCADE CONSTRAINTS;
DROP TABLE bookstore       CASCADE CONSTRAINTS;
DROP TABLE student         CASCADE CONSTRAINTS;
DROP TABLE professor       CASCADE CONSTRAINTS;
DROP TABLE department      CASCADE CONSTRAINTS;

------------------------------------------------------------
-- DEPARTMENT
-- From ER: Department (department_id, Name)
------------------------------------------------------------
CREATE TABLE department (
  department_id  NUMBER(4),
  dname          VARCHAR2(40) NOT NULL,
  PRIMARY KEY (department_id),
  UNIQUE (dname)
);

------------------------------------------------------------
-- PROFESSOR
-- From ER: Professor (professor_id, Name, birthday, age) 
-- belongs_to Department
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
-- From ER: Student (student_id, Name, birthday, age)
-- works_with Professor (advisor), belongs to Department
-- (I’m keeping works_with as a separate relationship table,
-- so advisor_id itself lives there, not here.)
------------------------------------------------------------
CREATE TABLE student (
  student_id     NUMBER(6),
  fname          VARCHAR2(15) NOT NULL,
  minit          VARCHAR2(1),
  lname          VARCHAR2(15) NOT NULL,
  birthday       DATE,
  age            NUMBER(3),
  department_id  NUMBER(4) NOT NULL,
  PRIMARY KEY (student_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);

------------------------------------------------------------
-- BOOKSTORE
-- From ER: Bookstore (store_id, Name)
------------------------------------------------------------
CREATE TABLE bookstore (
  store_id  NUMBER(4),
  sname     VARCHAR2(40) NOT NULL,
  PRIMARY KEY (store_id),
  UNIQUE (sname)
);

------------------------------------------------------------
-- COURSE
-- From ER: Course (course_id, Name)
-- assumed: each Course is offered by exactly one Department
------------------------------------------------------------
CREATE TABLE course (
  course_id      NUMBER(6),
  cname          VARCHAR2(40) NOT NULL,
  department_id  NUMBER(4) NOT NULL,
  PRIMARY KEY (course_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);

------------------------------------------------------------
-- ENROLLMENT  (enrolls_in)
-- Relationship: Student N : M Course
-- Attribute: Date (enroll_date)
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
-- WORKS_WITH
-- Relationship: Student works_with Professor
-- Attribute: advisor_id (stored here, but logically same domain
-- as professor_id)
------------------------------------------------------------
CREATE TABLE works_with (
  student_id   NUMBER(6),
  professor_id NUMBER(6),
  advisor_id   NUMBER(6),
  PRIMARY KEY (student_id, professor_id),
  FOREIGN KEY (student_id)   REFERENCES student(student_id),
  FOREIGN KEY (professor_id) REFERENCES professor(professor_id)
  -- advisor_id could also be declared as FK to professor(professor_id)
  -- if you want to enforce that it must be a valid professor ID:
  -- , FOREIGN KEY (advisor_id) REFERENCES professor(professor_id)
);

------------------------------------------------------------
-- TEACHES
-- Relationship: Professor teaches Course (M:N)
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
-- Relationship: Student gets_books from Bookstore (M:N)
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
-- Relationship: Professor requests_from Bookstore (M:N)
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
-- Relationship: Bookstore offers Course (M:N)
-- (Using Bookstore–Course for OFFERS; Department–Course is
-- already captured by course.department_id.)
------------------------------------------------------------
CREATE TABLE offers (
  store_id   NUMBER(4),
  course_id  NUMBER(6),
  PRIMARY KEY (store_id, course_id),
  FOREIGN KEY (store_id)  REFERENCES bookstore(store_id),
  FOREIGN KEY (course_id) REFERENCES course(course_id)
);
