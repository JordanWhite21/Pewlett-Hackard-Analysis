departments
-
dept_no VARCHAR PK
dept_name VARCHAR

dept_emp
-
emp_no INT FK >- employees.emp_no
dept_no VARCHAR FK >- salaries.emp_no
from_date DATE
to_date DATE

Manager
-
dept_no VARCHAR FK >- departments.dept_no
emp_no INT FK >- employees.emp_no
from_date DATE
to_date DATE

employees
-
emp_no INT PK FK >- salaries.emp_no
birth_date DATE
first_name VARCHAR
last_name VARCHAR
gender VARCHAR
hire_date DATE

salaries
-
emp_no INT FK >- titles.emp_no
salary INT
from_date DATE
to_date DATE

titles
-
emp_no INT FK >- employees.emp_no
title VARCHAR
from_date DATE
to_date DATE