---1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select 

	e.emp_no, 
	e.last_name, 
	e.first_name, 
	s.salary, 
	e.gender 

from employees as e

inner join salaries as s

on e.emp_no = s.emp_no;

---2. List employees who were hired in 1986.

select 

    hire_date,
    emp_no, 
    first_name, 
    last_name 

from employees

where 

    extract(year from hire_date) = '1986';

--- 3. List the manager of each department with the following information:
---   department number, department name, 
---  the manager's employee number, 
---  last name, first name,
---  and start and end employment dates.

select 
	
	d.dept_no,
	d.dept_name,
	dm.emp_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	e.hire_date,
	dm.to_date
	
from departments as d

left join dept_manager as dm

on d.dept_no = dm.dept_no

left join employees as e 

on e.emp_no = dm.emp_no

---4. List the department of each employee with
--- the following information:
--- employee number, last name, first name,
--- and department name.

select 
	
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
	
from departments as d

left join dept_emp as de

on d.dept_no = de.dept_no

left join employees as e 

on e.emp_no = de.emp_no

---5. List all employees whose first name is 
---    "Hercules" and last names begin with "B."

select * from employees as e

where 

e.first_name = 'Hercules'

and

e.last_name like 'B%';

---6. List all employees in the 
--- Sales department, including their
--- employee number, last name, first name,
--- and department name.

select 
	
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
	
from departments as d

left join dept_emp as de

on d.dept_no = de.dept_no

left join employees as e 

on e.emp_no = de.emp_no

where d.dept_name = 'Sales';

---7. List all employees in the Sales and Development departments,
--- including their employee number, 
---last name, first name, and department name.

select 
	
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
	
from departments as d

left join dept_emp as de

on d.dept_no = de.dept_no

left join employees as e 

on e.emp_no = de.emp_no

where d.dept_name = 'Sales'
or d.dept_name = 'Development';

---8. In descending order,
--- list the frequency count of employee last names,
--- i.e., how many employees share each last name.

select count(last_name) as Name_Count, last_name 
from employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;