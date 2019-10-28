
--Queries

--1. List the following details of each employee: employee number, last name, first name, gender, and salary. 

select e.emp_no,last_name,first_name, gender, salary 
from employees as e
JOIN salaries as s ON
e.emp_no = s.emp_no;

--2.List employees who were hired in 1986.


select 
last_name,
first_name,
EXTRACT (YEAR FROM hire_date) AS "Hired_in"
from employees
where
EXTRACT (YEAR FROM hire_date) = 1986
;


--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

	
select d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name,m.from_date,m.to_date 
from employees as e
	natural join dept_manager as m
	natural join departments as d;
	
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

	
select e.emp_no,e.last_name,e.first_name,d.dept_name 
from employees as e
	natural join dept_emp as de
	natural join departments as d
	order by d.dept_name;
	
--5. List all employees whose first name is "Hercules" and last names begin with "B."
 
	
select emp_no,last_name,first_name 
 from employees
 where last_name like 'B%' and first_name ='Hercules';
	
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name,d.dept_name 
from employees as e
	natural join dept_emp as de
	natural join departments as d
	where d.dept_name = 'Sales';
	
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name,d.dept_name 
from employees as e
	natural join dept_emp as de
	natural join departments as d
	where d.dept_name in ('Sales' , 'Development')
	Order by d.dept_name;
	
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) 
from employees
group by last_name
order by last_name DESC;
	