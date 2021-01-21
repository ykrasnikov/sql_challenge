-- CREATE AND IMPORT  TABLES 

-- 1. title table
DROP TABLE IF EXISTS title;
--
CREATE TABLE title (
    title_id VARCHAR(50) PRIMARY KEY,
    title varchar   NOT NULL
);

SELECT *
FROM title;

-- 2. employee table
DROP TABLE IF EXISTS employee;
--
CREATE TABLE employee (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(50),
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR(50)   NOT NULL,
    hire_date DATE   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);
SELECT *
FROM employee;

-- 3. department table
DROP TABLE IF EXISTS department;
--
CREATE TABLE department (
    dept_no VARCHAR(50) PRIMARY KEY,
    dept_name VARCHAR   NOT NULL
);

-- 4. dept_emp table
-- table below is many to many JUNCTION TABLE - PK is counter-productive !!! Serial PK would be better
-- BUT AS REQUESTED CREATED COMPOSITE KEY
-- below u can see query showing departments with count of employees working in more than one department

DROP TABLE IF EXISTS dept_emp;
--
CREATE TABLE dept_emp (
    emp_no INT ,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
    dept_no VARCHAR(50),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);
-- cross employee query
WiTH double_count AS (
	SELECT emp_no, COUNT( emp_no) AS counts
	FROM dept_emp 
	GROUP BY emp_no
	ORDER BY counts DESC) 
SELECT dept_no, COUNT(dept_no) AS "cross department emploee count"
FROM dept_emp
WHERE emp_no IN ( 
	SELECT emp_no
	FROM double_count
	WHERE counts >1)
GROUP BY dept_no
ORDER BY "cross department emploee count" DESC;

-- 5. dept_manager table
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
    dept_no VARCHAR(50),
    emp_no INT ,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

SELECT *
FROM dept_manager;
-- no cross department managers 
WITH double_counts AS(
	SELECT emp_no, COUNT( emp_no) AS counts
	FROM dept_manager 
	GROUP BY emp_no)
SELECT dept_no
FROM dept_manager 
WHERE emp_no IN (
	SELECT emp_no 
	FROM double_counts
	WHERE counts>1); 
	
-- 6. salary table	
DROP TABLE IF EXISTS salary;
CREATE TABLE salary (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);
SELECT *
FROM  salary;
-- confirm one to many with employee 
SELECT salary, COUNT(salary) AS counts
FROM salary
GROUP BY salary
ORDER BY counts DESC;
