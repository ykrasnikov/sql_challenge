-- CREATE AND IMPORT  TABLES 
DROP TABLE IF EXISTS department;
CREATE TABLE department (
    dept_no VARCHAR(50) PRIMARY KEY,
    dept_name VARCHAR   NOT NULL
);

DROP TABLE IF EXISTS title;
CREATE TABLE title (
    title_id VARCHAR PRIMARY KEY,
    title varchar   NOT NULL
);

DROP TABLE IF EXISTS employee;
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

DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
    emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
    dept_no VARCHAR(50),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);
SELECT *
FROM dept_emp;

DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
    dept_no VARCHAR(50),
    emp_no INT ,
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

SELECT *
FROM dept_manager;

DROP TABLE IF EXISTS salary;
CREATE TABLE salary (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);
SELECT *
FROM  salary;


-- QUERIES
--1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT e.emp_no,e.last_name, e.first_name,e.sex,s.salary
FROM employee AS e
JOIN salary AS s ON e.emp_no=s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT last_name,first_name,hire_date
FROM employee 
WHERE hire_date > '1985-12-31'::date
AND hire_date < '1987-01-01'::date
ORDER BY hire_date;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name,m.emp_no,e.last_name, e.first_name
FROM department AS d
JOIN dept_manager AS m ON d.dept_no=m.dept_no
JOIN employee AS e ON m.emp_no=e.emp_no
ORDER BY e.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

-- we will create view , as this type of query appears 2 more times
CREATE VIEW employee_department AS
SELECT e.emp_no,e.last_name, e.first_name,d.dept_name
FROM employee AS e
JOIN dept_emp AS de ON e.emp_no=de.emp_no
JOIN department AS d ON de.dept_no=d.dept_no;
ORDER BY e.emp_no;

SELECT *
FROM employee_department;

-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."

SELECT first_name,last_name,sex
FROM employee 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name;

-- 6. List all employees in the Sales department, including 
-- their employee number, last name, first name, and department name.

SELECT *
FROM employee_department
WHERE dept_name LIKE 'Sales';

-- 7. List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.
SELECT *
FROM employee_department
WHERE dept_name LIKE 'Sales'
OR dept_name LIKE 'Devel%';

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employee
GROUP BY last_name
ORDER BY last_name_count DESC;