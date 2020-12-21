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



�������� : scott/TIGER



--����������
--���� : USER31
--PW  : oracle_4U1214

--����Ŭ ����
--.System/1234
--.Hr/hr
--.scott/TIGER


--System ������ ��й�ȣ �нǽ� ��� 
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

SELECT ename as �����, sal as "�� ��" ,sal*12  "�� ��"
from emp;

-- �ڹ� ���ڿ� ==>""   , ����Ŭ ���ڿ� ==> ''

select FIRST_NAME  as �����,  SALARY||'��'  as "�� ��" , SALARY*12  "�� ��"
from employees;  

-- null
SELECT ename as �����,sal,nvl(comm,0) ��������, sal+nvl(comm,0) as "�� ��" 
from emp;

-- A + 10 ==> ?

SELECT empno,ename,nvl(to_char(mgr),'<<TOP>>') ���
FROM emp;

SELECT EMPLOYEE_ID,FIRST_NAME ||' '|| LAST_NAME  as ����� ,nvl(to_char(MANAGER_ID),'<<TOP>>') ���
FROM employees;

select job from emp ;
select DISTINCT job from emp ;
select DISTINCT deptno,job from emp ;

      --RR/MM/DD
SELECT sysdate , user from dual;

