-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no as "Employee Number", last_name as "Last Name", first_name as "First Name", sex as "Sex", salary
from employees
INNER JOIN salaries
	ON employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select last_name as "Last Name", first_name as "First Name", hire_date as "Hire Date" from employees
where extract(year from hire_date) = 1986
order by "Hire Date", "Last Name"

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
select d.dept_no as "Department Number", 
		d.dept_name as "Department Name", 
		dm.emp_no as "Manager''s Employee Number", 
		e.last_name as "Last Name", 
		e.first_name as "First Name" 
from departments d
INNER JOIN dept_manager dm
	on d.dept_no = dm.dept_no
INNER JOIN employees e
	on dm.emp_no = e.emp_no
order by "Department Number", "Manager''s Employee Number"

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select de.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name" from dept_emp de
INNER JOIN employees e
	on e.emp_no = de.emp_no
INNER JOIN departments d
	on d.dept_no = de.dept_no
ORDER BY "Department Name", "Employee Number"

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name as "First Name", last_name as "Last Name", sex as "Sex"
from employees
where first_name = 'Hercules' and
	last_name ilike 'B%'
ORDER BY last_name

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dee.emp_no as "Employee Number", 
		e.last_name as "Last Name", 
		e.first_name as "First Name", 
		de.dept_name as "Department Name" 
from dept_emp dee
INNER JOIN departments de
	on dee.dept_no = de.dept_no
INNER JOIN employees e
	on e.emp_no = dee.emp_no
where de.dept_name = 'Sales'
order by "Employee Number"

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dee.emp_no as "Employee Number", 
		e.last_name as "Last Name", 
		e.first_name as "First Name", 
		de.dept_name as "Department Name" 
from dept_emp dee
INNER JOIN departments de
	on dee.dept_no = de.dept_no
INNER JOIN employees e
	on e.emp_no = dee.emp_no
where de.dept_name = 'Sales' or de.dept_name = 'Development'
order by "Department Name", "Employee Number"

-- 8. In descending "order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name as "Last Name", count(last_name) as "Count"
from employees
group by "Last Name"
order by "Count" DESC



















