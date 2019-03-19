USE employees;

SELECT * FROM employees;

# 이름을 기준으로 오름차순 정렬
SELECT 
    *
FROM
    employees
ORDER BY first_name ASC;

SELECT * FROM employees ORDER BY first_name DESC;

# 이름을 기준으로 오름차순 정렬, 성을 기준으로
# 내림차순 정렬
SELECT * FROM employees
ORDER BY first_name ASC, last_name DESC;

# 이름 기준 오름차순, 성 기준 내림차순,
# 사번 기준 오름차순
SELECT * FROM employees
ORDER BY first_name ASC, last_name DESC,
emp_no ASC;

SELECT * FROM employees WHERE first_name
IN ('mario', 'armond', 'parto')
ORDER BY first_name ASC, emp_no ASC;


# 사번, 이름, 성, 성별 만 출력
SELECT emp_no, first_name, last_name, gender
FROM employees;

SELECT emp_no, last_name, first_name, gender
FROM employees;

# limit 사용
SELECT emp_no, first_name, last_name, gender
FROM employees LIMIT 10;

SELECT emp_no, first_name, last_name, gender
FROM employees LIMIT 0, 10;

SELECT emp_no, first_name, last_name, gender
FROM employees LIMIT 10, 10;

SELECT emp_no, first_name, last_name, gender
FROM employees LIMIT 20, 10;

# order by 와 limit 함께 사용하기
# 사번이 가장 느린 순서대로 20명 출력하기
SELECT emp_no, first_name, last_name, gender,
hire_date FROM employees ORDER BY emp_no DESC
LIMIT 0, 20;

# 문제 1) 이름이 mario, parto 인 사람 중
# 입사일(hire_date)이 가장 느린 사람 10명을
# 20번째 사람부터 출력하세요
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('mario' , 'parto')
ORDER BY hire_date DESC
LIMIT 20 , 10;


# like 사용하여 검색
SELECT emp_no, first_name, last_name, gender,
birth_date FROM employees
WHERE first_name LIKE 'ar%';

SELECT emp_no, first_name, last_name, gender,
birth_date FROM employees
WHERE first_name LIKE '%ond';

SELECT emp_no, first_name, last_name, gender,
birth_date FROM employees
WHERE first_name LIKE 'a%d';

SELECT emp_no, first_name, last_name, gender,
birth_date FROM employees
WHERE first_name LIKE '___io';

SELECT emp_no, first_name, last_name, gender,
birth_date FROM employees
WHERE first_name LIKE 'ma___';


# 문제 2) 사번이 12000보다 빠른 사람 중 이름의
# 중간 글자가 de 인 모든 사람을 검색하여
# 사번, 이름, 성, 성별, 생일을 출력하세요
SELECT emp_no, first_name, last_name, gender,
birth_date FROM employees
WHERE emp_no < 12000
AND first_name LIKE '%de%';

# 문제 3) 성씨의 글자수가 6자이고 앞 글자가 s이며
# 성별이 여성인 사람 중 생일이 가장 빠른 10명을
# 화면에 출력하세요
SELECT * FROM employees
WHERE gender = 'F'
AND last_name LIKE 's_____'
ORDER BY birth_date ASC LIMIT 10;


# 지정한 범위의 값 출력
SELECT * FROM employees
WHERE emp_no BETWEEN 11000 AND 11100;

SELECT * FROM employees
WHERE birth_date BETWEEN '1960-01-01'
AND '1969-12-31'
ORDER BY birth_date asc;

SELECT * FROM employees
WHERE birth_date >= '1960-01-01'
AND birth_date <= '1969-12-31'
ORDER BY birth_date ASC;


SELECT min(emp_no) FROM employees;
SELECT max(emp_no) FROM employees;

SELECT min(first_name) FROM employees;
SELECT max(first_name) FROM employees;


SELECT * FROM salaries;

SELECT * FROM salaries
WHERE emp_no = 10001;

SELECT min(salary) FROM salaries
WHERE emp_no = 10001;

SELECT max(salary) FROM salaries
WHERE emp_no = 10001;

SELECT SUM(salary) FROM salaries
WHERE emp_no = 10001;

SELECT AVG(salary) FROM salaries
WHERE emp_no = 10001;

SELECT count(salary) FROM salaries
WHERE emp_no = 10001;




SELECT * FROM employees
WHERE birth_date >= '1960-01-01'
AND birth_date <= '1969-12-31'
ORDER BY birth_date ASC;

SELECT emp_no as '사번', first_name as '이름',
last_name as '성씨', gender as '성별',
birth_date as '생일', hire_date as '입사일'
FROM employees;


SELECT emp_no as '사번', first_name as '이름',
last_name as '성씨', gender as '성별',
birth_date as '생일', hire_date as '입사일'
FROM employees
WHERE birth_date >= '1960-01-01'
AND birth_date <= '1969-12-31'
ORDER BY birth_date ASC;


SELECT emp_no as '사번', first_name as '이름',
last_name as '성씨', gender as '성별',
birth_date as '생일', hire_date as '입사일'
FROM employees as emp;

# join을 사용하여 여러개의 테이블에서 데이터 조회
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT * FROM employees JOIN salaries
ON employees.emp_no = salaries.emp_no;

# 사번, 이름, 성씨, 성별, 연봉
SELECT employees.emp_no, employees.first_name,
employees.last_name, employees.gender,
salaries.salary
FROM employees JOIN salaries
ON employees.emp_no = salaries.emp_no;

SELECT employees.emp_no, employees.first_name,
employees.last_name, employees.gender,
salaries.salary
FROM employees JOIN salaries
ON employees.emp_no = salaries.emp_no
AND employees.emp_no = 10001;

SELECT employees.emp_no, employees.first_name,
employees.last_name, employees.gender,
salaries.salary, salaries.from_date
FROM employees JOIN salaries
ON employees.emp_no = salaries.emp_no
AND employees.emp_no = 10001;

# AS를 사용한 JOIN
SELECT emp.emp_no, emp.first_name, emp.last_name,
emp.gender, sal.salary, sal.from_date
FROM employees as emp JOIN salaries as sal
ON emp.emp_no = sal.emp_no
AND emp.emp_no = 10001;

# 문제 4) JOIN을 사용하여 employees 테이블과
# salaries에서 사번이 11000 이하인 여성만
# 출력하세요
SELECT * FROM employees JOIN salaries
ON employees.emp_no = salaries.emp_no
AND employees.gender = 'F'
AND employees.emp_no <= 11000;


# 문제 5) 사번이 24587인 사람의 사번, 성, 이름,
# 성별, 현재 급여, 현재 급여를 받기 시작한 날을
# 출력하세요
SELECT a.emp_no, a.first_name, a.last_name,
a.gender, b.salary, b.from_date
FROM employees as a JOIN salaries as b
ON a.emp_no = b.emp_no
AND a.emp_no = 24587
ORDER BY b.from_date DESC LIMIT 1;

SELECT a.emp_no, a.first_name, a.last_name,
a.gender, b.salary, b.from_date
FROM employees as a JOIN salaries as b
ON a.emp_no = b.emp_no
AND a.emp_no = 24587
AND b.to_date = '9999-01-01';

SELECT a.emp_no, a.first_name, a.last_name,
a.gender, b.salary, b.from_date
FROM employees as a JOIN salaries as b
ON a.emp_no = b.emp_no
AND a.emp_no = 24587
AND b.to_date >= '2019-03-08';


SELECT a.emp_no, a.first_name, a.last_name,
a.gender, b.salary, b.from_date
FROM employees as a JOIN salaries as b
ON a.emp_no = b.emp_no
AND a.emp_no = 24587
AND b.to_date >= now();


# employess, salaries, titles을 join하기
# 사번, 이름, 성, 성별, 직급, 급여, 진급일
SELECT a.emp_no, a.first_name, a.last_name,
c.title, b.salary, b.from_date
FROM employees as a
JOIN salaries as b
JOIN titles as c
ON a.emp_no = b.emp_no
AND b.emp_no = c.emp_no
AND a.emp_no = 10001
AND b.to_date >= NOW();


# left join 사용하기
SELECT * FROM girl_group;
SELECT * FROM song;
# join
SELECT a.id, a.name, a.debut, b.title, b.lyrics
FROM girl_group as a
JOIN song as b
ON a.hit_song_id = b.id;

# left join
SELECT a.id, a.name, a.debut, b.title, b.lyrics
FROM girl_group as a
LEFT JOIN song as b
ON a.hit_song_id = b.id;

# right join
SELECT a.id, a.name, a.debut, b.title, b.lyrics
FROM girl_group as a
RIGHT JOIN song as b
ON a.hit_song_id = b.id;

# full outer join 은 mysql에서 지원하지 않음
# left join + right join 합해서 full outer join
SELECT a.id, a.name, a.debut, b.title, b.lyrics
FROM girl_group as a
left JOIN song as b
ON a.hit_song_id = b.id
UNION
SELECT a.id, a.name, a.debut, b.title, b.lyrics
FROM girl_group as a
RIGHT JOIN song as b
ON a.hit_song_id = b.id;