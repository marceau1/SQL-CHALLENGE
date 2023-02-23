CREATE TABLE  titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)	
);

select * 
from titles;

CREATE TABLE  employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR  NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id)
	REFERENCES titles(title_id),
 	PRIMARY KEY (emp_no)
);

CREATE TABLE  salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
 	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)	
	PRIMARY KEY (emp_no)
);
	
select * 
from employees;

CREATE TABLE  departements(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no) 
); 

select * 
from departements;

CREATE TABLE  dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
 	FOREIGN KEY (dept_no) REFERENCES departements(dept_no)	
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	PRIMARY KEY(emp_n, dept_no)
);

select * 
from dept_emp;

CREATE TABLE  dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no)
	REFERENCES employees(emp_no),
 	FOREIGN KEY (dept_no)
	REFERENCES departements(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);


SELECT *
FROM departements;

SELECT *
FROM dept_emp;

SELECT *
FROM employees;

SELECT *
FROM salaries;

SELECT *
FROM titles;

SELECT *
FROM dept_manager;

SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees 
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;


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
--HAVING COUNT(*)>1
ORDER BY COUNT (last_name) DESC; 




