@\c:\lib\datatable.sql;
SELECT
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
FROM
    emp;
    
--��纸�� ���� �Ի��� ����� ���
select  e.ename ����̸�, e.hiredate �Ի���, nvl(m.ename,' <<CEO>>') ����̸�, m.hiredate �Ի���
from emp e left outer join emp m
on e.mgr=m.empno
where e.hiredate < m.hiredate;  --where, and


-- 6��  �����Լ�, �׷��Լ�
select ename, lower(ename), hiredate, to_char(hiredate, 'mm')
from emp;

select round(avg(sal), 2) as ��ձ޿�
from emp;

select lower(ename), avg(sal) --x
from emp;

select sum(sal), count(sal),sum(sal)/count(sal), avg(sal), max(sal), min(sal)
from emp;

select count(distinct job)
from emp;

select distinct job
from emp;

select round(avg(sal))  from emp;
select round(avg(sal))  from emp where deptno=10;
select round(avg(sal))  from emp where deptno=20;
select round(avg(sal))  from emp where deptno=30;
select round(avg(sal))  from emp where deptno=40;

select * from emp ORDER by deptno;


-- �μ��� 
select deptno, round(avg(sal)) ��ձ޿�, max(sal) �ְ�޿�, min(sal) �ּұ޿�
from emp
group by deptno
order by deptno;

--sal, deptno, dname

select emp.deptno, dname, round(avg(sal)) ��ձ޿�, max(sal) �ְ�޿�, min(sal) �ּұ޿�
from emp join dept
on emp.deptno = dept.deptno
group by emp.deptno, dname
order by emp.deptno;


-- loc �����̸��� ��ձ޿��� ���Ͻÿ�.
select loc, round(avg(sal)) ��ձ޿�
from emp join dept
on emp.deptno = dept.deptno
group by loc
order by 2;

-- ���� �Ի��ڼ�
select to_char(hiredate, 'mm') ��, count(*) �Ի��ڼ�
from emp
group by to_char(hiredate, 'mm')
order by to_char(hiredate, 'mm');

select to_char(hiredate, 'day') ����, count(*) �Ի��ڼ�
from emp
group by to_char(hiredate, 'day')
order by 1;

-- �μ��̸��� ��ձ޿��� 2000 �̻��� ����Ʈ�� ���Ͻÿ�.
select dname �μ��̸�, round(avg(sal)) ��ձ޿�
from emp join dept
on emp.deptno = dept.deptno
group by dname
having round(avg(sal)) > 2000
order by 2;

select dname �μ��̸�, round(avg(sal)) ��ձ޿�
from emp join dept
on emp.deptno = dept.deptno
where sal > 2000
group by dname
having round(avg(sal)) > 2000
order by 2;

-- ����
select --5
from  --1
on
where --2
group by --3
having --4
order by--6

-- rollup cube

select deptno, job, sum(sal)
from emp
group by cube(deptno, job)
order by 1, 2;

select last_name, to_char(hire_date, 'year')
from employees
group by last_name
having to_char(hire_date, 'year') > 05;

-- 8�� SubQuery
select *
from emp;

--ford ������� �޿��� ���� �޴� ��� ����Ʈ
select sal
from emp 
where ename='FORD' --mainquery

select *
from emp
where sal > (select sal from emp where ename='FORD'); --subquery

-- ��� �޿����� ���� �޴� ��� ����Ʈ
select round(avg(sal))
from emp;

select *
from emp
where sal < (select round(avg(sal)) from emp);

-- �޿��� ���� ���� ���
select min(sal) from emp;

select *
from emp
where sal = (select min(sal) from emp);

-- ��Į��=���ϰ�   ,   ����=���߰�
select min(sal) from emp;
select min(sal) from emp group by deptno;

-- �μ��� �����޿� ����Ʈ
select deptno, ename, sal
from emp
where (deptno, sal) in (select deptno, min(sal) from emp group by deptno); 

select deptno, ename, sal
from emp
where  sal in (800, 950, 1300); -- ���տ�����

-- �μ��� �ְ�޿� ����Ʈ
select deptno, ename, sal
from emp
where (deptno, sal) in (select deptno, max(sal) from emp group by deptno);

select deptno, ename, sal
from emp
where (deptno, sal) in ((30, 2850), (20, 3000), (10, 5000));

select deptno, ename, sal
from emp
where (deptno=30 and sal=2850) or (deptno=20 and sal=3000) or (deptno=10 and sal=5000)

select deptno, ename, sal
from emp
where deptno in (10, 30)
order by 1;

select deptno, ename, sal
from emp
where deptno < all (20, 30);

-- ������� ������
-- �ڽ��� ���� �μ��� ��� �޿����� ���� ��� ����Ʈ

select *
from emp e
where sal < (select round(avg(sal)) from emp where deptno=e.deptno);

select round(avg(sal)) from emp where deptno=20;

--1 =>1~5  2page => 6~10
select * from 
( SELECT rownum row#,deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
  from (SELECT * from emp order by sal desc))
where row# between 11 and 14;

select * from 
( SELECT rownum row#,deptno , job,  ename,     hiredate �Ի��� ,    sal as �޿�
  from (SELECT * from emp order by sal desc))
where row# between &start and &and;


-- mysql ==> select * from order b sal desc limit 1, 5

-- 9�� ���տ�����

select job from emp where deptno=10;
select job from emp where deptno=20;


select job, 'aa' from emp where deptno=10
union --���ϵ�, �ߺ�����
select job, null from emp where deptno=20 order by 1;



select job from emp where deptno=10
union all --���ϵ�, �ߺ�����
select job from emp where deptno=20;


select job from emp where deptno=10
intersect --�ߺ��� ���
select job from emp where deptno=20;


select job from emp where deptno=10
minus
select job from emp where deptno=20;


--lab ����

select * from employees;
select * from departments;
select * from jobs;

--���� 1
select e.employee_id ���, e.first_name �̸�, d.department_name �μ���, m.first_name �Ŵ����̸�
from employees e join departments d
on e.department_id = d.department_id
join employees m
on e.manager_id=m.employee_id;

--���� 2
select e.last_name, e.salary
from employees e join employees m
on e.manager_id=m.employee_id
where e.salary > m.salary;

--���� 3
select first_name �̸�, last_name ��, salary ����
from employees e join jobs j
on e.job_id=j.job_id
where job_title='Sales Representative'
and e.salary between 9000 and 10000;

-- ���� 4
select e.employee_id ���, e.last_name ��, e.hire_date ä����
from employees e join employees m
on e.manager_id=m.employee_id
where e.hire_date < m.hire_date


-- ���� 5
select distinct job_title, department_name  --distinct: �ߺ� ����
from employees e join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id

-- ���� 6
select to_char(hire_date, 'mm') ��, count(to_char(hire_date, 'mm')) �Ի��ڼ�  --to_char: ������ ��� ���� ����
from employees
group by to_char(hire_date, 'mm')
order by 1

--���� 7
select e.first_name, e.hire_date, e.employee_id, m.first_name
from employees e join employees m
on e.manager_id = m.employee_id
where to_char(e.hire_date, 'yy') = '08'

-- ���� 8
select first_name �̸�, salary �޿�, department_name �μ��̸�
from employees e join departments d
on e.department_id = d.department_id
where department_name = 'Sales'

-- ���� 9
select employee_id ���, first_name �̸�, last_name ��, department_name �μ���
from employees e left outer join departments d
on e.department_id=d.department_id
where to_char(hire_date, 'yy')=04

-- ���� 10
select e.first_name �̸�, e.hire_date �Ի���, m.employee_id �����ڻ��, m.first_name �������̸�
from employees e left outer join employees m
on e.manager_id=m.employee_id
where to_char(e.hire_date, 'yy')=05
or e.manager_id is null












--��������

--1. job�� manager�̰� �޿��� 1500���̻� research �μ��� �ٹ��ϴ� ��� ��ȣ, �̸�, �μ���ȣ, �μ��� �̸� ��ȸ

select * from emp;
select * from dept;

select empno "��� ��ȣ",ename �̸�, dept.deptno �μ���ȣ, dname "�μ��� �̸�"
from employees e join departments d
on e.employees=d.departments
where job='MANAGER' and sal>=1500 and dname='RESEARCH';

--2. ����� �� �� ���� �μ� ����
select * 
from dept
where deptno not in (select distinct deptno from emp);

select distinct deptno from emp


--3. �μ��̸��� ��ձ޿��� 2000�̻�
select dept.deptno, dname �μ��̸�, round(avg(sal)) "��ձ޿�"
from emp join dept
on emp.deptno=dept.deptno
group by dept.deptno, dname
having round(avg(sal)) > 2000
order by "��ձ޿�"


-- ���� 3
select job_title
from jobs
where job_title = sales representative;

