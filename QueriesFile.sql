--1
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees 
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN  '1986-01-01' AND '1986-12-31';


SELECT departements.dept_no,
	departements.dept_name,
	employees.emp_no,
	employees.last_name, 
	employees.first_name,
	titles.title	
FROM employees
	INNER JOIN titles
	 ON (titles.title_id = employees.emp_title_id)
	INNER JOIN dept_emp
	 ON (dept_emp.emp_no = employees.emp_no)
	INNER JOIN departements
	ON (departements.dept_no = dept_emp.dept_no)       
WHERE titles.title = 'Manager';


SELECT employees.emp_no,
	   dept_emp.dept_no,
	   employees.last_name,
	   employees.first_name,
	   departements.dept_name
FROM employees
	INNER JOIN dept_emp
		ON (dept_emp.emp_no = employees.emp_no)
	INNER JOIN departements
		ON (departements.dept_no = dept_emp.dept_no);
	

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        departements.dept_name
FROM employees
    INNER JOIN dept_emp
        ON (employees.emp_no = dept_emp.emp_no)
    INNER JOIN departements
        ON (dept_emp.dept_no = departements.dept_no)
WHERE departements.dept_name = 'Sales'
ORDER BY employees.emp_no;


SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
		departements.dept_name
FROM employees
    INNER JOIN dept_emp
        ON (employees.emp_no = dept_emp.emp_no)
		INNER JOIN departements
		ON (departements.dept_no = dept_emp.dept_no)
WHERE departements.dept_name IN ('Sales','Development');


SELECT last_name, count(*)
FROM employees
GROUP BY last_name
ORDER BY COUNT (last_name) DESC; 
