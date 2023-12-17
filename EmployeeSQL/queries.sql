-- Data Analysis

-- List the employee number, last name, first name, sex, and salary of each employee
SELECT employee.employee_no, last_name, first_name, sex, salary 
FROM employee
JOIN salary
ON employee.employee_no = salary.employee_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employee
WHERE CAST(hire_date AS TEXT) LIKE '1986%';

-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name
SELECT m.department_no, d.department_name, m.employee_no, e.last_name, e.first_name
FROM manager AS m
JOIN department AS d
ON m.department_no = d.department_no
JOIN employee AS e
ON m.employee_no = e.employee_no;

-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name
SELECT de.department_no, de.employee_no, e.last_name, e.first_name, d.department_name
FROM department_employee AS de
JOIN employee AS e
ON de.employee_no = e.employee_no
JOIN department AS d
ON de.department_no = d.department_no
ORDER BY de.employee_no;

-- List first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, 
-- including their employee number, last name, and first name
SELECT employee_no, last_name, first_name 
FROM employee
WHERE employee_no IN
(SELECT employee_no
 FROM department_employee
 WHERE department_no IN
  (SELECT department_no
   FROM department
   WHERE department_name = 'Sales'));
   
-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name
SELECT de.employee_no, e.last_name, e.first_name, d.department_name 
FROM department_employee as de 
JOIN employee as e
ON de.employee_no = e.employee_no
JOIN department as d
ON de.department_no = d.department_no
WHERE d.department_name = 'Sales' OR d.department_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(last_name) AS "Frequency Count"
FROM employee
GROUP BY last_name
ORDER BY "Frequency Count" DESC;