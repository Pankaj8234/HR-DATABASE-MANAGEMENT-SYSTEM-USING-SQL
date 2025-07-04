use my_first_db

CREATE TABLE regions (
region_id INT PRIMARY KEY,
region_name VARCHAR (25) DEFAULT NULL
);



CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);





CREATE TABLE countries(
     country_id CHAR (2) PRIMARY KEY,
	 country_name VARCHAR (40) DEFAULT NULL,
	 region_id INT NOT NULL
	 FOREIGN KEY(region_id)REFERENCES regions (region_id)ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE locations(
     location_id INT PRIMARY KEY,
	 street_address VARCHAR(40)DEFAULT NULL,
	 postal_code VARCHAR(12)DEFAULT NULL,
	 city VARCHAR(30)NOT NULL,
	 state_province VARCHAR(25)DEFAULT NULL,
	 country_id CHAR(2) NOT NULL,
	 FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE
CASCADE ON UPDATE CASCADE
);


CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR (35) NOT NULL,
    min_salary DECIMAL (8, 2) DEFAULT NULL,
    max_salary DECIMAL (8, 2) DEFAULT NULL
);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR (30) NOT NULL,
    location_id INT DEFAULT NULL,
    FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE
CASCADE ON UPDATE CASCADE
);


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR (20) DEFAULT NULL,
    last_name VARCHAR (25) NOT NULL,
    email VARCHAR (100) NOT NULL,
    phone_number VARCHAR (20) DEFAULT NULL,
    hire_date DATE NOT NULL,
    job_id INT NOT NULL,
    salary DECIMAL (8, 2) NOT NULL,
    manager_id INT DEFAULT NULL,
    department_id INT DEFAULT NULL,
FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON
UPDATE CASCADE,

FOREIGN KEY (department_id) REFERENCES departments (department_id) ON
DELETE CASCADE ON UPDATE CASCADE,

FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
)


CREATE TABLE projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(255),
start_date DATE NOT NULL,
end_date DATE NOT NULL
);
CREATE TABLE project_milestones(
milestone_id INT PRIMARY KEY,
project_id INT,
milestone_name VARCHAR(100)
);





--TASK 1 (1)WRITE A QUERY FOR SELECT STATEMENTS :-

--select * from employees

--select  employee_id,first_name,last_name,hire_date from employees

--select first_name,last_name,salary from employees

--select first_name,last_name,salary,salary*2 AS NEW_SALARY from employees



--(2)WRITE A QUERY FOR ORDER BY STATEMENTS :-

--select employee_id,first_name,last_name,hire_date,salary from employees

--select * from employees order by first_name ASC

--select * from employees order by first_name ASC,last_name desc

--select * from employees order by salary desc

--select * from employees order by hire_date desc



--(3)WRITE A QUERY FOR DISTINCT STATEMENTS :-

--select salary from employees order by salary desc

--select distinct salary from employees
--select * from employees where salary = 14000

--select job_id,salary from employees

--select distinct phone_number from employees



--(4)WRITE A QUERY FOR TOP N STATEMENTS :-

--select * from employees order by first_name 

--select top 5 * from employees order by first_name

--select * from employees order by first_name offset 3 rows fetch next 5 rows only

--select top 5 * from employees order by salary desc

--select top 2 * from employees order by salary desc

--SELECT DISTINCT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees))


--(5)WRITE A QUERY FOR WHERE CLAUSE and COMPARISON OPERATORS :-

--select * from employees where salary > '14000' order by salary desc

--select * from employees where department_id ='5'  --select * from employees where department_id like '5'

--select * from employees where last_name ='Chen'

--select * from employees where hire_date > '1997-01-01'

--select * from employees where Year(hire_date) = 1999

--select * from employees where last_name ='Himuro'

--select * from employees where last_name like '%Himuro%'

--select * from employees where phone_number is Null

--select * from employees where department_id <> 8

--select * from employees where department_id not in (8,10)

--select * from employees where salary > '10000'

--select * from employees where department_id = 8 and salary > '10000'

--select * from employees where salary < '10000'

--select * from employees where salary >= '9000'

--select * from employees where salary <= '9000'


--(6)WRITE A QUERY FOR:-

--alter table courses ADD credit_hours int;

--ALTER TABLE courses ADD fee DECIMAL(10,2), max_limit INT

--ALTER TABLE courses ALTER COLUMN fee DECIMAL(10,2) NOT NULL

--ALTER TABLE courses DROP COLUMN fee

--ALTER TABLE courses DROP COLUMN max_limit, credit_hours



--(6)WRITE A QUERY FOR:-

--ALTER TABLE project_milestones ADD CONSTRAINT fk_project FOREIGN KEY (project_id) REFERENCES projects(project_id)

--select project_id from project_milestones where project_id not in (select project_id from projects)

--ALTER TABLE project_milestones ADD CONSTRAINT fk_project_milestones FOREIGN KEY (project_id) REFERENCES projects(project_id)



--TASK 2:
--(1)WRITE A QUERY FOR LOGICAL OPERATORS and OTHER ADVANCED OPERATORS:-
--PART 1:

select * from employees where salary > '5000' and salary < '7000'

select * from employees where salary in (7000, 8000)

select * from employees where phone_number is null

select * from employees where salary between 9000 and 12000

select * from employees where department_id in (8,9)

select * from employees where first_name like '%jo%'

select * from employees where first_name like' _h%'

select * from employees where salary > all (select salary from employees where department_id=8)

--PART 2:

select * from employees where salary > all (select avg(salary) from employees group by department_id)

select * from employees where employee_id in (select employee_id from dependents)

select * from employees where salary between 2500 and 2900

select * from employees where salary not between 2500 and 2900

select * from employees where hire_date between '1999-01-01' and '2000-12-31'

select * from employees where hire_date not between '1999-01-01' and '2000-12-31'

select * from employees where hire_date between '1999-01-01' and '1993-12-31'


--PART 3:

select * from employees where first_name like 'Da%'

select * from employees where first_name like '%er'

select * from employees where last_name like '%an%'

select * from employees where first_name like '_Jo' and first_name like 'Jo__'

select * from employees where len(first_name) = 2 

select * from employees where first_name like 'S%' and first_name not like 'Sh%'


--PART 4:


select * from employees where department_id = 5

select * from employees where department_id = 5 and salary <= 5000

select * from employees where department_id not in (1,2,3)

select * from employees where first_name not like 'D%'

select * from employees where salary not between 1000 and 5000


--PART 5:

SELECT e.* FROM employees e LEFT JOIN dependents d ON e.employee_id = d.employee_id WHERE d.employee_id IS NULL;

SELECT * FROM employees WHERE phone_number is NULL

SELECT * FROM employees WHERE phone_number is NOT NULL


--TASK 3:
--JOINS SQL INNER JOIN clause

SELECT * FROM employees WHERE department_id in (1,2,3)

SELECT * FROM employees WHERE department_id in (1,2,3,4)

SELECT e.first_name, e.last_name, j.job_title, d.department_name FROM employees e JOIN jobs j ON e.job_id = j.job_id JOIN departments d ON e.department_id = d.department_id WHERE e.department_id IN (1, 2, 3);


--SQL LEFT JOIN clause

SELECT country_name FROM countries WHERE country_name in ('United States', 'United Kingdom', 'China')

SELECT l.* FROM locations l JOIN countries c ON l.country_id = c.country_id WHERE c.country_name IN ('United States', 'United Kingdom', 'China')

SELECT c.country_id, c.country_name, l.location_id, l.city FROM countries c JOIN locations l ON c.country_id = l.country_id

SELECT c.country_id, c.country_name FROM countries c LEFT JOIN locations l ON c.country_id = l.country_id WHERE l.location_id IS NULL 

SELECT r.region_id, r.region_name, c.country_id, c.country_name, l.location_id, l.city, l.street_address FROM regions r JOIN countries c ON r.region_id = c.region_id JOIN locations l ON c.country_id = l.country_id

--SQL self-join

SELECT e.employee_id AS employee_id, e.first_name + ' ' + e.last_name AS employee_name, m.employee_id AS manager_id, m.first_name + ' ' + m.last_name AS manager_name FROM employees e JOIN employees m ON e.manager_id = m.employee_id

SELECT e.employee_id AS employee_id, e.first_name + ' ' + e.last_name AS employee_name, m.employee_id AS manager_id, m.first_name + ' ' + m.last_name AS manager_name FROM employees e LEFT JOIN employees m ON e.manager_id = m.employee_id;



--SQL FULL OUTER JOIN clause

SELECT f.fruit_name, b.basket_name FROM fruits f FULL OUTER JOIN basket_fruits bf ON f.fruit_id = bf.fruit_id FULL OUTER JOIN baskets b ON b.basket_id = bf.basket_id

SELECT b.basket_id, b.basket_name FROM baskets b LEFT JOIN basket_fruits bf ON b.basket_id = bf.basket_id WHERE bf.fruit_id IS NULL

SELECT f.fruit_name, b.basket_name FROM fruits f FULL OUTER JOIN baskets b ON f.basket_id = b.basket_id

SELECT b.basket_id, b.basket_name FROM baskets b LEFT JOIN fruits f ON b.basket_id = f.basket_id WHERE f.fruit_id IS NULL

SELECT f.fruit_id, f.fruit_name FROM fruits f WHERE f.fruit_id IS NULL



--SQL CROSS JOIN clause

SELECT so.sales_org, sc.channel FROM sales_organization so CROSS JOIN sales_channel sc

SELECT * FROM sales_organization

SELECT * FROM sales_channel




--TASK 4: SQL GROUP BY clause

SELECT department_id FROM employees GROUP BY department_id 

SELECT department_id, COUNT(*) AS employee_count FROM employees GROUP BY department_id ORDER BY employee_count desc

SELECT department_id, COUNT(*) AS number_of_employees FROM employees GROUP BY department_id

SELECT department_id, COUNT(*) AS headcount FROM employees GROUP BY department_id ORDER BY headcount desc

SELECT department_id, COUNT(*) AS headcount FROM employees GROUP BY department_id HAVING COUNT (*) > 5

SELECT department_id, MIN(salary) AS min_salary, MAX(salary) AS max_salary, AVG(salary) AS avg_salary FROM employees GROUP BY department_id

SELECT department_id, SUM(salary) AS total_salary FROM employees GROUP BY department_id

SELECT department_id, job_id, COUNT(*) AS count FROM employees GROUP BY department_id, job_id


--SQL HAVING clause

SELECT manager_id, COUNT(*) AS direct_reports FROM employees WHERE manager_id IS NOT NULL GROUP BY manager_id
SELECT m.employee_id AS manager_id, m.first_name + ' ' + m.last_name AS manager_name, COUNT(e.employee_id) AS direct_reports FROM employees e JOIN employees m ON e.manager_id = m.employee_id GROUP BY m.employee_id, m.first_name, m.last_name

SELECT m.employee_id AS manager_id, m.first_name + ' ' + m.last_name AS manger_name, COUNT(e.employee_id) AS direct_reports FROM employees e JOIN employees m ON e.manager_id = m.employee_id GROUP BY m.employee_id, m.first_name, m.last_name HAVING COUNT(e.employee_id) >= 5

SELECT department_id, SUM(salary) AS total_salary FROM employees GROUP BY department_id HAVING SUM(salary) BETWEEN 20000 AND 30000

SELECT department_id, MIN(salary) AS min_salary FROM employees GROUP BY department_id HAVING MIN(salary) > 10000

SELECT department_id, AVG(salary) AS average_salary FROM employees GROUP BY department_id HAVING AVG(salary) BETWEEN 5000 AND 7000



--TASK 5 (Other Queries)
--(1)SQL UNION operator

SELECT first_name + ' ' + last_name AS full_name FROM employees UNION SELECT first_name + ' ' + last_name AS full_name FROM dependents


--(2)SQL INTERSECT operator

SELECT fruit_id FROM fruits WHERE basket_id IS NOT NULL INTERSECT SELECT basket_id FROM baskets ORDER BY 1 DESC


--(3)SQL EXISTS operator

SELECT DISTINCT e.employee_id, e.first_name, e.last_name FROM employees e JOIN dependents d ON e.employee_id = d.employee_id

SELECT DISTINCT e.employee_id, e.first_name, e.last_name FROM employees e LEFT JOIN dependents d ON e.employee_id = d.employee_id WHERE d.employee_id IS NULL

--(4) SQL CASE expression

SELECT employee_id, first_name, last_name, hire_date, CASE WHEN YEAR(hire_date) = 2000 THEN 'Hired this year' WHEN YEAR(hire_date) = 1999 THEN '1 year anniversary' WHEN YEAR(hire_date) = 1995 THEN '5 year anniversary' ELSE 'No milestone' END AS work_anniversary FROM employees

SELECT employee_id, first_name, last_name, salary, CASE WHEN salary < 3000 THEN 'Low' WHEN salary BETWEEN 3000 AND 5000 THEN 'Average' WHEN salary > 5000 THEN 'High' END AS salary_grade FROM employees

--(5) SQL UPDATE statement

UPDATE employees SET last_name = 'Lopez' WHERE first_name = 'Sarah' AND last_name = 'Bell'

SELECT * FROM employees WHERE first_name like '%Sarah%'




--FINAL TASK (Advanced Queries)
--SQL SUBQUERY

SELECT employee_id, first_name, last_name FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE location_id = 1700)

SELECT employee_id, first_name, last_name FROM employees WHERE department_id NOT IN (SELECT department_id FROM departments WHERE location_id = 1700)

SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary = ( SELECT MAX(salary) FROM employees)

SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees)

SELECT DISTINCT department_id FROM employees WHERE salary > 10000

SELECT department_id FROM departments WHERE department_id  NOT IN ( SELECT DISTINCT department_id FROM employees WHERE salary > 10000 )

SELECT department_id, MIN(salary) AS lowest_salary FROM employees GROUP BY department_id

SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary > ALL (SELECT MIN(salary) FROM employees GROUP BY department_id)

SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary >= ALL (SELECT MAX(salary) FROM employees GROUP BY department_id)

SELECT department_id, AVG(salary) AS avg_salary FROM employees GROUP BY department_id

SELECT AVG(avg_salary) AS overall_avg_of_dept FROM (SELECT AVG(salary) AS avg_salary FROM employees GROUP BY department_id) AS dept_avgs

SELECT employee_id, first_name, last_name, salary, (SELECT AVG(salary) FROM employees) AS avg_salary, salary - (SELECT AVG(salary) FROM employees) AS diff_from_avg FROM employees


--create the sales organization and sales channel table

CREATE TABLE sales_organization (
sales_org_id INT PRIMARY KEY,
sales_org VARCHAR (255)
);

CREATE TABLE sales_channel (
channel_id INT PRIMARY KEY,
channel VARCHAR (255)
);

--CREATE the fruits and bakset table
CREATE TABLE fruits (
fruit_id INT PRIMARY KEY,
fruit_name VARCHAR (255) NOT NULL,
basket_id INTEGER
);
CREATE TABLE baskets (
basket_id INT PRIMARY KEY,
basket_name VARCHAR (255) NOT NULL
);

CREATE TABLE basket_fruits (
    basket_id INT,
    fruit_id INT,
    FOREIGN KEY (basket_id) REFERENCES baskets(basket_id),
    FOREIGN KEY (fruit_id) REFERENCES fruits(fruit_id)
)


--/*Data for the sales_organization and sales_channel */
DELETE FROM sales_organization
INSERT INTO sales_organization (sales_org_id, sales_org)
VALUES
(1, 'Domestic'),
(2, 'Export');
DELETE FROM sales_channel
INSERT INTO sales_channel (channel_id, channel)
VALUES
(1, 'Wholesale'),
(2, 'Retail'),
(3, 'eCommerce'),
(4, 'TV Shopping');

--/*Data for the baskets and fruits */
INSERT INTO baskets (basket_id, basket_name)
VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');
INSERT INTO fruits (
fruit_id,
fruit_name,
basket_id
)
VALUES
(1, 'Apple', 1),
(2, 'Orange', 1),
(3, 'Banana', 2),
(4, 'Strawberry', NULL);

INSERT INTO basket_fruits VALUES (1, 1), (2, 2);

-- Create the countries table
CREATE TABLE countries (
    country_id VARCHAR(2) PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT
);

-- Create the locations table
CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(100),
    postal_code VARCHAR(20),
    city VARCHAR(50),
    state_province VARCHAR(50),
    country_id VARCHAR(2),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);



CREATE TABLE dependents (
    dependent_id INT PRIMARY KEY,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    relationship VARCHAR (25) NOT NULL,
    employee_id INT NOT NULL,
FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE
CASCADE ON UPDATE CASCADE
);


/*Data for the table regions */
INSERT INTO regions(region_id,region_name)
VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name)
VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name)
VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name)
VALUES (4,'Middle East and Africa');





/*Data for the table countries */
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('ZW','Zimbabwe',4);





/*Data for the table locations */
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');





/*Data for the table jobs */
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (19,'Stock Manager',5500.00,8500.00);




/*Data for the table departments */
INSERT INTO departments(department_id,department_name,location_id)
VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (11,'Accounting',1700);




/*Data for the table employees */
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);



/*Data for the table dependents */
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (30,'Sandra','Taylor','Child',176);




