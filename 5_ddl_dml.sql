--10장 : 데이타 조작어  DML   : Insert 	Update  	delete  ==> rollback 가능 
--11장 DDL  Table 생성  (auto commit) ==> rollback 불가능 

-- 프로젝트 ==>  CURD : Insert,Update,select ,delete
-- SQL : DML,DDL,DTL,DCL,Query문 (select)

-- Book 테이블
-- title,author,pubdate,.......

select user from dual;

drop table book;
CREATE TABLE book(
   bookno NUMBER(5) ,
   title  VARCHAR2(30) ,
   author VARCHAR2(30) ,
   pubdate DATE
);

select * from book;
ROLLBACK; -- 이전명령취소
COMMIT;  --확정 

DESC book;

INSERT INTO book ( bookno, title, author, pubdate) 
            VALUES ( 1 ,'java'  ,'홍길동'    ,SYSDATE );
COMMIT;  --확정 

INSERT INTO book VALUES ( 2 ,'sql'  ,'홍길동'    ,SYSDATE );
INSERT INTO book ( bookno, title ) VALUES ( 3 ,'Spring' );
INSERT INTO book VALUES ( 3 ,'HTML5'  ,'고길동' ,null  );
--RR/MM/DD
--select sysdate from dual
INSERT INTO book VALUES ( 4 ,'HTML5'  ,'김길동' ,'2017/1/5' );
INSERT INTO book VALUES ( 4 ,'HTML5'  ,'김길동' ,'17/1/5' );
INSERT INTO book VALUES ( 4 ,'HTML5'  ,'김길동' ,to_date('12/30/2017','mm/dd/yyyy') );

delete from book where author is null;
ROLLBACK;
COMMIT;

update book set title='...',author='???' where bookno=1;


INSERT INTO book VALUES ( 5 ,'jQuery'  ,'이길동' ,'20/1/5' );

desc book;
alter table book add(price number(7));  -- auto commit
alter table book drop COLUMN price ;  -- auto commit
alter table book modify(price number(9,2));  -- auto commit

update book set price=0 where price is null;
INSERT INTO book VALUES ( 2 ,'sql'  ,'홍길동'    ,SYSDATE ,900);
INSERT INTO book VALUES ( 7 ,'sql'  ,'홍길동'    ,SYSDATE ,900.99);
update book set price=null;

--------------------------------------------
###############  ddl autocommit #################
drop table book;
CREATE TABLE book(
   bookno NUMBER(5) ,
   title  VARCHAR2(30) ,
   author VARCHAR2(30) ,
   pubdate DATE
);
desc book;
alter table book add(price number(7));  -- auto commit
alter table book drop COLUMN price ;  -- auto commit
alter table book modify(price number(9,2));  -- auto commit
rename book to book2;
rename book2 to book;

DELETE from book;     -- rollback 가능 
TRUNCATE table book;  -- auto commit
drop table book;      -- auto commit
################################################################
select * from emp;
select * from dept;

CREATE TABLE emp2 as select * from emp;
CREATE TABLE dept2 as select * from dept;

desc dept;

insert into dept values(50,'EDU','SEOUL');
insert into dept2 values(50,'EDU','SEOUL');

insert into dept values(null,'EDU','SEOUL');
insert into dept2 values(10,'EDU','SEOUL');

insert into emp(empno,ename,hiredate,sal,deptno) 
            values(9999,'홍길동',sysdate,0,90);
            
insert into emp2(empno,ename,hiredate,sal,deptno) 
            values(9999,'홍길동',sysdate,0,90);           

-- drop table  휴지통에 있는 삭제된 테이블 복구 명령 -------
drop table emp2 purge;
select * from recyclebin;
FLASHBACK table emp2 to before drop;
purge recyclebin;

---- 제약 조건 
drop table book purge;
CREATE TABLE book(
   bookno NUMBER(5) primary key,   --unique + not null   , index 생성
   title  VARCHAR2(30) unique,     -- index 생성
   author VARCHAR2(30) ,
   price number(7,2) check(price>0),
   pubdate DATE default sysdate
);

drop table book purge;
CREATE TABLE book(
   bookno NUMBER(5) ,
   title  VARCHAR2(30) unique,     -- index 생성
   author VARCHAR2(30) not null ,
   price number(7,2) check(price>0),
   pubdate DATE default sysdate
);

alter table book add CONSTRAINT book_bookno_pk primary key(bookno);
alter table book drop CONSTRAINT book_bookno_pk;



INSERT INTO book VALUES ( 1 ,'HTML5'  ,'김길동' ,900,'2017/1/5' );
INSERT INTO book VALUES ( 2 ,'jsp'  ,'김길동' ,900,'2017/1/5' );
INSERT INTO book VALUES ( 3 ,'spring'  ,null ,null,'2017/1/5' );
INSERT INTO book VALUES ( 4 ,'....'  ,null ,999,'2017/1/5' );
INSERT INTO book ( bookno)  VALUES ( 5 );


----  emp   ,  dept   제약 조건 설정 
select * from dept; 
delete from dept where deptno=50;

drop table dept2 purge;
create table dept2 as select * from dept;
desc dept2;
alter table dept2 add CONSTRAINT dept2_deptno_pk primary key(deptno);

drop table emp2 purge;
create table emp2 as select * from emp;
desc emp2;
alter table emp2 add CONSTRAINT emp2_empno_pk primary key(empno);

alter table emp2 add CONSTRAINT emp2_deptno_fk foreign key(deptno) references dept2;
delete from dept2 where deptno =20; --X

alter table emp2 drop CONSTRAINT emp2_deptno_fk ;

alter table emp2 
add CONSTRAINT emp2_deptno_fk 
foreign key(deptno) references dept2 ON DELETE SET NULL;
delete from dept2 where deptno =20; --o  null값 세팅 

alter table emp2 
add CONSTRAINT emp2_deptno_fk 
foreign key(deptno) references dept2 ON DELETE CASCADE;
delete from dept2 where deptno =20; --o 자식도 같이 삭제 


alter table emp2 add CONSTRAINT emp2_mgr_fk foreign key(mgr) references emp2;


insert into emp2(empno,ename,hiredate,sal,deptno,mgr) 
            values(7777,'홍길동',sysdate,0,90,null);

delete from dept2 where deptno =20;

-- 트랜잭션 
-- 자식을 먼저 지우고 부모를 지운다.
drop table dept2 CASCADE CONSTRAINT purge;
create table dept2 as select * from dept;

--창1
delete from dept2 where deptno = 10;

--창2
update dept2 set loc='....' where deptno=10;
-- commit , rollback 처리 필요 
commit;

delete from dept2 where deptno = 10;
delete from dept2 where deptno = 20;
savepoint aa1;
delete from dept2 where deptno = 30;

update dept2 set loc='....' where deptno=10;
rollback to savepoint aa1;
insert into dept2 values(50,'eee','seoul');
delete from dept2 where deptno = 50;
commit;




