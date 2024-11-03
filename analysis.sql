--Check data import
SELECT * FROM departments limit 5;
SELECT * FROM employee limit 5;
SELECT * FROM salaries limit 5;
SELECT * FROM dept_emp limit 5;
SELECT * FROM dept_manager limit 5;
SELECT * FROM titles limit 5;

--List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee AS e
INNER JOIN salaries AS s ON e.emp_no=s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date FROM employee
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT dm.dept_no, d.dept_name,dm.emp_no,e.last_name, e.first_name
FROM dept_manager AS dm
 JOIN departments AS d ON dm.dept_no=d.dept_no
 JOIN employee AS e ON dm.emp_no=e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
 JOIN departments AS d ON de.dept_no=d.dept_no
 JOIN employee AS e ON de.emp_no=e.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
SELECT first_name, last_name, sex FROM employee
WHERE first_name ='Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name 
SELECT de.emp_no, e.last_name, e.first_name FROM dept_emp AS de
JOIN employee AS e ON de.emp_no = e.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
 
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employee AS e ON de.emp_no = e.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS name_count FROM employee 
GROUP BY last_name
ORDER BY name_count DESC;
