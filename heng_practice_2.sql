-- 作業2
-- 1.
SELECT ename, sal 
FROM demo.emp
WHERE sal>2850;

-- 2.
SELECT ename, deptno
FROM demo.emp
WHERE empno = '7566';

-- 3.
SELECT ename, sal
FROM demo.emp
WHERE sal NOT between 1500 AND 2850 ;

-- 4.
SELECT ename, job, hiredate
FROM demo.emp
WHERE hiredate between 20110220 and 20110501
ORDER BY hiredate;

-- 5.
SELECT ename, deptno
FROM demo.emp
WHERE deptno in (10, 30)
ORDER BY ename;

-- 6.
SELECT ename AS 'Employee' , sal AS 'Monthly Salary'
FROM demo.emp
WHERE sal > 1500 and deptno in (10, 30);

-- 7.
SELECT ename, job, hiredate
FROM demo.emp
WHERE hiredate LIKE '2012-%';

-- 8. 
SELECT ename, job
FROM demo.emp
WHERE mgr IS NULL;

-- 9.
SELECT ename, sal, comm
FROM demo.emp
WHERE comm>0
ORDER BY sal DESC, comm DESC;

-- 10.
SELECT ename, job
FROM demo.emp
WHERE ename LIKE '__A%' ;

-- 11.
SELECT ename, mgr, deptno
FROM demo.emp
WHERE (deptno=30 AND ename LIKE '%L%L%') OR mgr='7782';

-- 12.
SELECT ename, job, sal
FROM demo.emp
WHERE job IN ('Clerk','Analyst') AND sal NOT IN (1000,3000,5000);

-- 13.
SELECT ename, sal, comm
FROM demo.emp
WHERE comm > sal*1.1;