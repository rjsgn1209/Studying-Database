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

use sqldb;


select * from usertbl;
select * from buytbl;

-- 총구매액
select userid from buytbl group by userid;
select userid, sum(amount) from buytbl group by userid;
select userid, sum(amount) as total_amount from buytbl group by userid order by total_amount;

-- 평균 구매액
select userid, avg(amount) as '평균구매금액' from buytbl group by userid order by avg(amount);

-- 구매횟수
select userid, count(amount) as '구매횟수' from buytbl group by userid;

-- 사용자별 총구매액이 1000 이상인 고객데이터 출력..
-- select userid, sum(price * amount) as '총구매금액' from buytbl group by userid where '총구매금액' >= 1000; -- error
select userid, sum(price * amount) as '총구매금액' from buytbl group by userid having sum(price * amount) >= 1000;

-- 구매 횟수가 2회이상인 고객정보를 출력..
select * from buytbl group by userid having count(amount) >= 2;

-- usertbl에서 가장 키가 큰 사람과 작은 사람을 출력하시오..
select username from usertbl where height in ((select max(height) from usertbl), (select min(height) from usertbl), (select min(height) from usertbl));
select username, max(height) from usertbl;
select username, min(height) from usertbl;

use employees;
select * from employees;

create table testtbl1(id int, fname varchar(50), lname varchar(50));
insert into testtbl1 select emp_no, first_name, last_name from employees.employees;
select * from testtbl1;


-- 데이터 수정 : update ~ set ~;
select * from testtbl1 where fname='Aamer';
update testtbl1 set lname='없음' where fname='Armer';

-- buytbl 가격을 1.5배 올린 값으로 수정..alter
use sqldb;
update buytbl set price = price * 1.5;
select * from buytbl;

-- buytbl에서 모니터 가격을 50% 할인하도록 가격을 수정..
update buytbl set price = price * 0.5 where prodname = '모니터';
select * from buytbl;

-- 데이터 삭제 : delete.. (where)
-- fname의 'Aamer'인 데이터들을 삭제..
select * from texttbl1 where fname= 'Aamer';
delete from texttbl1 where fname = 'Aamer';

## Join
use sqldb;
select * from usertbl;
select * from buytbl;

-- inner join
select * from buytbl inner join usertbl
	on buytbl.userid = usertbl.userid;

select * from buytbl b inner join usertbl u
	on b.userid = u.userid;

select * from buytbl, usertbl
	where buytbl.userID = usertbl.userID;

select * from buytbl b, usertbl u
	where b.userid = u.userID;
    
-- 조용필이 구매한 제품의 이름과 조용필의 주소를 출력하시오..
select prodname, addr from buytbl inner join usertbl
	on buytbl.userid = usertbl.userid
	where username = '조용필';
    
-- 모니터를 구매한 사람들의 이름을 출력..
select username from buytbl b inner join usertbl u
	on b.userid = u.userid
    where prodname = '모니터';
    
-- 전화번호가 없는 고객의 이름, 주소, 구매제품을 출력
select username, addr, prodname from usertbl inner join buytbl
	on usertbl.userid = buytbl.userid
    where mobile1 is null;

-- 총구매금액이 가장 큰 고객정보를 출력..
select username, amount, price, sum(amount * price) '총구매금액' from usertbl inner join buytbl
	on usertbl.userid = buytbl.userid
    group by usertbl.userid
    order by sum(amount * price) desc
    limit 1;
    
-- left join
select * from buytbl b left join usertbl u
	on b.userid = u.userid;
    
-- right join
select * from buytbl b right join usertbl u
	on b.userid = u.userid;
    
-- table 3개 join
create table stdtbl (
	stdname varchar(10) not null primary key,
    addr char(4) not null);
    
insert into stdtbl values ('김범수', '경남'), ('성시경', '서울'), ('조용필', '경기'), ('은지원', '경북'),
	('바비킴', '서울');
    
select * from stdtbl;

create table clubtbl (
	clubname varchar(10) not null primary key,
    roomno char(4) not null);
    
insert into clubtbl values ('수영', '101호'), ('바둑', '102호'), ('축구', '103호'), ('봉사', '104호');
select * from clubtbl;

create table stdclubtbl(
	num int auto_increment not null primary key,
    stdname varchar(10) not null,
    clubname varchar(10) not null);
    
insert into stdclubtbl values (null, '김범수', '바둑'), (null, '김범수', '축구'), (null, '조용필', '축구'), (null, '은지원', '축구'), (null, '바비킴', '봉사');
select * from stdclubtbl;
    
    
select * from stdtbl;
select * from clubtbl;
select * from stdclubtbl;

select * from stdtbl inner join stdclubtbl on stdtbl.stdname = stdclubtbl.stdname	
					 inner join clubtbl on clubtbl.clubname = stdclubtbl.clubname;
                     
select * from stdtbl s inner join stdclubtbl sc on s.stdname = sc.stdname
					   inner join clubtbl c on c.clubname = sc.clubname;
                       
select * from stdtbl, stdclubtbl, clubtbl
	where stdtbl.stdname = stdclubtbl.stdname
    and clubtbl.clubname = stdclubtbl.clubname;
					
-- 축구부에 가입한 학생의 주소를 출력..
select addr from stdtbl s, stdclubtbl sc, clubtbl c
	where s.stdname = sc.stdname
    and c.clubname = sc.clubname
    and c.clubname = '축구';
	
### if구문 / case when 구문

drop procedure if exists ifproc3;
delimiter $$

create procedure ifproc3()

begin
	declare point int;
    declare credit char(1);
    set point = 77;
    
    if point >= 90 then
		set credit = 'A';
	elseif point >= 80 then
		set credit = 'B';
	elseif point >= 70 then
		set credit = 'c';
	else	
		set credit = 'D';
	end if;
	
    select concat('취득학점: ', point), concat('학점: ', credit);
end $$

delimiter ;

call ifproc3();

-- case when

drop procedure if exists ifproc2;
delimiter $$

create procedure ifproc2()

begin
	declare point int;
    declare credit char(1);
    set point = 77;
    
    case
		when point >= 90 then
			set credit = 'A';
		when point >= 80 then
			set credit = 'B';
		when point >= 70 then
			set credit = 'C';
		else
			set credit = 'D';
	end case;
	
    select concat('취득학점: ', point), concat('학점: ', credit);
end $$

delimiter ;

call ifproc2();

select u.userid, u.username, sum(price * amount) as 'total_amount'
	from buytbl b left join usertbl u
    on b.userid = u.userid
    group by u.userid
    order by total_amount;
    
    
-- 기본함수..

-- cast : 데이터 타입을 변환
select cast('2020-10-16 12:25:29:123' as date) as 'date';
select cast('2020-10-16 12:25:29:123' as time) as 'Time';
select cast('2020-10-16 12:25:29:123' as datetime) as 'DateTime';

-- concat ; 이어주는 함수
use sqldb;
show tables;

select num, concat(cast(price as char(10)), 'x', cast(amount as char(10)), '=') as '가격*구매량', price*amount as '총구매금액'
	from buytbl; 
    
select concat('100', '200');
select concat('/', '2020', '01', '01') as 날짜;

-- isnull(요소1, 요소2) : 요소1이 null이면 요소2를 리턴, 요소1이 null이 아니면 요소1을 리턴
select ifnull(null, 100);
select ifnull(100, 200);

-- insert('문자열1', index, length, '문자열2') : 문자열1의 index 위치에 length 길이 인덱스에 문자열2를 입력..
select insert ('abcdefghijk', 3, 4, '@@@@');    
select insert ('abcdefghijk', 3, 2, '@@@@');

-- left ('문자열', num) : 문자열 왼쪽의 num갯수 만큼 출력
-- right ('문자열', num) : 문자열 오른쪽으로부터 num갯수 만큼 요소 출력
select left('abcdefghi', 3);
select right('abcdefghi', 3);

-- repeat('문자열', n) : 문자열을 n회 반복
select repeat('abc', 10);
    
-- lower()
select lower('abcdEFG');
select upper('abcdEFG');
    
-- lpad('문자열1', num, '@') : 문자열 1을 num 크기 만큼 자리수를 늘리고 반자리를 '@'로 채운다
select lpad('abc', 7, '@');
select rpad('abc', 7, '@');

-- lstrim, rstrim : 좌우 공백제거..
select ltrim('   abc    ');
select rtrim('   abc    ');

-- replace('문자열1', '문자열2', '문자열3') : 문자열1에서 문자열2를 찾아서 문자열3으로 변경..
select replace('hello mysql', 'mysql', 'python');

-- abs
select abs(-3);

-- ceiling(), floor(), round()
select ceiling(4.7);
select floor(4.7);
select round(4.7);
select round(4.3);
    
-- mod : 나머지 계산
select mod(11,2);
select mod(17,3);

-- sqrt: 제곱근
select sqrt(9);

-- pow : 승
select pow(2, 3);

-- lenght : 길이
select length('abc');
select length('가나다라');
    
    
    
    
    
    
    