-- 1.
CREATE VIEW demo1.emp_vu
AS
    SELECT empno, ename AS employee, deptno
    FROM demo1.emp;
DESCRIBE demo1.emp_vu;

-- 2.
SELECT * FROM demo1.emp_vu;

-- 3.
SELECT employee, deptno
FROM demo1.emp_vu;

-- 4.
CREATE VIEW demo1.dept20
AS
    SELECT empno AS employee_id, ename AS employee, deptno AS department_no
    FROM demo1.emp
    WHERE deptno = 20
WITH CHECK OPTION;
DESCRIBE demo1.dept20;

-- 5.
DESCRIBE demo1.dept20;
SELECT * FROM demo1.dept20;

-- 6. 
UPDATE demo1.dept20
SET department_no = 30
WHERE employee = 'Smith';
-- Error Code: 1369. CHECK OPTION failed 'demo1.dept20'

-- 7. 
CREATE VIEW salary_vu
AS
    SELECT e.ename AS Employee, d.dname AS Department, e.sal AS Salary, s.grade AS Grade
    FROM demo1.emp AS e
        JOIN demo1.dept AS d ON e.deptno = d.deptno
        JOIN demo1.salgrade AS s ON e.sal BETWEEN s.losal AND s.hisal;
SELECT * FROM salary_vu;