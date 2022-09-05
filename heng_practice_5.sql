-- 1.
SELECT e.ename, e.deptno, d.dname, d.loc
FROM demo.emp AS e
    JOIN demo.dept AS d ON e.deptno = d.deptno; 

-- 2.
SELECT e.ename, e.comm, d.dname, d.loc
FROM demo.emp AS e
    JOIN demo.dept AS d ON e.deptno = d.deptno 
WHERE e.comm IS NOT NULL AND e.comm >0 ;

-- 3. 
SELECT e.ename, d.dname
FROM demo.emp AS e
    JOIN demo.dept AS d ON e.deptno = d.deptno
WHERE e.ename LIKE '%A%';

-- 4.
SELECT e.ename, e.job, e.deptno, d.dname
FROM demo.emp AS e
    JOIN demo.dept AS d ON e.deptno = d.deptno
WHERE d.loc = 'DALLAS';

-- 5.
SELECT e.ename AS Employee , e.empno AS 'Emp#', e1.ename AS Manager, e.mgr AS 'Mgr#'
FROM demo.emp AS e
    JOIN demo.emp AS e1 ON e.mgr = e1.empno;

-- 6. 
DESCRIBE salgrade;
SELECT e.ename, e.job, d.dname, e.sal, s.grade
FROM demo.emp AS e
    JOIN demo.dept AS d on e.deptno = d.deptno
    JOIN demo.salgrade AS s ON (e.sal BETWEEN s.losal AND s.hisal);
   
-- CASE 做法, 也可以但是比較麻煩, 不建議使用   
SELECT e.ename, e.job, d.dname, e.sal,
CASE 
       WHEN e.sal BETWEEN 700 and 1200 THEN '1' 
       WHEN e.sal BETWEEN 1201 and 1400 THEN '2'
       WHEN e.sal BETWEEN 1401 and 2000 THEN '3'
       WHEN e.sal BETWEEN 2001 and 3000 THEN '4'
       WHEN e.sal BETWEEN 3001 and 9999 THEN '5'    
 	  END AS grade
-- FROM demo.emp AS e
--    JOIN demo.dept AS d on e.deptno = d.deptno;

-- 7. 
SELECT e.ename AS Employee , e.hiredate AS 'Emp Hiredate', e1.ename AS Manager, e1.hiredate AS 'Mgr Hiredate'
FROM demo.emp AS e
    JOIN demo.emp AS e1 ON e.mgr = e1.empno
WHERE e.hiredate < e1.hiredate ;

-- 8.  
SELECT dname, loc, count(empno) AS 'Number of People,', round(avg(sal),2) as Salary
FROM demo.emp AS e
    JOIN demo.dept AS d ON e.deptno = d.deptno
GROUP BY dname
