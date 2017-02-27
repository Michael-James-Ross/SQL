CREATE DATABASE db_sample;
USE db_sample;

CREATE TABLE department
(dept_no CHAR(4) NOT NULL,
dept_name CHAR(25) NOT NULL,
location CHAR(30) NULL
CONSTRAINT prim_dept PRIMARY KEY(dept_no)
);

CREATE TABLE employee 
(emp_no INTEGER NOT NULL, 
emp_fname CHAR(20) NOT NULL,
emp_lname CHAR(20) NOT NULL,
dept_no CHAR(4) NULL
CONSTRAINT prim_em PRIMARY KEY (emp_no)
CONSTRAINT foreign_emp FOREIGN KEY (dept_no) REFERENCES  department(dept_no));					
						
CREATE TABLE project   
(project_no CHAR(4) NOT NULL,
project_name CHAR(15) NOT NULL,
budget FLOAT NULL
CONSTRAINT prim_project PRIMARY KEY (project_no)
);

CREATE TABLE works_on	
(emp_no INTEGER NOT NULL,
project_no CHAR(4) NOT NULL,
job CHAR (15) NULL,
enter_date DATE NULL
CONSTRAINT prim_works PRIMARY KEY (emp_no,project_no)
CONSTRAINT foreign1_works FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
CONSTRAINT foreign2_works FOREIGN KEY (project_no) REFERENCES project(project_no) 
)


CREATE TABLE works_on1	
(emp_no INTEGER NOT NULL,
project_no CHAR(4) NOT NULL,
job CHAR (15) NULL,
enter_date DATE NULL
CONSTRAINT prim_works11 PRIMARY KEY (emp_no,project_no)
CONSTRAINT foreign1_works11 FOREIGN KEY (emp_no)
REFERENCES employee(emp_no) ON DELETE CASCADE,
CONSTRAINT foreign2_works11 FOREIGN KEY (project_no)
REFERENCES project(project_no) ON UPDATE CASCADE 
)

CREATE TABLE employee_enh
(
emp_no INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
emp_fname VARCHAR(20),
emp_lname VARCHAR(20),
dept_no CHAR(4) ,
domicile VARCHAR(20)
CONSTRAINT emp_enh_foreign FOREIGN KEY (dept_no)
REFERENCES department(dept_no)
);