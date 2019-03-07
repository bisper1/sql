USE world;

SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

SELECT * FROM city WHERE Name = 'seoul';
SELECT * FROM city WHERE Name = 'yangsan';
SELECT * FROM city WHERE CountryCode = 'KOR';

SELECT * FROM city WHERE district = 'kyongsangnam';

SELECT * FROM city WHERE countrycode = 'ita';

SELECT * FROM city WHERE id < 100;
SELECT * FROM city WHERE id > 3000;
SELECT * FROM city WHERE id <= 50;
SELECT * FROM city WHERE id >= 4000;
SELECT * FROM city WHERE id = 54;
SELECT * FROM city WHERE id != 54;
SELECT * FROM city WHERE id <> 54;


SELECT * FROM city WHERE id > 100
AND id < 500;

SELECT * FROM city WHERE id > 100
AND id < 500
AND population < 50000;

SELECT * FROM city WHERE id > 100
AND id < 500
AND population > 50000
AND population <= 100000;

SELECT * FROM countrylanguage
WHERE countrycode = 'usa'
or language = 'engilsh';

SELECT * FROM city
WHERE id = 100
OR id = 200;

SELECT * FROM country;




# 문제 1) 전화번호부 데이터베이스를 생성하세요
# DB명 : addressbook
# 테이블명 : addr
# 생성할 컬럼 : num int(11), lastname varchar(20),
# firstname varchar(20), phone varchar(11),
# tel varchar(11), email varchar(50), 
# address varchar(200), birthdate varchar(8),
# memo varchar(140)
# 기본키 : num
# not null : num, lastname, firstname, email
# 콘솔에서 생성하세요

USE employees;

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;


SELECT * FROM employees
WHERE first_name = 'mario'
OR first_name = 'parto';

SELECT * FROM employees
WHERE first_name in ('mario', 'parto');

SELECT * FROM employees
WHERE first_name in ('mario', 'parto', 'armond');


SELECT * FROM employees
WHERE NOT gender = 'M';

SELECT * FROM employees
WHERE gender = 'M';


SELECT * FROM employees
WHERE NOT gender = 'F'
AND first_name = 'mario';



