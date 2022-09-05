-- 1.
SELECT ROUND(MAX(sal)) AS Maximum, ROUND(MIN(sal)) AS Minimum, ROUND(SUM(sal)) AS Sum, ROUND(AVG(sal)) AS Average
FROM demo.emp;

-- 2.
SELECT job, MAX(sal), MIN(sal), SUM(sal), AVG(sal)
FROM demo.emp
GROUP BY job;

-- 3. 
SELECT job, COUNT(*)
FROM demo.emp
GROUP BY job;

-- 4.
SELECT COUNT(DISTINCT mgr) AS 'Number of Managers'
FROM demo.emp;

-- 5.
SELECT (MAX(sal)-MIN(sal)) AS DIFFERENCE
FROM demo.emp;

-- 6.
SELECT mgr, MIN(sal)
FROM demo.emp
WHERE mgr IS NOT NULL
GROUP BY mgr
HAVING MIN(sal) >=1000
ORDER BY MIN(sal) DESC;

-- 7. WHERE 作法
SELECT YEAR(hiredate) AS HYear, COUNT(*) as 'Number of People'
FROM demo.emp
WHERE YEAR(hiredate) IN (2010,2011,2012,2013)
GROUP BY YEAR(hiredate);

-- 7. HAVING 作法, HAVING中不可再次運算, 可使用別名, 但在標準SQL中不可使用(順序問題)
-- SELECT YEAR(hiredate) AS HYear, COUNT(*) as 'Number of People'
-- FROM demo.emp
-- GROUP BY HYear
-- HAVING HYear IN (2010,2011,2012,2013);

-- SELECT YEAR(hiredate) AS HYear, COUNT(*) as 'Number of People'
-- FROM demo.emp
-- GROUP BY YEAR(hiredate)
-- HAVING YEAR(hiredate) IN (2010,2011,2012,2013);