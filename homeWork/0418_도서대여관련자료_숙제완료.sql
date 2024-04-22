select * from books;
select * from customers;
select * from orders;

/* 도서 주문관리 프로젝트에 필요한 테이블 설계 */
/* 고객테이블 */
create table customers (
  custid   int not null AUTO_INCREMENT PRIMARY KEY,	/* 고객 고유번호 */
  customer varchar(20)  not null,			/* 고객명 */
  address  varchar(30)  not null,			/* 고객주소 */
  phone    varchar(15)  not null				/* 고객 연락처 */
);

/* 책정보 테이블 */
create table books (
  bookid    int not null AUTO_INCREMENT  PRIMARY KEY,	/* 책 고유번호 */
  bookname  varchar(30) not null,			/* 책이름 */
  publisher varchar(20) not null,			/* 출판사명 */
  price     int not null						/* 책가격(정가) */
);

/* 주문 테이블 */
create table orders (
  orderid  int not null AUTO_INCREMENT PRIMARY KEY,	/* 주문 고유번호 */
  custid   int not null,		/* 고객 고유번호(고객테이블의 고유번호이다.) */
  bookid   int not null,		/* 책 고유번호(책테이블의 고유번호이다.) */
  saleprice int not null,		/* 실제 책 구입가격 */
  orderdate TIMESTAMP,			/* 책 주문 날짜 */
  FOREIGN KEY(custid) REFERENCES customers(custid) on update RESTRICT,
  FOREIGN KEY(bookid) REFERENCES books(bookid) on update RESTRICT
);

/* 자료파일 */
-- books(책정보)
INSERT INTO books VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO books VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO books VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO books VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO books VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO books VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO books VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO books VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO books VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO books VALUES(10, 'Olympic Champions', 'Pearson', 13000);
INSERT INTO books VALUES(11, '가나다', '삼성당', 17500);
INSERT INTO books VALUES(12, '포토샵CS6', '제우미디어', 25000);
INSERT INTO books VALUES(13, '아시안게임 이야기', '스포츠북', 19500);
INSERT INTO books VALUES(14, '우리들 이야기', '우리출판사', 5000);
INSERT INTO books VALUES(15, '서로 사랑하자', '이상미디어', 18000);
INSERT INTO books VALUES(16, '하나된 마음으로', '대한미디어', 21000);
INSERT INTO books VALUES(17, '나눌수 있을때', '나무수', 9000);
INSERT INTO books VALUES(18, '함박눈 내리는날', '이상미디어', 15000);
INSERT INTO books VALUES(19, '나보다 축구를', '굿스포츠', 23000);
INSERT INTO books VALUES(20, '시작했을때 한번더', '삼성당', 19000);

-- customers(고객정보)
INSERT INTO customers VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO customers VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO customers VALUES (3, '김말숙', '대한민국 강원도', '000-7000-0001');
INSERT INTO customers VALUES (4, '손흥민', '영국 토트넘', '000-8000-0001');
INSERT INTO customers VALUES (5, '박세리', '대한민국 대전',  '001-0011-0012');
INSERT INTO customers VALUES (6, '이순신', '대한민국 아산',  '001-0009-0007');
INSERT INTO customers VALUES (7, '소나무', '대한민국 청주',  '000-1100-0050');

-- orders(주문정보) 데이터 생성
INSERT INTO orders VALUES (1, 1, 1, 6000, '2019-08-01'); 
INSERT INTO orders VALUES (2, 1, 3, 21000, '2018-09-03');
INSERT INTO orders VALUES (3, 2, 5, 8000, '2022-11-03'); 
INSERT INTO orders VALUES (4, 3, 6, 6000, '2020-06-04'); 
INSERT INTO orders VALUES (5, 4, 7, 19000, '2019-11-05');
INSERT INTO orders VALUES (6, 1, 2, 12000, '2021-09-07');
INSERT INTO orders VALUES (7, 4, 8, 11000, '2019-03-07');
INSERT INTO orders VALUES (8, 3, 10, 12000, '2021-07-08');
INSERT INTO orders VALUES (9, 2, 10, 9000, '2017-05-09');
INSERT INTO orders VALUES (10, 3, 18, 13000, '2023-10-11');
INSERT INTO orders VALUES (11, 7, 15, 15000, '2023-06-17');
INSERT INTO orders VALUES (12, 7, 20, 16000, '2023-12-19');
INSERT INTO orders VALUES (13, 3, 19, 23000, '2023-06-30');
INSERT INTO orders VALUES (14, 1, 16, 17000, '2023-11-21');
INSERT INTO orders VALUES (15, 4, 15, 13000, '2023-05-12');
INSERT INTO orders VALUES (16, 7, 10, 13000, '2023-09-24');
INSERT INTO orders VALUES (17, 1, 12, 23000, '2023-02-26');
INSERT INTO orders VALUES (18, 2, 11, 13000, '2023-09-16');
INSERT INTO orders VALUES (19, 4, 20, 13000, '2023-03-20');
INSERT INTO orders VALUES (20, 4, 15, 20000, '2023-04-26');

show tables;
drop table orders;
drop table books;
drop table customers;

select * from books;
select * from customers;
select * from orders;

/* ---------------------------------------------------------- */

-- 1번이상 구매한 책들의 정보?(구매 날짜순 출력)
select * from orders order by orderdate;

-- 1번이상 구매한 책들의 정보?(구매 날짜순 출력, 같은책은 1번씩만 출력) - GROUP BY
select distinct bookid from orders order by orderdate;
select * from orders GROUP BY bookid;
select * from orders GROUP BY bookid order by orderdate;

-- 1번이상 구매한 책들의 정보?(책 이름과 함께 출력)
select o.*, b.bookname from orders o, books b where o.bookid = b.bookid;

-- 1번이상 구매한 책들의 정보?(주문번호, 주문날짜, 책 이름, 정가, 세일가 출력) - 주문 내림차순.
select o.orderid, o.orderdate, b.bookname, b.price, o.saleprice  
  from orders o, books b 
  where o.bookid = b.bookid;

-- 1번이상 구매한 책들의 정보?(주문번호, 주문날짜, 책 이름, 정가, 세일가 출력) - 주문 내림차순.
-- 앞의 조건중에서 최근에 구매한 5권의 책정보?
select o.orderid, o.orderdate, b.bookname, b.price, o.saleprice  
  from orders o, books b 
  where o.bookid = b.bookid order by o.orderdate desc limit 5;

-- 1번이상 구매한 책들의 정보?(주문번호, 주문날짜, 책 이름, 정가, 세일가 출력) - 주문 내림차순.
-- 앞의 조건중에서 최근에 구매한 5권의 책정보? (중복주문된 책은 1회만 출력)
select o.orderid, o.orderdate, b.bookname, b.price, o.saleprice  
  from orders o, books b 
  where o.bookid = b.bookid 
  group by o.bookid
  order by o.orderdate desc limit 5;

-- '책을 구매한 사람의 이름/책이름/구매가격/구매날짜'를 모두출력?- 중복허용
select c.customer,b.bookname,o.saleprice,o.orderdate from orders o, books b, customers c 
  where o.bookid=b.bookid and o.custid=c.custid;
  
-- '책을 구매한 사람의 이름/책이름/구매가격/구매날짜'를 모두출력?- 중복허용 : 구매자명을 최근판매 1회만 출력
select c.customer,b.bookname,o.saleprice,o.orderdate from orders o, books b, customers c 
  where o.bookid=b.bookid and o.custid=c.custid
  group by c.customer order by o.orderdate desc;
  
-- '책을 구매한 사람의 이름/책이름/구매가격/구매날짜'를 모두출력?
-- 단, 구매자가 구매한 책의 권수를 함께 출력
select c.customer,b.bookname,o.saleprice,o.orderdate, count(o.custid) as cnt
  from orders o, books b, customers c 
  where o.bookid=b.bookid and o.custid=c.custid
  group by c.customer order by o.orderdate desc;

-- '책을 구매한 사람의 이름/책이름/구매가격/구매날짜'를 모두출력?
-- 단, 구매자가 구매한 책의 '총개수,총가격,총가격평균'을  함께 출력
select c.customer,b.bookname,o.saleprice,o.orderdate, 
  count(o.custid) as cnt, sum(o.saleprice) as sum, floor(avg(o.saleprice)) as avg
  from orders o, books b, customers c 
  where o.bookid=b.bookid and o.custid=c.custid
  group by c.customer order by o.orderdate desc;

-- '책을 구매한 사람의 이름/책이름/구매가격/구매날짜'를 모두출력?
-- 단, 구매자가 구매한 책의 '총개수,총가격,총가격평균'을  함께 출력
-- 단, 구매한 책이 4권 이상인 자료만 출력?
select c.customer,b.bookname,o.saleprice,o.orderdate, 
  count(o.custid) as cnt, sum(o.saleprice) as sum, floor(avg(o.saleprice)) as avg
  from orders o, books b, customers c 
  where o.bookid=b.bookid and o.custid=c.custid
  GROUP BY c.customer HAVING count(o.custid)>=4 order by o.orderdate desc;

-- '출판사'가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오?
select * from books where publisher='굿스포츠' or publisher='대한미디어';
select * from books where publisher IN('굿스포츠','대한미디어');

-- '출판사'가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색하시오?
select * from books where publisher NOT IN('굿스포츠','대한미디어');

-- '축구의 역사'를 출간한 출판사검색(도서명, 가격, 출판사명)
select bookname,price,publisher from books where bookname='축구의 역사';

-- 도서명이름중에서 '축구'가 포함된 도서명과 함께 출판사명을 검색?
select bookname,publisher from books where bookname like '%축구%';

-- 도서명중에서 앞에서 2번째글자가 '구'인 모든 도서를 검색?
select * from books where bookname like '_구%';
 
-- '축구' 또는 '야구'에 관한 도서중 가격이 2만원 이상인 도서의 '도서명, 가격, 출판사명' 출력?
select bookname, price, publisher from books 
  where (bookname like '%축구%' or bookname like '%야구%') and price >= 20000;

-- 도서명중 '구' 글자가 들어간 모든 도서를 검색하되, 가격 오름차순, 가격이 같으면 출판사명 내림차순출력
select * from books where bookname like '%구%' order by price, publisher desc;

-- 2023년에만 구매된 책들을 출력?
select * from orders;
select * from orders where year(orderdate)=2023;

-- 2023년에 가장 많이 판매된 책을 출력?
select count(bookid) from orders where year(orderdate)=2023 
  group by bookid order by count(bookid) desc limit 1;
  
select b.bookname,count(o.bookid) from orders o, books b 
  where o.bookid=b.bookid and year(o.orderdate)=2023 
  group by o.bookid order by count(o.bookid) desc limit 1;
  
-- 2023년 5월 1일부터 최근까지 판매된 책?(최근 내림차순 출력)
select * from orders where orderdate >= '2023-5-1' order by orderdate desc;

-- 각 고객별로 주문한 도서의 총 판매액을 출력하되, 고객 이름순으로 출력하시오(고객명, 총판매액 출력)
select c.customer, sum(o.saleprice) from orders o, customers c 
  where o.custid=c.custid group by c.customer;

-- 도서를 구매를 하든지, 구매하지 않던지, 모든 고객들의 이름과 구매한 도서명과 구매가격?
select c.customer, b.bookname, o.saleprice 
  from customers c LEFT JOIN orders o ON c.custid=o.custid LEFT JOIN books b ON o.bookid=b.bookid;
  
/* ------------------------------------------------------------------------------ */
-- 서브쿼리(Sub Query) : 하나의 SQL문안에서 또다른 SQL문을 포함시키는것.
/*
  1. select 컬럼명,(select ....) from 테이블명~~~
  2. select 컬럼명 from (select ....) ~~~~
  3. select 컬럼명 from 테이블명 where 필드명 = (select ...)~~~
*/

-- 도서를 한번이라도 구매한적이 있는 고객명을 출력하세요.
select o.custid, c.customer from orders o, customers c where o.custid=c.custid;
select o.custid, c.customer from orders o, customers c where o.custid=c.custid group by o.custid;
select customer from customers
	where custid in (select custid from orders);
	
-- 구매한 도서 중 가장 비싼 도서명은 어떤것인지, 도서명과 구매자, 구매 가격을 출력하세요
select (select customer from customers where custid=orders.custid) as 구매자, 
	(select bookname from books where bookid=orders.bookid) as 도서명,
	saleprice as 가격
	from orders order by saleprice desc limit 1;
	
	
	
-- '대한미디어'나 '삼성당'에서 출판한 도서를 구매한 고객의 이름?
select customer from customers
	where custid in (select custid from orders
	where bookid in (select bookid from books where publisher='대한미디어' or publisher='삼성당'));

-- 전체 출판사에서 판매된 책들의 평균 도서 가격보다 더 비싸게 판매된 책 이름과 판매 가격을 출력하세요
select b.bookname, o.saleprice from books b, orders o 
	where b.bookid=o.bookid and o.saleprice > (select avg(saleprice) from orders);

-- 도서를 주문하지 않은 고객의 이름은?
select customer from customers
	where custid not in (select custid from orders);
	










