--6.1)
SELECT * FROM works_on

--6.2)
SELECT works_on.emp_no 
FROM works_on
WHERE works_on.job = 'clerk'

--6.3)
SELECT works_on.emp_no 
FROM works_on
WHERE works_on.project_no = 'p2'
AND works_on.emp_no < 20000

--6.4)
SELECT works_on.emp_no 
FROM works_on
WHERE YEAR(works_on.enter_date) <> 2007

--6.5)
SELECT works_on.emp_no 
FROM works_on
WHERE works_on.job IN ('analyst', 'manager') 
AND works_on.project_no = 'p1'

--6.6)
SELECT works_on.emp_no 
FROM works_on
WHERE works_on.project_no = 'p1'
AND works_on.job IS NULL

--6.7)
SELECT employee.emp_no , employee.emp_lname,  employee.emp_fname
FROM employee
WHERE employee.emp_fname LIKE '%t%t%'

--6.8)
SELECT employee.emp_no , employee.emp_lname,  employee.emp_fname
FROM employee
WHERE employee.emp_lname LIKE '_[oa]%es'

--6.9)
SELECT employee.emp_no
FROM department, employee
WHERE department.location = 'Seattle'
AND employee.dept_no = department.dept_no

--6.10)
SELECT employee.emp_fname, employee.emp_lname
FROM works_on, employee
WHERE works_on.enter_date = '04.01.2007'
AND works_on.emp_no = employee.emp_no

--6.11)
SELECT department.location
FROM department
GROUP BY department.location

--6.15)
SELECT MAX(employee.emp_no)
FROM employee

--6.16)
SELECT works_on.job, COUNT(works_on.emp_no)
FROM works_on
GROUP BY works_on.job
HAVING COUNT(works_on.emp_no) > 2

--6.17)
SELECT employee.emp_no
FROM employee
WHERE employee.dept_no = 'd3'
OR employee.emp_no IN 
	(SELECT works_on.emp_no
	FROM works_on
	WHERE works_on.job = 'clerk')

--6.21)
SELECT project.*, works_on.*
FROM project INNER JOIN works_on
ON project.project_no = works_on.project_no

SELECT project.*, works_on.*
FROM project CROSS JOIN works_on

--6.23)
SELECT works_on.emp_no, works_on.job 
FROM project INNER JOIN works_on
ON project.project_no = works_on.project_no 
AND project.project_name = 'Gemini'

--6.24)
SELECT employee.emp_fname, employee.emp_lname, department.dept_name
FROM employee INNER JOIN department
ON employee.dept_no = department.dept_no 
AND department.dept_name IN ('Research', 'Accounting')

--6.25)
SELECT works_on.enter_date
FROM works_on INNER JOIN employee
ON employee.emp_no = works_on.emp_no
WHERE employee.dept_no = 'd1' 
AND works_on.job = 'clerk'

--6.26)
SELECT project.*
FROM project
WHERE project.project_no
						IN
						(SELECT works_on.project_no
						FROM works_on
						WHERE works_on.job = 'clerk' 
						GROUP BY works_on.project_no
						HAVING COUNT(*) > 1)
								
--6.27)
SELECT employee.emp_fname, employee.emp_lname
FROM employee INNER JOIN works_on 
ON employee.emp_no = works_on.emp_no
INNER JOIN project
ON works_on.project_no = project.project_no
WHERE works_on.job = 'manager' 
AND project.project_name = 'Mercury'

--6.28)
SELECT employee.emp_fname, employee.emp_lname
FROM employee 
WHERE employee.emp_no IN 
						(SELECT w1.emp_no
						FROM works_on w1, works_on w2
						WHERE w1.emp_no <> w2.emp_no
						AND w1.enter_date = w2.enter_date)

--6.29)
SELECT emp_no,emp_fname,emp_lname,dept_no 
INTO employee_enh
FROM employee;

ALTER TABLE employee_enh
ADD domicile CHAR(25) NULL;

UPDATE employee_enh SET domicile='San Antonio'
	WHERE emp_no = 25348;
UPDATE employee_enh SET domicile='Houston'
	WHERE emp_no = 10102;
UPDATE employee_enh SET domicile='San Antonio'
	WHERE emp_no = 18316;
UPDATE employee_enh SET domicile='Seattle'
	WHERE emp_no = 29346;
UPDATE employee_enh SET domicile='Portland'
	WHERE emp_no = 9031;
UPDATE employee_enh SET domicile='Tacoma'
	WHERE emp_no = 2581;
UPDATE employee_enh SET domicile='Houston'
	WHERE emp_no = 28559;

SELECT employee_enh.emp_no, department.location, employee_enh.domicile
FROM employee_enh INNER JOIN department
ON employee_enh.dept_no = department.dept_no
WHERE employee_enh.domicile = department.location

--6.30)
SELECT employee.emp_no, department.dept_name
FROM employee INNER JOIN department
ON employee.dept_no = department.dept_no
WHERE department.dept_name = 'marketing'

SELECT employee.emp_no
FROM employee 
WHERE employee.dept_no IN
						(SELECT department.dept_no
						FROM department
						WHERE department.dept_name = 'marketing')



							  











