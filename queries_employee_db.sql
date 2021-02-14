-- Query One employee number, last name, first name, sex, salary
SELECT employee.emp_no,
  employee.last_name,
  employee.first_name,
  employee.sex,
  salaries.salary
FROM salaries
INNER JOIN employee ON
employee.emp_no = salaries.emp_no
limit 10

-- Query Two first name, last name, hire date (In 1986)
SELECT employee.first_name,
  employee.last_name,
  employee.hire_date
FROM employee
WHERE hire_date BETWEEN '1985-12-31' AND '1987-01-01'
limit 10

-- Query Three first name, last name, hire date (In 1986)
SELECT department_managers.dept_no, 
departments.dept_name,
department_managers.emp_no,
employee.last_name, 
employee.first_name
FROM department_managers
LEFT JOIN departments
ON department_managers.dept_no = departments.dept_no
LEFT JOIN employee 
ON department_managers.emp_no = employee.emp_no
ORDER BY dept_name
-- limit 10



-- Query Four employee id, last name, first name, department name
--*************************************

SELECT employee.emp_no,
  employee.last_name,
  employee.first_name,
  departments.dept_name  
FROM employee
INNER JOIN dept_emp ON employee.emp_no = dept_emp.emp_no 
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
ORDER BY dept_name


-- Query Five first name, last name, sex, 
-- Last name begins wih "B" and First name is "Hercules"

SELECT employee.first_name,
  employee.last_name,
  employee.sex
FROM employee
WHERE last_name like 'B%'
AND first_name = 'Hercules'

-- Query Six first name, last name, sex, Department = Sales

SELECT employee.first_name,
  employee.last_name,
  departments.dept_name  
FROM employee
INNER JOIN dept_emp ON employee.emp_no = dept_emp.emp_no 
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
AND dept_name = 'Sales'
ORDER BY last_name


-- Query Seven first name, last name, sex, Department = Sales and Development

SELECT employee.first_name,
  employee.last_name,
  departments.dept_name  
FROM employee
INNER JOIN dept_emp ON employee.emp_no = dept_emp.emp_no 
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
AND  dept_name = 'sales' or dept_name = 'Development'
ORDER BY dept_name desc 
   

-- Query Eight last name, count by
SELECT last_name,
count(last_name) 
from employee
group by last_name
order by 2 desc

  