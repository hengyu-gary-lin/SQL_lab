-- 1.
DROP TABLE IF EXISTS demo1.department;
CREATE TABLE demo1.department
(id	INT		NOT NULL,
 name1	VARCHAR(24)	NOT NULL);
DESCRIBE demo1.department;

-- 2.
INSERT INTO demo1.department(id,name1)
    SELECT deptno, dname 
    FROM demo1.dept;
SELECT * FROM  demo1.department;

-- 3.
DROP TABLE IF EXISTS demo1.employee;
CREATE TABLE demo1.employee
(id		INT		NOT NULL, 
 last_name	VARCHAR(24)	NOT NULL, 
 first_name	VARCHAR(24), 
 dept_id	INT);
DESCRIBE demo1.employee;

-- 4.
ALTER TABLE demo1.employee
MODIFY COLUMN last_name VARCHAR(40);
DESCRIBE demo1.employee;

-- 5.
DROP TABLE IF EXISTS demo1.employee2;
CREATE TABLE demo1.employee2
AS
    SELECT empno AS id, ename AS last_name, deptno AS dept_id
    FROM demo1.emp;
DESCRIBE demo1.employee2; 

-- 6.
DROP TABLE demo1.employee;

-- 7.
ALTER TABLE demo1.employee2
RENAME TO employee;

-- 8.
ALTER TABLE demo1.employee
DROP COLUMN last_name;
DESCRIBE demo1.employee;

-- 9.
ALTER TABLE demo1.employee
ADD COLUMN salary INT; 
DESCRIBE demo1.employee;

-- 10.
ALTER TABLE demo1.employee
ADD CONSTRAINT PK_employee_id PRIMARY KEY(id) ; 
DESCRIBE demo1.employee;
SHOW INDEXES FROM employee;

-- 11.
ALTER TABLE demo1.employee
ADD CONSTRAINT FK_employee_deptid FOREIGN KEY(dept_id)
				  REFERENCES demo.dept(deptno) ON UPDATE RESTRICT; 
SHOW INDEXES FROM employee; 