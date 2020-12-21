-- @ c:\lib\datatable.sql

select * from dept;
select * from emp;

-- ����Ŭ ����� �������� 
select ename,dname,dept.deptno
from emp,dept
where emp.deptno = dept.deptno;  -- �������� : fk = pk

select *
from emp,dept
where emp.deptno = dept.deptno;

select first_name,job_title,employees.job_id
from employees,jobs
where employees.job_id = jobs.job_id;


select ename,dname,d.deptno,sal
from emp e,dept d
where e.deptno = d.deptno;  -- �������� : fk = pk

-- sal�� 2500 �̻��� ����� �̸��� �μ��̸�,sal, �μ���ȣ  ����ϼ���. 
select ename,dname,d.deptno,sal
from emp e,dept d
where e.deptno = d.deptno and sal>=2500;  

select ename,dname,d.deptno,sal
from emp e,dept d
where e.deptno = d.deptno and  sal>=2500 ;  

-- �Ƚ����� (ǥ��) , from ���� , => join , where �������� on
-- inner join ��� ==> �������̺� ��� �ִ� ������ ���
select ename,dname,d.deptno,sal
from emp e join dept d
on e.deptno = d.deptno;

select ename,dname,d.deptno,sal
from emp e join dept d
on e.deptno = d.deptno 
where sal>=2500 ;  

select ename,dname,d.deptno,sal
from emp e join dept d
on e.deptno = d.deptno 
and  sal>=2500 ;  

-- outer join

select ename,dname,d.deptno,sal
from emp e,dept d
where e.deptno(+) = d.deptno; 


select ename,dname,d.deptno,sal
from emp e right outer join dept d
on e.deptno = d.deptno;

select ename,dname,d.deptno,sal
from emp e left outer join dept d
on e.deptno = d.deptno;

select ename,dname,d.deptno,sal
from emp e full outer join dept d
on e.deptno = d.deptno;

-- non-equi join  , equi join ==> fk=pk  , 

SELECT   grade, losal, hisal   FROM    salgrade;

SELECT ename,sal ,grade
from emp , salgrade
where sal BETWEEN  losal and hisal
order by ename;

SELECT ename,sal ,grade
from emp join salgrade
on sal BETWEEN  losal and hisal
order by ename;

SELECT *
from emp join salgrade
on sal BETWEEN  losal and hisal
order by ename;

SELECT emp.*,salgrade.grade
from emp join salgrade
on sal BETWEEN  losal and hisal
order by ename;

-- 3���� ���̺� ���� 
-- ename , dname,loc,sal , grade ���

SELECT ename , dname,loc,sal , grade
from emp,dept,salgrade
where emp.deptno=dept.deptno and sal BETWEEN losal and hisal;


SELECT ename , dname,loc,sal , grade
from emp
     join dept
     on emp.deptno=dept.deptno
     join salgrade
     on  sal BETWEEN losal and hisal
where sal >=2000    -- where ��� and ���� 
order by dept.deptno;

SELECT ename , dname,loc,sal , grade
from emp
     join dept
     on emp.deptno=dept.deptno
     join salgrade
     on  sal BETWEEN losal and hisal
and sal >=2000 
order by dept.deptno;

-- Self join
-- ����� �̸��� ����� �̸� ���

SELECT    e.ename    "����� �̸�" ,   m.ename  "����� �̸�"
from emp e, emp m
where e.mgr = m.empno and e.ename ='KING'
order by e.sal

SELECT    e.ename    "����� �̸�" ,   m.ename  "����� �̸�"
from emp e, emp m
where e.mgr = m.empno 
order by e.sal;

SELECT    e.ename    "����� �̸�" ,   m.ename  "����� �̸�"
from emp e, emp m
where e.mgr = m.empno(+) 
order by e.sal;

SELECT    e.ename    "����� �̸�" ,   m.ename  "����� �̸�"
from emp e join emp m  -- ANSI inner join
on e.mgr = m.empno 
order by e.sal;

SELECT    e.ename    "����� �̸�" ,   m.ename  "����� �̸�"
from emp e  left join emp m  -- ANSI outer join  (left ,right ,full)
on e.mgr = m.empno 
order by e.sal;

-- ����� �޿���   ����� �޿����� ���� ��� ��� ����Ʈ
SELECT    e.ename   "����� �̸�" ,    m.ename  "����� �̸�"
from emp e  left join emp m  -- ANSI outer join  (left ,right ,full)
on e.mgr = m.empno 
where e.sal > m.sal
order by e.sal;


SELECT    e.ename    "����� �̸�" ,   nvl(m.ename,'<TOP>')  "����� �̸�"
from emp e  left join emp m  -- ANSI outer join  (left ,right ,full)
on e.mgr = m.empno ;

-- ����  *****   join ����  where , and ���� 
select empno,ename,dname,loc,sal 
from  emp    right outer join  dept
on emp.deptno = dept.deptno
where sal > 2000; -- outer join ����

select empno,ename,dname,loc,sal 
from  emp    right outer join  dept
on emp.deptno = dept.deptno
and sal > 2000; -- outer join ���� 
     
-- natural join
select empno,ename,dname,loc,sal 
from emp natural join dept;

-- using join
select empno,ename,dname,loc,sal 
from emp join dept
using(deptno);


-- join  : �÷��� ����
-- union : row ���̱� 


