SELECT * FROM departments;
SELECT * FROM dept_employee;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
/*2.List the following details of each employee: employee number, last name, first name, gender, and salary*/
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
From employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- /*3.List employees who were hired in 1986*/
SELECT first_name, last_name FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
-- LIKE '1986%'
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--SELECT * FROM dept_employee
/*4.list the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name, 
and start and end employment dates.*/

SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments AS d
INNER JOIN dept_manager AS m ON 
d.dept_no = m.dept_no
INNER JOIN employees AS e ON
m.emp_no = e.emp_no;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
/*5.List all employees whose first name is "Hercules" and last names begin with "B."*/

SELECT first_name , last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
/*6.List all employees in the Sales department, 
including their employee number, last name, first name, and department name*/


SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM dept_employee AS de
JOIN departments AS d ON
de.dept_no = d.dept_no 
JOIN employees AS e ON
de.emp_no = e.emp_no
WHERE d.dept_no = 'd007';
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
/*7.List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/

SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM dept_employee AS de
JOIN departments AS d ON
de.dept_no = d.dept_no 
JOIN employees AS e ON
de.emp_no = e.emp_no
WHERE d.dept_no = 'd007' OR d.dept_no ='d005';
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
/*8.In descending order, list the frequency count of employee last names, i.e., 
how many employees share each last name.*/

SELECT last_name,COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
