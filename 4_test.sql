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
    
--상사보다 먼저 입사한 사원의 목록
select  e.ename 사원이름, e.hiredate 입사일, nvl(m.ename,' <<CEO>>') 상사이름, m.hiredate 입사일
from emp e left outer join emp m
on e.mgr=m.empno
where e.hiredate < m.hiredate;  --where, and


-- 6장  집계함수, 그룹함수
select ename, lower(ename), hiredate, to_char(hiredate, 'mm')
from emp;

select round(avg(sal), 2) as 평균급여
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


-- 부서별 
select deptno, round(avg(sal)) 평균급여, max(sal) 최고급여, min(sal) 최소급여
from emp
group by deptno
order by deptno;

--sal, deptno, dname

select emp.deptno, dname, round(avg(sal)) 평균급여, max(sal) 최고급여, min(sal) 최소급여
from emp join dept
on emp.deptno = dept.deptno
group by emp.deptno, dname
order by emp.deptno;


-- loc 도시이름별 평균급여를 구하시오.
select loc, round(avg(sal)) 평균급여
from emp join dept
on emp.deptno = dept.deptno
group by loc
order by 2;

-- 월별 입사자수
select to_char(hiredate, 'mm') 월, count(*) 입사자수
from emp
group by to_char(hiredate, 'mm')
order by to_char(hiredate, 'mm');

select to_char(hiredate, 'day') 요일, count(*) 입사자수
from emp
group by to_char(hiredate, 'day')
order by 1;

-- 부서이름별 평균급여가 2000 이상인 리스트를 구하시오.
select dname 부서이름, round(avg(sal)) 평균급여
from emp join dept
on emp.deptno = dept.deptno
group by dname
having round(avg(sal)) > 2000
order by 2;

select dname 부서이름, round(avg(sal)) 평균급여
from emp join dept
on emp.deptno = dept.deptno
where sal > 2000
group by dname
having round(avg(sal)) > 2000
order by 2;

-- 순서
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

-- 8장 SubQuery
select *
from emp;

--ford 사원보다 급여를 많이 받는 사원 리스트
select sal
from emp 
where ename='FORD' --mainquery

select *
from emp
where sal > (select sal from emp where ename='FORD'); --subquery

-- 평균 급여보다 적게 받는 사원 리스트
select round(avg(sal))
from emp;

select *
from emp
where sal < (select round(avg(sal)) from emp);

-- 급여가 제일 적은 사원
select min(sal) from emp;

select *
from emp
where sal = (select min(sal) from emp);

-- 스칼라=단일값   ,   벡터=다중값
select min(sal) from emp;
select min(sal) from emp group by deptno;

-- 부서별 최저급여 리스트
select deptno, ename, sal
from emp
where (deptno, sal) in (select deptno, min(sal) from emp group by deptno); 

select deptno, ename, sal
from emp
where  sal in (800, 950, 1300); -- 집합연산자

-- 부서별 최고급여 리스트
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

-- 상관관계 쿼리문
-- 자신이 속한 부서의 평균 급여보다 적은 사원 리스트

select *
from emp e
where sal < (select round(avg(sal)) from emp where deptno=e.deptno);

select round(avg(sal)) from emp where deptno=20;

--1 =>1~5  2page => 6~10
select * from 
( SELECT rownum row#,deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
  from (SELECT * from emp order by sal desc))
where row# between 11 and 14;

select * from 
( SELECT rownum row#,deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
  from (SELECT * from emp order by sal desc))
where row# between &start and &and;


-- mysql ==> select * from order b sal desc limit 1, 5

-- 9장 집합연산자

select job from emp where deptno=10;
select job from emp where deptno=20;


select job, 'aa' from emp where deptno=10
union --더하되, 중복제거
select job, null from emp where deptno=20 order by 1;



select job from emp where deptno=10
union all --더하되, 중복유지
select job from emp where deptno=20;


select job from emp where deptno=10
intersect --중복만 출력
select job from emp where deptno=20;


select job from emp where deptno=10
minus
select job from emp where deptno=20;


--lab 문제

select * from employees;
select * from departments;
select * from jobs;

--문제 1
select e.employee_id 사번, e.first_name 이름, d.department_name 부서명, m.first_name 매니저이름
from employees e join departments d
on e.department_id = d.department_id
join employees m
on e.manager_id=m.employee_id;

--문제 2
select e.last_name, e.salary
from employees e join employees m
on e.manager_id=m.employee_id
where e.salary > m.salary;

--문제 3
select first_name 이름, last_name 성, salary 연봉
from employees e join jobs j
on e.job_id=j.job_id
where job_title='Sales Representative'
and e.salary between 9000 and 10000;

-- 문제 4
select e.employee_id 사번, e.last_name 성, e.hire_date 채용일
from employees e join employees m
on e.manager_id=m.employee_id
where e.hire_date < m.hire_date


-- 문제 5
select distinct job_title, department_name  --distinct: 중복 제거
from employees e join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id

-- 문제 6
select to_char(hire_date, 'mm') 월, count(to_char(hire_date, 'mm')) 입사자수  --to_char: 데이터 출력 형식 지정
from employees
group by to_char(hire_date, 'mm')
order by 1

--문제 7
select e.first_name, e.hire_date, e.employee_id, m.first_name
from employees e join employees m
on e.manager_id = m.employee_id
where to_char(e.hire_date, 'yy') = '08'

-- 문제 8
select first_name 이름, salary 급여, department_name 부서이름
from employees e join departments d
on e.department_id = d.department_id
where department_name = 'Sales'

-- 문제 9
select employee_id 사번, first_name 이름, last_name 성, department_name 부서명
from employees e left outer join departments d
on e.department_id=d.department_id
where to_char(hire_date, 'yy')=04

-- 문제 10
select e.first_name 이름, e.hire_date 입사일, m.employee_id 관리자사번, m.first_name 관리자이름
from employees e left outer join employees m
on e.manager_id=m.employee_id
where to_char(e.hire_date, 'yy')=05
or e.manager_id is null












--복습문제

--1. job이 manager이고 급여는 1500원이상 research 부서에 근무하는 사원 번호, 이름, 부서번호, 부서의 이름 조회

select * from emp;
select * from dept;

select empno "사원 번호",ename 이름, dept.deptno 부서번호, dname "부서의 이름"
from employees e join departments d
on e.employees=d.departments
where job='MANAGER' and sal>=1500 and dname='RESEARCH';

--2. 사원이 한 명도 없는 부서 정보
select * 
from dept
where deptno not in (select distinct deptno from emp);

select distinct deptno from emp


--3. 부서이름별 평균급여가 2000이상
select dept.deptno, dname 부서이름, round(avg(sal)) "평균급여"
from emp join dept
on emp.deptno=dept.deptno
group by dept.deptno, dname
having round(avg(sal)) > 2000
order by "평균급여"


-- 문제 3
select job_title
from jobs
where job_title = sales representative;

