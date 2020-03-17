SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--1
SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.gender,
  salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no

--2
SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3
SELECT departments.dept_no,
  departments.dept_name,
  dept_manager.emp_no,
  employees.last_name,
  employees.first_name,
  dept_manager.from_date,
  dept_manager.to_date
FROM ((departments
INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no)
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no);

--4
SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  departments.dept_name
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no);

--5
SELECT * FROM employees
WHERE first_name = 'Hercules'
  AND last_name LIKE 'B%';

--6
SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  departments.dept_name
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales';

--7
SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  departments.dept_name
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales'
  OR departments.dept_name = 'Development';

--8
SELECT last_name, COUNT(last_name) AS "surname"
FROM employees
GROUP BY last_name
ORDER BY "surname" DESC;
