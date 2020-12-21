--10�� : ����Ÿ ���۾�  DML   : Insert 	Update  	delete  ==> rollback ���� 
--11�� DDL  Table ����  (auto commit) ==> rollback �Ұ��� 

-- ������Ʈ ==>  CURD : Insert,Update,select ,delete
-- SQL : DML,DDL,DTL,DCL,Query�� (select)

-- Book ���̺�
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
ROLLBACK; -- ����������
COMMIT;  --Ȯ�� 

DESC book;

INSERT INTO book ( bookno, title, author, pubdate) 
            VALUES ( 1 ,'java'  ,'ȫ�浿'    ,SYSDATE );
COMMIT;  --Ȯ�� 

INSERT INTO book VALUES ( 2 ,'sql'  ,'ȫ�浿'    ,SYSDATE );
INSERT INTO book ( bookno, title ) VALUES ( 3 ,'Spring' );
INSERT INTO book VALUES ( 3 ,'HTML5'  ,'��浿' ,null  );
--RR/MM/DD
--select sysdate from dual
INSERT INTO book VALUES ( 4 ,'HTML5'  ,'��浿' ,'2017/1/5' );
INSERT INTO book VALUES ( 4 ,'HTML5'  ,'��浿' ,'17/1/5' );
INSERT INTO book VALUES ( 4 ,'HTML5'  ,'��浿' ,to_date('12/30/2017','mm/dd/yyyy') );

delete from book where author is null;
ROLLBACK;
COMMIT;

update book set title='...',author='???' where bookno=1;


INSERT INTO book VALUES ( 5 ,'jQuery'  ,'�̱浿' ,'20/1/5' );

desc book;
alter table book add(price number(7));  -- auto commit
alter table book drop COLUMN price ;  -- auto commit
alter table book modify(price number(9,2));  -- auto commit

update book set price=0 where price is null;
INSERT INTO book VALUES ( 2 ,'sql'  ,'ȫ�浿'    ,SYSDATE ,900);
INSERT INTO book VALUES ( 7 ,'sql'  ,'ȫ�浿'    ,SYSDATE ,900.99);
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

DELETE from book;     -- rollback ���� 
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
            values(9999,'ȫ�浿',sysdate,0,90);
            
insert into emp2(empno,ename,hiredate,sal,deptno) 
            values(9999,'ȫ�浿',sysdate,0,90);           

-- drop table  �����뿡 �ִ� ������ ���̺� ���� ��� -------
drop table emp2 purge;
select * from recyclebin;
FLASHBACK table emp2 to before drop;
purge recyclebin;

---- ���� ���� 
drop table book purge;
CREATE TABLE book(
   bookno NUMBER(5) primary key,   --unique + not null   , index ����
   title  VARCHAR2(30) unique,     -- index ����
   author VARCHAR2(30) ,
   price number(7,2) check(price>0),
   pubdate DATE default sysdate
);

drop table book purge;
CREATE TABLE book(
   bookno NUMBER(5) ,
   title  VARCHAR2(30) unique,     -- index ����
   author VARCHAR2(30) not null ,
   price number(7,2) check(price>0),
   pubdate DATE default sysdate
);

alter table book add CONSTRAINT book_bookno_pk primary key(bookno);
alter table book drop CONSTRAINT book_bookno_pk;



INSERT INTO book VALUES ( 1 ,'HTML5'  ,'��浿' ,900,'2017/1/5' );
INSERT INTO book VALUES ( 2 ,'jsp'  ,'��浿' ,900,'2017/1/5' );
INSERT INTO book VALUES ( 3 ,'spring'  ,null ,null,'2017/1/5' );
INSERT INTO book VALUES ( 4 ,'....'  ,null ,999,'2017/1/5' );
INSERT INTO book ( bookno)  VALUES ( 5 );


----  emp   ,  dept   ���� ���� ���� 
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
delete from dept2 where deptno =20; --o  null�� ���� 

alter table emp2 
add CONSTRAINT emp2_deptno_fk 
foreign key(deptno) references dept2 ON DELETE CASCADE;
delete from dept2 where deptno =20; --o �ڽĵ� ���� ���� 


alter table emp2 add CONSTRAINT emp2_mgr_fk foreign key(mgr) references emp2;


insert into emp2(empno,ename,hiredate,sal,deptno,mgr) 
            values(7777,'ȫ�浿',sysdate,0,90,null);

delete from dept2 where deptno =20;

-- Ʈ����� 
-- �ڽ��� ���� ����� �θ� �����.
drop table dept2 CASCADE CONSTRAINT purge;
create table dept2 as select * from dept;

--â1
delete from dept2 where deptno = 10;

--â2
update dept2 set loc='....' where deptno=10;
-- commit , rollback ó�� �ʿ� 
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




