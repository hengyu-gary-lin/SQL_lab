-- 1.;
SELECT * FROM demo.dept;

-- 2.
SELECT empno, ename, job, hiredate FROM demo.emp;

-- 3.
SELECT DISTINCT job FROM demo.emp;

-- 4.
SELECT empno AS 'Emp#', ename AS Employee, job AS Job, hiredate AS 'Hire Date' FROM demo.emp;

-- 5.
SELECT CONCAT(ename, ', ', job) AS 'Employee and Title' FROM demo.emp;