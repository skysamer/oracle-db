drop tablespace multi including contents and datafiles;

create TABLESPACE multi
datafile 'C:\lib\multi.dbf'
size 10M
autoextend on next 1M maxsize UNLIMITED;

create user scott identified by TIGER
default TABLESPACE multi;

create user test01 identified by 1234
default TABLESPACE multi;
grant connect, resource to test01;
conn test01/12134;
revoke connect, resource from test01;
drop user test01 cascade;


grant connect, resource to scott;

--sqlplus scott/TIGER;
conn scott/TIGER;


select * from tab;



계정생성 : scott/TIGER



--교육생계정
--계정 : USER31
--PW  : oracle_4U1214

--오라클 계정
--.System/1234
--.Hr/hr
--.scott/TIGER


--System 계정의 비밀번호 분실시 사용 
Sqlplus / as sysdba
Alter user system identified by 1111;




select * from tab; 
--@c:\lib\datatable.sql;

select
*
FROM emp;

select user from dual;
DESCRIBE dept;
DESC dual;


SELECT
    empno,    ename,    job,    sal,    deptno
FROM
    emp;
    
SELECT ename , sal , comm,deptno,job
from emp;

SELECT ename as 사원명, sal as "월 급" ,sal*12  "년 봉"
from emp;

-- 자바 문자열 ==>""   , 오라클 문자열 ==> ''

select FIRST_NAME  as 사원명,  SALARY||'원'  as "월 급" , SALARY*12  "년 봉"
from employees;  

-- null
SELECT ename as 사원명,sal,nvl(comm,0) 영업수당, sal+nvl(comm,0) as "월 급" 
from emp;

-- A + 10 ==> ?

SELECT empno,ename,nvl(to_char(mgr),'<<TOP>>') 상사
FROM emp;

SELECT EMPLOYEE_ID,FIRST_NAME ||' '|| LAST_NAME  as 사원명 ,nvl(to_char(MANAGER_ID),'<<TOP>>') 상사
FROM employees;

select job from emp ;
select DISTINCT job from emp ;
select DISTINCT deptno,job from emp ;

      --RR/MM/DD
SELECT sysdate , user from dual;

