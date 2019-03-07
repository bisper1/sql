USE csydb;

SELECT * FROM brand;


INSERT INTO brand (num, name, price, temp, company)
VALUE (4, '칠성사이다', '1000', '0', '칠성');

INSERT INTO brand (name, company, price, num)
VALUE ('데미소다 복숭아', '동아오츠카', '1000', 6);

INSERT INTO brand VALUE (5, '핫식스', '1200', '0', '칠성');

INSERT INTO brand VALUE ('밀키스', '코카콜라', '1000', 7);

INSERT INTO brand VALUE ('밀키스', '코카콜라', '1000', 7, '0');
INSERT INTO brand VALUE (7, '밀키스', '1200', '','코카콜라');


INSERT INTO brand (num, name, price, temp, company)
VALUES (8, '설탕커피', '300', '1', '맥심'),
(9, '밀크커피', '300', '1', '맥심'),
(10, '블랙커피', '300', '1', '맥심');



DELETE FROM brand WHERE num = 10;
DELETE FROM brand WHERE num = 9;
DELETE FROM brand WHERE name = '설탕커피';

DELETE FROM brand;


INSERT INTO brand (num, name, price, hot, company)
VALUES (1, '팹시콜라', '1000', '0', '팹시');

INSERT INTO brand (num, name, price, hot, company)
VALUES (2, '코카콜라', '1000', '0', '코카콜라'),
(3, '데미소다 복숭아', '1000', '0', '동아오츠카'),
(4, '칠성사이다', '1000', '0', '롯데칠성'),
(5, '스프라이트', '1000', '0', '코카콜라'),
(6, '맥콜', '900', '0', '성남'),
(7, '핫식스', '1200', '0', '롯데칠성');

SELECT * FROM brand;

UPDATE brand SET price = '500' WHERE num = 5;

UPDATE brand SET name = '비타500', price = '700',
temp = '0', company = '경동제약'
WHERE num = 7;

UPDATE brand SET price = '500';



SELECT * FROM brand;

SELECT * FROM brand
WHERE hot IS NULL;

SELECT * FROM brand
WHERE hot IS NOT NULL;

SELECT * FROM brand WHERE hot = '';







