--  한 줄 주석
# 한줄 주석alter
/*
여러중 주석
여러줄 주석
*/

use shopdb;  -- 데이터베이스 선택

-- select 칼럼명 from 테이블명 where 조건;

select * from membertbl;

-- ctrl + enter : 한 줄 실행
-- ctrl + shift + enter : 전체 실행 또는 선택한 블록 실행

select memberaddress from membertbl;
select memberaddress from membertbl where membername = '당당';
select * from producttbl;
select productname, amount from producttbl where amount < 5;

-- employees 데이터베이스에서 titles 테이블의 모든 데이터를 출력..
use employees;
select * from titles;

use shopdb;
select * from membertbl;
select * from producttbl;

-- 상성 제품만 출력..

select * from producttble where company = '삼성';

-- 세탁기의 원가는 얼마인가..
select cost from producttbl where productname = '세탁기';

-- shopdb 데이터베이스의 테이블 목록을 출력..
show tables;

show databases;

-- employees 데이터베이스에서 종업원 전체 목록을 출력..
use employees;

show tables;
select * from employess;
select count(*) from employees;

-- 남성 종사자의 목록을 출력하시오..
select * from employees where gender='M';

-- 60년 이전 출생자의 목록을  출력..
select emp_no, last_name from employees where birth_date < '1970-01-01'; 
select * from employees;

-- 연봉 1억 이상인 사람의 emp_no 출력..
show tables;
select emp_no from salaries where salary > 100000;

-- 연봉 1억 이상인 사람의 인원수를 출력..
select  count(emp_no) from salaries where salary > 100000;

-- 입사연도가 1990년 07월 07일 이전인, 'engineer'의 데이터를 출력..
show tables;
select * from titles where title = 'engineer' and from_date < '1990-07-07';

-- table을 생성하고 값을 입력하는 sql query..

-- (create database 데이터베이스이름;)
-- (use 데이터베이스 이름;)
-- create table 테이블이름 (칼럼명, 데이터타입, 제약조건);
-- insert into 테이블이름 (칼럼명) values (값1, 값2, ...)

create database sqldb;
use sqldb;
create table usertbl (
	userid char(8) not null primary key,
    name varchar(10) not null,
    birthyear int not null,
    addr char(2) not null,
    mobile1 char(3),
    mobile2 char(8),
    height smallint,
    mdate date);
    
insert ignore into usertbl values ('LSG', '이승기', 1987, '서울', '001', '11111111', 182, '2008-08-08');
insert ignore into usertbl values ('KBS', '김범수', 1979, '경남', '001', '22222222', 175, '2012-09-08');
insert ignore into usertbl values ('KKH', '김경호', 1984, '인천', '010', '11122121', 177, '2010-08-08');
insert ignore into usertbl values ('JYP', '조용필', 1963, '부산', '001', '33333333', 166, '2009-08-08');
insert ignore into usertbl values ('SSK', '성시경', 1979, '서울', Null, Null, 187, '2013-12-12');
insert ignore into usertbl values ('LJB', '임재범', 1969, '서울', '006', '11122121', 182, '2009-08-08');
insert ignore into usertbl values ('YJS', '윤종신', 1969, '경남', Null, Null, 170, '2005-08-08');
insert ignore into usertbl values ('EJW', '은지원', 1972, '경기', '001', '11111111', 174, '2014-03-03');
insert ignore into usertbl values ('BBK', '바비킴', 1973, '서울', '010', '00000000', 181, '2008-12-08');
insert ignore into usertbl values ('JWK', '조관우', 1965, '광주', '010', '00000000', 172, '2013-10-10');

select * from usertbl;
    
create table buytbl
( num int not null primary key auto_increment,
  userid char(8) not null,
  prodname char(8) not null,
  groupname char(4),
  price int not null,
  amount smallint not null
);

insert into buytbl values (Null, 'KBS', '노트북', '전자', 1000, 1);
insert into buytbl values (Null, 'JYP', '모니터', '전자', 200, 5);

select * from buytbl;

drop database if exists sqldb;
create database sqldb;

USE sqldb;
CREATE TABLE userTbl -- 회원 테이블
( userID   CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  username    VARCHAR(10) NOT NULL, -- 이름
  birthYear   INT NOT NULL,  -- 출생년도
  addr    CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  mobile1 CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2 CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
  height     SMALLINT,  -- 키
  mDate     DATE  -- 회원 가입일
);

CREATE TABLE buyTbl -- 회원 구매 테이블
(  num  INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   userID   CHAR(8) NOT NULL, -- 아이디(FK)
   prodName  CHAR(6) NOT NULL, --  물품명
   groupName  CHAR(4)  , -- 분류
   price      INT  NOT NULL, -- 단가
   amount     SMALLINT  NOT NULL -- 수량
);

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');

INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buyTbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);

select * from usertbl;
select * from buytbl;

-- 김경호라는 가수의 데이터를 출력..
select * from usertbl where username = '김경호';

-- 출생년도가 1970년 이후이고, 키가 182 이상인 회원의 userid, 이름을 출력..
select  userid, username from usertbl where birthYear > 1970 and height >= 182;

-- 키가 180 이상이고 183 이하인 회원의 이름을 출력..
select userid, username from usertbl where height >= 180 and height <= 183;
select userid, username from usertbl where height between 180 and 183;

-- 출생지가 '경남', '전남' 또는 '경북'인 회원의 이름과 아이디, 주소를 출력..
select username, userid, addr from usertbl where addr = '경남' or addr = '전남' or addr = '경북';
select username, userid, addr from usertbl where addr in ('경남', '전남', '경북');

-- 텍스트 검색
-- 성이 '김'인 사람의 데이터를 출력.
select username from usertbl where username like '김%';

-- 이름이 '종신' 인 사람의 데이터를 출력..
select username from usertbl where username like '%종신';

-- 이름이 '종신'인 성이 한글자인 사람의 데이터를 출력
select username from usertbl where username like '_종신';

-- 키가 178 이상인 사람의 데이터를 출력..
select username, height from usertbl where height >= 178;

-- 임재범 보다 키가 큰 사람의 데이터를 출력..
select username, height from usertbl where (select height from usertbl where username = '임재범') < height; -- subquery

-- 임재범 보다 나이가 많은 사람의 이름을 출력하시오..
select * from usertbl;
select username from usertbl where (select birthYear from usertbl where username = '임재범') > birthYear;

-- 김범수 출생지역이 동일한 사람의 데이터를 출력하시오..
select username from usertbl where (select addr from usertbl where username = '김범수') = addr;

-- 경남에 사는 사람 보다 키가 큰 사람의 데이터를 출력..
select height from usertbl where addr = '경남';
select username from usertbl where height > (select height from usertbl where addr = '경남'); -- error
select username from usertbl where height > all(select height from usertbl where addr = '경남');  -- all() 최대값 모든값도가 커야만 True
select username from usertbl where height > any(select height from usertbl where addr = '경남');  -- any() 최소값 어느 하나보다 크면 True

-- 경남에 사는 사람과 키가 동일한 사람의 데이터를 출력..
select username from usertbl where height = (select height from usertbl where addr = '경남');  -- error
select username from usertbl where height in (select height from usertbl where addr = '경남');

-- 정렬(sort)  : order by
-- 출생 기준으로 오름차순 정렬해서 출력..
select * from usertbl order by birthYear;

-- 출생 기준으로 내림차순 정렬해서 출력..
select * from usertbl order by birthYear desc;

-- 키 순으로 오름차순 정렬하시오..
select * from usertbl order by height desc;

-- 출생지의 종류를 중복값없이 출력하시오..
select distinct(addr) from usertbl;

-- 출생지 종류수를 출력하시오.. 
select count(distinct(addr)) from usertbl;


-- n개만 출력..
select * from usertbl limit 3;

-- 키가 가장 큰 사람의 이름을 출력하시오..
select username from usertbl order by height desc limit 1;

-- subquery를 이용해서 기존 table을 복사해서 새로운 table을 생성..
create table buytbl1 (select * from buytbl);
select * from buytbl1;

create table buytbl2 (select userid, prodname from buytbl1);
select * from buytbl2;

create table usertbl1 (select height from usertbl where addr='경남');
select * from usertbl1;

show tables;

drop table usertbl1;







