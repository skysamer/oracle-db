SELECT
    empno,    ename,    job,    mgr,    hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�,    deptno
FROM  emp;

SELECT
    empno,    ename,    job,    mgr,    hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�,    deptno
FROM  emp
where sal+nvl(comm,0) >= 3000;

SELECT
    empno,    ename,    job,    mgr,    hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�,    deptno
FROM  emp
order by �޿� desc;

SELECT
from
where
order by 
;

SELECT deptno , empno,  ename,    job,  hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where sal+nvl(comm,0) > 900
order by 1 asc, �޿� Desc;

SELECT deptno , empno,  ename,    job,  hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where sal > 900
order by deptno asc, �޿� Desc;


SELECT
    employee_id,    first_name || last_name �̸�,    email,  hire_date,
    salary+ nvl(commission_pct,0) �޿�,    department_id
FROM
    employees
where department_id = 90
order by �޿�;

SELECT deptno , empno,  ename,    job,  hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where deptno = &deptno;   --ġȯ�Լ� 

SELECT deptno , job,  ename,    job,  hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where job ='manager';

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where job = '&job';   

SELECT deptno , lower(job), ename,     hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp;

select 'aaa',UPPER('aaa') , lower('AAA') from dual;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where UPPER(job) = UPPER('&job');   


-- show parameter nls;
SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where hiredate = '81/02/22';

select sysdate from dual;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where hiredate != '81/09/28';

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where hiredate <> '81/09/28';

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where hiredate = '81/02/20';


select sysdate from dual;


sELECT deptno , job,  ename,     hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where hiredate = to_date('20-2-1981','dd-mm-yyyy');

sELECT deptno , job,  ename,     hiredate �Ի��� ,    sal+nvl(comm,0) as �޿�
from emp
where hiredate < to_date('20-2-1981','dd-mm-yyyy');

sELECT    ename,  hiredate,  to_char(hiredate,'YYYY') �Ի�⵵ , to_char(hiredate,'MM') �Ի�� ,
          to_char(hiredate,'DD') �Ի���, to_char(hiredate,'DAY')
from emp;


-- '82/2/1'
select to_date('82/2/1','RR/MM/DD'),to_char(to_date('82/2/1','RR/MM/DD'),'YYYY') from dual; --1982
select to_date('82/2/1','YY/MM/DD'),to_char(to_date('82/2/1','YY/MM/DD'),'YYYY') from dual; --2082



SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where sal >= 3000 and sal <=5000
order by �޿� DESC;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where sal between 3000 and 5000
order by �޿� DESC;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where sal not between 3000 and 5000
order by �޿� DESC;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where deptno = 10 or deptno = 20
order by deptno, �޿� DESC;

-- ���� ������
SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where deptno  in(10,30)
order by deptno, �޿� DESC;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where deptno  not in(10,30)
order by deptno, �޿� DESC;

SELECT *
from dept
where (deptno ,loc) in ((10,'NEW YORK'),(30,'NEW YORK'));

--like ������  %  _  

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where ename ='ALLEN'
order by deptno, �޿� DESC;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where ename  like 'a%'
order by deptno, �޿� DESC;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where upper(ename)  like upper('a%') -- ?
order by deptno, �޿� DESC;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where upper(ename)  like upper('%a_s%') -- ?
order by deptno, �޿� DESC;

--emp ���̺���  81 �⵵�� �Ի��� ��� 
SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where hiredate like '81%';

--emp ���̺���  9�� �Ի��� ��� 
SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where to_char(hiredate,'MM') like '%9%';

-- �̸��� A,B,C,D �� �����ϴ� ��� ��� 
SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where ename like 'A%' or ename like 'B%' or ename like 'C%' or ename like 'D%';

-- ���Խ� ���
SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where REGEXP_LIKE (ename, 'A|B|C|D');

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where REGEXP_LIKE (ename, '^[A-D]');

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where REGEXP_LIKE (ename, '[A-D]$');

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿� , comm
from emp
where comm is null
order by 1;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿� , comm
from emp
where comm is not null
order by 1;

SELECT    * FROM    dept;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿� , comm
from emp
where mgr is null
order by 1;

-- ���� ������
SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where deptno  in(10,30)
order by deptno, �޿� DESC;


SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where deptno = any(10,30)
order by deptno, �޿� DESC;

SELECT deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
where deptno != all(10,30)
order by deptno, �޿� DESC;

-- oracle pageing ó��

SELECT rownum,deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp;

SELECT rownum,deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from emp
order by sal;

SELECT rownum,deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from (SELECT * from emp order by sal desc);

SELECT rownum,deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from (SELECT * from emp order by sal desc)
where rownum < 4;

SELECT rownum,deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
from (SELECT * from emp order by sal desc)
where rownum > 4;

-- 1 => 1~5   2 page => 6 ~10
select * from 
( SELECT rownum row#,deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
  from (SELECT * from emp order by sal desc))
where row# between 11 and 14;

select * from 
( SELECT rownum row#,deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
  from (SELECT * from emp order by sal desc))
where row# between &start and &and;

SELECT employee_id, last_name, job_id,&column_name
FROM employees 
WHERE &condition 
ORDER BY &order_column ;


@ c:\lib\p104.sql

-- �̸��� ����° ���ڰ� 'a'�� ��� ��� �� �̸��� ǥ��.
select ename
from emp
where ename like '__A%';

-- �����Լ�  : single row function 
-- ����ȯ , ������(�ڵ�) ,  �����(���� ���)

select 3+4.5 from dual;
select 1/2 from dual;
select '3.5' + 4 from dual; --������(�ڵ�) 


SELECT   employee_id, hire_date,    job_id ,SUBSTR(job_id, 4,6),SUBSTR(hire_date,1,2) �Ի�⵵,
         to_char(hire_date,'YY')
FROM    employees;

select ROUND(15.193,2) , trunc(45.567,2) from dual;

select sysdate,sysdate+30,to_char(sysdate+30,'day')  from dual;
select sysdate,to_date('20/12/15') ,to_date('20-12-15') ,to_date('20-12-2015','dd-mm-yyyy')
from dual;

SELECT ename,mgr,comm,nvl(comm,0),nvl(to_char(comm),'_')
FROM emp;

SELECT ename,nvl2(mgr,'O','X'),comm,nvl(comm,0)
FROM emp;

-- coalesce(a,b,c) a�� null�̾ƴϸ� a , 
SELECT ename,sal,comm ,coalesce(sal+comm,sal,0) �Ǳ޿�
FROM emp;

-- decode �Լ�
SELECT ename,sal ,decode(deptno, 10,  sal*0.5,20,sal * 0.7,sal ) ���ʽ� ,deptno
FROM emp
order by deptno;

-- case ���� 
SELECT ename,sal ,case
                       when  deptno=10 then  sal*0.5
                       when  deptno=20 then  sal * 0.7
                       else sal 
                  end ���ʽ� ,deptno
FROM emp
order by deptno;

--------- review  -----
select ename,sal,hiredate,to_char(hiredate,'YYYY"��"MM"��"DD"��"') �Ի��� ,deptno
from emp
where deptno <> 10
order by deptno;

-- employees ���� �޿������� ���� �������� , 5~10 �ο� ���

select *
from (
        select rownum row# , empno,    ename,    job,    mgr,    hiredate,    sal,    comm,    deptno
        from  (select * from emp order by sal desc)
    )
where   row#  between 5 and 10;
;

rollback;
INSERT INTO emp 
VALUES(3333,'��','ANALYST',7566,sysdate,null,NULL,null);
          
-- DDL commit;
                              --'2020/12/16'
INSERT INTO emp 
VALUES(4444,'��','ANALYST',7566,to_date('12/16/20','mm/dd/yy'),null,NULL,null);


commit;
ROLLBACK;
select * from emp;

select ename,nvl(sal,0)+nvl(comm,0) �޿� 
from emp;

SELECT ename,sal,comm ,coalesce(sal+comm,sal,0) �Ǳ޿�
FROM emp;

-- �����Լ� , �������Լ�
-- ����� ���� �Լ�

create or replace function tax(a number) return number
is
  v_tax number;
begin
  v_tax := a * 0.01;
  return v_tax;
END;
/

-- DDL auto commit;
select ename, sal,tax(sal) ����  from emp;

drop function tax;    -- DDL auto commit;


select  length('hell0'),length('�ȳ�~') from dual;
select  lengthb('hell0'),lengthb('������') from dual;


select  to_char('null') from dual;

5 -> '5' ->5 

-- ����ȯ
-- null , ������ ���� 

select  nullif('11','11') from dual;
select  nullif('11','111') from dual;   --?

select * from emp;

INSERT INTO emp 
VALUES(5555,'ȫ','ANALYST',7566,to_date('12/16/20','mm/dd/yy'),-10,NULL,10);







