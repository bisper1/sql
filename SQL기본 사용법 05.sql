USE csydb;

SELECT * FROM brand;

UPDATE brand SET hot = 'C' WHERE num = 7;

START TRANSACTION;

UPDATE brand SET hot = 'C';

SELECT * FROM brand;

ROLLBACK;

UPDATE brand SET hot = 'C';

SELECT * FROM brand;

COMMIT;


START TRANSACTION;

SELECT * FROM brand;

SAVEPOINT a;

UPDATE brand SET price = '1200'
WHERE num = 2;

SAVEPOINT b;

UPDATE brand SET price = '1200'
WHERE num = 4;

SAVEPOINT c;

UPDATE brand SET price = '1000'
WHERE num = 6;

SELECT * FROM brand;

ROLLBACK TO SAVEPOINT c;

ROLLBACK TO SAVEPOINT b;

ROLLBACK TO SAVEPOINT a;

# ROLLBACK
COMMIT;

SELECT * FROM student;
# 문제 1) student 테이블의 내용을 트랜젝션을
# 사용하여 모든 내용을 삭제하고 다시 롤백하세요
# savepoint 사용 X
SELECT * FROM student;
START TRANSACTION;
DELETE FROM student;
ROLLBACK;


# 문제 2) student 테이블의 내용 중 3명을 선정하여
# 연예인의 이름과 정보로 변경하고 다시 롤백하세요
# 1명의 정보 수정 시 savepoint를 각각 사용하고
# 다시 롤백하는 형태로 SQL 쿼리를 작성하세요
SELECT * FROM student;
START TRANSACTION;
SAVEPOINT a;
UPDATE student SET stu_name = '원빈'
WHERE stu_num = 1;

SAVEPOINT b;
UPDATE student SET stu_name = '장동건'
WHERE stu_num = 2;

SAVEPOINT c;
UPDATE student SET stu_name = '아이유'
WHERE stu_num = 3;

SELECT * FROM student;
ROLLBACK TO SAVEPOINT c;
ROLLBACK TO SAVEPOINT b;
ROLLBACK TO SAVEPOINT a;

ROLLBACK;


USE csydb;
SHOW DATABASES;
SHOW TABLES;
DESC student;



SELECT * FROM employees;

SELECT * FROM salaries;

SELECT * FROM salaries
WHERE emp_no = 10009;

# 조회 시간 비교
# from_date 1985-02-18 (인덱스 적용)
# to_date 1986-02-18 (인덱스 미적용)
SELECT * FROM salaries
WHERE emp_no = 10009
AND from_date = '1985-02-18';

SELECT * FROM salaries
WHERE emp_no = 10009
AND to_date = '1986-02-18';


SELECT * FROM salaries
WHERE from_date = '1985-02-18';

SELECT * FROM salaries
WHERE to_date = '1986-02-18';

ALTER TABLE salaries
ADD INDEX idx_todate(to_date);

ALTER TABLE salaries
DROP INDEX idx_todate;

SHOW INDEX FROM salaries;

SELECT * FROM employees;

# 문제 3) employees 테이블에 index 를 추가하여 
# 검색 속도를 높이세요
# hire_date 컬럼을 index 추가하기
# hire_date = '1992-10-15' 로 검색
# 1. 기존 값 검색하여 검색 속도 확인
# 2. index를 추가하여 검색 속도 확인
# 3. index를 삭제하고 검색 속도 확인


SELECT * FROM employees;

SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE gender = 'F';

CREATE VIEW emp_gender AS
(SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE gender = 'F');

DROP VIEW emp_gender;

SELECT * FROM emp_gender;

SELECT * FROM employees
WHERE emp_no BETWEEN 20000 AND 30000
AND first_name IN ('mario', 'armond');

CREATE VIEW view_marioArmond
AS (SELECT * FROM employees
WHERE emp_no BETWEEN 20000 AND 30000
AND first_name IN ('mario', 'armond'));

SELECT * FROM view_marioArmond;

# join을 사용한 쿼리문을 뷰로 생성
SELECT a.emp_no, a.first_name, a.last_name,
a.gender, b.salary, b.from_date
FROM employees AS a
JOIN salaries AS b
ON a.emp_no = b.emp_no
AND a.first_name = 'mario';

CREATE VIEW view_mario
AS (SELECT a.emp_no, a.first_name, a.last_name,
a.gender, b.salary, b.from_date
FROM employees AS a
JOIN salaries AS b
ON a.emp_no = b.emp_no
AND a.first_name = 'mario');

SELECT * FROM view_mario;

# 문제 4) 테이블 employees, titles 를 join하여
# 사번 14567인 사람의 사번, 이름, 성, 성별, 입사일,
# 직급, 진급일을 출력하는 뷰를 생성하세요.
# 기존 join 문의 결과와 뷰 생성 후 간단한 쿼리문의
# 결과가 같아야 함
SELECT a.emp_no, a.first_name, a.last_name,
a.gender, a.hire_date, b.title, b.from_date
FROM employees as a
JOIN titles as b
ON a.emp_no = b.emp_no
AND a.emp_no = 14567;

CREATE VIEW view_q4
AS (SELECT a.emp_no, a.first_name, a.last_name,
a.gender, a.hire_date, b.title, b.from_date
FROM employees as a
JOIN titles as b
ON a.emp_no = b.emp_no
AND a.emp_no = 14567);

SELECT * FROM view_q4;
DROP VIEW view_q4;

# 문제 5) 사번 35478인 사람의 사번, 이름, 성, 생일,
# 입사일, 현재 직급, 현재 급여, 최근 호봉상승일을
# 출력하는 뷰를 생성하세요.
# 기존 join 문의 결과와 뷰 생성 후 간단한 쿼리문의
# 결과가 같아야 함
# 결과가 1개만 나와야함

SELECT a.emp_no, a.first_name, a.last_name,
a.gender, a.birth_date, a.hire_date, c.title,
b.salary, b.from_date, 
c.from_date, b.to_date
FROM employees AS a
JOIN salaries AS b
JOIN titles AS c
ON a.emp_no = b.emp_no
AND b.emp_no = c.emp_no
AND a.emp_no = 35478
AND b.to_date >= '2019-03-11'
AND b.from_date < c.from_date;

SELECT * FROM salaries where emp_no = 35478;
SELECT * FROM titles where emp_no = 35478;
SELECT * FROM salaries where emp_no = 35478;

CREATE VIEW view_q5 
AS (SELECT a.emp_no, a.first_name, a.last_name,
a.gender, a.birth_date, a.hire_date, c.title,
b.salary, b.from_date
FROM employees AS a
JOIN salaries AS b
JOIN titles AS c
ON a.emp_no = b.emp_no
AND b.emp_no = c.emp_no
AND a.emp_no = 35478
AND b.to_date >= '2019-03-11'
AND b.from_date < c.from_date);

DROP VIEW view_q5;

















