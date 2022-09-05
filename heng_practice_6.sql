-- 1.
SELECT ename, hiredate
FROM demo.emp
WHERE deptno= (
    SELECT deptno FROM demo.emp WHERE ename = 'Blake') ;

-- 2.
SELECT ename, hiredate
FROM demo.emp
WHERE hiredate > (
    SELECT hiredate FROM demo.emp WHERE ename = 'Blake') ;

-- 3.
SELECT empno, ename, sal
FROM demo.emp 
WHERE sal > (
    SELECT AVG(sal) FROM demo.emp)
ORDER BY sal DESC ;

-- 4.
SELECT empno, ename
FROM demo.emp 
WHERE deptno in (
    SELECT deptno FROM demo.emp WHERE ename LIKE '%T%') ;

-- 5.
SELECT e.ename, e.deptno, e.job
FROM demo.emp AS e
    JOIN demo.dept AS d ON e.deptno = d.deptno
WHERE d.loc = 'DALLAS';

-- 6. 
SELECT ename, sal, mgr
FROM demo.emp 
WHERE mgr = (SELECT empno FROM demo.emp WHERE ename = 'KING');

-- 7.
SELECT deptno, ename, job
FROM demo.emp
WHERE deptno = (
    SELECT deptno FROM demo.dept WHERE dname = 'Sales');

-- 8. ((薪資比公司平均薪資還要高且和名字中有T的人)在相同部門上班)的所有員工
SELECT empno, ename, sal
FROM demo.emp 
WHERE deptno = (
    SELECT deptno 
    FROM demo.emp 
    WHERE sal > (SELECT AVG(sal) FROM demo.emp) 
          AND ename LIKE '%T%')  ;

-- 8. (薪資比公司平均薪資還要高)且(和名字中有T的人在相同部門上班)的所有員工          
SELECT empno, ename, sal
FROM demo.emp 
WHERE sal > (SELECT AVG(sal) FROM demo.emp) 
    AND deptno IN ( SELECT deptno FROM demo.emp WHERE ename LIKE '%T%')  ;

-- 9. 
SELECT e.ename, e.deptno, e.sal
FROM demo.emp AS e
    JOIN (SELECT * FROM demo.emp WHERE comm > 0) AS e2
WHERE  e.empno<> e2.empno AND e.deptno = e2.deptno AND e.sal = e2.sal ; 

-- 10. 
SELECT e.ename, e.deptno, e.sal
FROM demo.emp AS e JOIN (SELECT * FROM demo.dept WHERE loc ='Dallas') AS d ON e.deptno = d.deptno
				   JOIN demo.emp AS e2
WHERE e.empno <> e2.empno AND e.sal = e2.sal  AND IFNULL(e.comm,0) = IFNULL(e2.comm,0) ; 

-- 11. 
SELECT e.ename, e.hiredate, e.sal
FROM demo.emp AS e JOIN (SELECT * FROM demo.emp WHERE ename ='Scott') AS e2
WHERE e.empno <> e2.empno AND e.sal = e2.sal AND IFNULL(e.comm,0) = IFNULL(e2.comm,0);

-- 12. 
SELECT ename, hiredate, sal
FROM demo.emp
WHERE sal >ALL (SELECT sal FROM demo.emp WHERE job='Clerk')
ORDER BY sal DESC;

