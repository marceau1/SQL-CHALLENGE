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

select * 
from dept_manager;

