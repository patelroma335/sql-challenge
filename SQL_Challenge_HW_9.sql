CREATE TABLE "Employee" (
    "emp_no" int   NOT NULL,
	"emp_title" varchar(255)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "gender" varchar(255)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "emp_no"
     )
);

SELECT * FROM "Employee"

CREATE TABLE "EmployeeDepartment" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(255)   NOT NULL
);

DROP TABLE "EmployeeDepartment" 

CREATE TABLE "DepartmentManager" (
    "dept_no" varchar(255)   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "Department" (
    "dept_no" varchar(255)   NOT NULL,
    "dept_name" varchar(200)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     ),
    CONSTRAINT "uc_Department_dept_name" UNIQUE (
        "dept_name"
    )
);

CREATE TABLE "Salary" (
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL
);

CREATE TABLE "Title" (
    "title_id" varchar(255)   NOT NULL,
    "title" varchar(255)   NOT NULL
);

select * from "Department";
select * from "EmployeeDepartment";
select * from "DepartmentManager";
select * from "Employee";
select * from "Salary";
select* from "Title";

- List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT 
e.emp_no,
e.last_name,
e.first_name,
e.gender,
s.salary
FROM "Employee" e
JOIN "Salary" s
ON e.emp_no = s.emp_no;

-- List employees who were hired in 1986. 

SELECT
hire_date
FROM "Employee"
WHERE extract(year from hire_date) = '1986'; 


-- List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
SELECT
m.dept_no,
dept_name,
m.emp_no,
first_name,
last_name
FROM "DepartmentManager" m
LEFT JOIN "Department" on m.dept_no = "Department".dept_no
LEFT JOIN "Employee" on m.emp_no = "Employee".emp_no;


-- List the department of each employee with the following information: employee number, last name, first name, and department name

SELECT
e.emp_no, 
first_name, 
last_name,
dept_name
FROM "Employee" E
LEFT JOIN  "EmployeeDepartment" D
ON e.emp_no = e.emp_no
LEFT JOIN "Department"
ON d.dept_no = "Department".dept_no;


select * from "Department";
select * from "EmployeeDepartment";
select * from "DepartmentManager";
select * from "Employee";
select * from "Salary";
select* from "Title";

-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM "Employee"
WHERE(first_name LIKE 'Hercules' AND last_name LIKE '%B%');

-- List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

Select
e.emp_no, 
first_name, 
last_name,
dept_name
FROM "Employee" E
LEFT JOIN "EmployeeDepartment" D
ON e.emp_no = d.emp_no
LEFT JOIN "Department"
ON d.dept_no = "Department".dept_no 
WHERE "Department".dept_name lIKE 'Sales';



-- List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.


Select
e.emp_no, 
first_name, 
last_name,
dept_name
FROM "Employee" E
LEFT JOIN "EmployeeDepartment" D
ON e.emp_no = d.emp_no
LEFT JOIN "Department"
ON d.dept_no = "Department".dept_no 
WHERE "Department".dept_name lIKE 'Sales'
OR "Department".dept_name LIKE  'Development';



--In descending order, list the frequency count of employee last names, i.e.,
--how many employees share each last name.

SELECT
last_name,
COUNT(last_name) AS "name_count"
from "Employee"
GROUP BY
last_name
ORDER BY name_count DESC;





























