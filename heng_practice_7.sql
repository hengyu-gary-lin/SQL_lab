-- 1. 
INSERT INTO demo1.my_emp
    VALUE (1,'Patel','Ralph','rpatel',795);
SELECT * FROM demo1.my_emp;

-- 2.
INSERT INTO demo1.my_emp(id,last_name,first_name,userid,salary)
    VALUE (2,'Dancs','Betty','bdancs',860);
SELECT * FROM demo1.my_emp;

-- 3.
INSERT INTO demo1.my_emp
    VALUE (3,'Biri','Ben','bbiri',1100),
          (4,'Newman','Chad','cnewman',750);
SELECT * FROM demo1.my_emp;

-- 4. 
SET SQL_SAFE_UPDATES = 0;
UPDATE demo1.my_emp
SET last_name = 'Drexler'
WHERE ID=3;
SELECT * FROM demo1.my_emp;
 
-- 5. 
UPDATE demo1.my_emp
SET salary = 1000
WHERE salary < 900;
SELECT * FROM demo1.my_emp;

-- 6. 
DELETE FROM demo1.my_emp 
WHERE last_name = 'Dancs' AND first_name='Betty';  
SELECT * FROM demo1.my_emp;

-- 7.
START TRANSACTION;
    UPDATE demo1.my_emp
    SET salary = salary*1.1;
    SAVEPOINT sp1;
    DELETE FROM demo1.my_emp;
    ROLLBACK TO sp1;
    COMMIT;
SELECT * FROM demo1.my_emp;