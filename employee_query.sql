
-- QUERIES
--1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT e.emp_no,e.last_name, e.first_name,e.sex,s.salary
FROM employee AS e
JOIN salary AS s ON e.emp_no=s.emp_no
ORDER BY s.salary DESC;

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
DROP VIEW employee_department;

CREATE VIEW employee_department AS
SELECT e.emp_no,e.last_name, e.first_name,d.dept_name
FROM employee AS e
JOIN dept_emp AS de ON e.emp_no=de.emp_no
JOIN department AS d ON de.dept_no=d.dept_no
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

--9. Bonus Query
SELECT t.title, ROUND(AVG(s.salary),2) AS avg_salary
FROM employee AS e
JOIN salary AS s ON e.emp_no=s.emp_no
JOIN title AS t ON e.emp_title_id=t.title_id
GROUP BY t.title
ORDER BY avg_salary;

SELECT ROUND(AVG(s.salary),2)
FROM employee AS e
JOIN salary AS s ON e.emp_no=s.emp_no
JOIN title AS t ON e.emp_title_id=t.title_id
WHERE t.title LIKE 'Senior S%';

