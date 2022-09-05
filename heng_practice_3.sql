-- 1.
SELECT CURDATE() AS 系統日期;

-- 2. 
SELECT empno, ename, sal, ROUND(sal*1.15) AS 'New Salary'
FROM demo.emp;

-- 3.
SELECT empno, ename, sal, ROUND(sal*1.15) AS 'New Salary', ROUND(sal*1.15 - sal) AS Increase
FROM demo.emp;

-- 4.
SELECT ename, hiredate, 
DATE_FORMAT( 
    ADDDATE(
        ADDDATE(hiredate, INTERVAL 6 MONTH), INTERVAL 
		MOD(7-WEEKDAY(ADDDATE(hiredate, INTERVAL 6 MONTH)),7) 
	DAY), 
'%W , the %D of %M') AS REVIEW
FROM demo.emp;
-- 確定日期-> 抓取星期幾 -> 抓取下一個星期一(如果已經是星期一就是當天) -> 格式 %W, the %D of %M  

-- 5. 
SELECT ename, ROUND(DATEDIFF(CURDATE(),hiredate)/365*12) AS MONTHS_WORKED
FROM demo.emp;
-- 做法二, 不建議會有只用月份, 日期不精準問題
-- SELECT ename, ROUND(PERIOD_DIFF(DATE_FORMAT(CURDATE(),'%Y%m'),DATE_FORMAT(hiredate,'%Y%m'))) AS MONTHS_WORKED
-- FROM demo.emp;

-- 6. 
SELECT CONCAT(ename, ' earns ', sal, ' monthly but wants ', sal*3) AS 'Dream Salaries'
FROM demo.emp;

-- 7. 
SELECT ename, LPAD(sal,15,'$') AS SALARY
FROM demo.emp;

-- 8. 
SELECT ename, hiredate, (WEEKDAY(hiredate)+1) AS DAY
FROM demo.emp
ORDER BY DAY;

-- 9. 
SELECT ename, IFNULL(comm,'No Commission.') AS COMM
FROM demo.emp;

-- 10.
SELECT CONCAT(ename, ' ', REPEAT('*',ROUND(sal/100))) AS EMPLOYEE_AND_THEIR_SALARIES
FROM demo.emp
ORDER BY sal DESC;
