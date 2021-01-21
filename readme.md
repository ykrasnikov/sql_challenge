# sql-challenge

SQL Homework - Employee Data Base

<img src="images/anaconda.gif" align="left" height="200"/>
<img src="images/panda.gif" align="right" height="200"/>
<img src="images/sql.png" align="center" height="200"/>



_______________________

## Part 1. Data Engineering

Based on analysis of  provided 6 CSV files:
created database ERD and individual table schemas
PDF file with tables schemas - [documentation_employee_db](documentation_employee_db.pdf)

<img src="images/erd_employee_db.png" align="center" height="300"/>

Imported each CSV file into the corresponding SQL table.
SQL file with tables schemas - [employee_schemata](employee_schemata.sql)

_________________
## Part2. Data Analysis

Queries 

SQL file with queries - [employee_query](employee_query.sql)

### 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

<img src="images/query1.png" align="center" height="300"/>

___________________

### 2. List first name, last name, and hire date for employees who were hired in 1986.

<img src="images/query2.png" align="center" height="300"/>

______________________

### 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

<img src="images/query3.png" align="center" height="300"/>

___________________

### 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

<img src="images/query4.png" align="center" height="300"/>

__________________

### 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

<img src="images/query5.png" align="center" height="300"/>

___________________

### 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

<img src="images/query6.png" align="center" height="300"/>

_________________

### 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

<img src="images/query7.png" align="center" height="300"/>

_____________

### 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

<img src="images/query8.png" align="center" height="300"/>

___________________

## Part 3 Bonus (Optional)

###  bonus query for python part.

<img src="images/query9.png" align="center" height="300"/>

_______________

### 1. Import the SQL database into Pandas.

Python Jupiter Notebook - [employee_db](employee_db.ipynb)
___________________


### 2. Create a histogram to visualize the most common salary ranges for employees.
#### Histogram 50 bins
<img src="images/salary_hist_50.png" align="center" height="300"/>

-----------------

#### Histogram 200 bins
<img src="images/salary_hist_200.png" align="center" height="300"/>

________________

### 3. Create a bar chart of average salary by title.
#### Barchart
<img src="images/avg_salary.png" align="center" height="300"/>

