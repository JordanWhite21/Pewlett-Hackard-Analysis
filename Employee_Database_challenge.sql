-- 1. Retrieve the emp_no, first_name, last_name columns from the Employees table.
SELECT employees.emp_no,
    employees.first_name,
employees.last_name
FROM employees;

-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT titles.title,
	titles.from_date,
	titles.to_date
FROM titles;

-- 3. Create a new table using the INTO clause.
-- 4. Join both tables on the primary key.
-- 5. Filter the data on the birth_data column to retrieve the employees who were born between 1952 and 1955. 
-- Then, order by the eimployee number.
SELECT titles.title,
	employees.first_name,
	employees.last_name,
	titles.emp_no,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM titles
INNER JOIN employees
ON (titles.emp_no = employees.emp_no);

SELECT * FROM retirement_titles;

SELECT titles.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM titles
INNER JOIN employees
ON (titles.emp_no = employees.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

-- count the number of employees by their most recent job title
SELECT COUNT (unique_titles.emp_no),unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

SELECT Distinct On(employees.emp_no)employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship_eligibliltiy
FROM employees
Left outer Join dept_emp
on (employees.emp_no = dept_emp.emp_no)
Left outer Join titles
on (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER by employees.emp_no;

SELECT * FROM mentorship_eligibliltiy;