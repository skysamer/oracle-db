-- @ c:\lib\datatable.sql

select * from dept;
select * from emp;

-- 오라클 방식의 이퀴조인 
select ename,dname,dept.deptno
from emp,dept
where emp.deptno = dept.deptno;  -- 조인조건 : fk = pk

select *
from emp,dept
where emp.deptno = dept.deptno;

select first_name,job_title,employees.job_id
from employees,jobs
where employees.job_id = jobs.job_id;


select ename,dname,d.deptno,sal
from emp e,dept d
where e.deptno = d.deptno;  -- 조인조건 : fk = pk

-- sal이 2500 이상인 사원의 이름과 부서이름,sal, 부서번호  출력하세요. 
select ename,dname,d.deptno,sal
from emp e,dept d
where e.deptno = d.deptno and sal>=2500;  

select ename,dname,d.deptno,sal
from emp e,dept d
where e.deptno = d.deptno and  sal>=2500 ;  

-- 안시조인 (표준) , from 절에 , => join , where 조인조건 on
-- inner join 방식 ==> 양쪽테이블에 모두 있는 내용이 출력
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

-- 3개의 테이블 조인 
-- ename , dname,loc,sal , grade 출력

SELECT ename , dname,loc,sal , grade
from emp,dept,salgrade
where emp.deptno=dept.deptno and sal BETWEEN losal and hisal;


SELECT ename , dname,loc,sal , grade
from emp
     join dept
     on emp.deptno=dept.deptno
     join salgrade
     on  sal BETWEEN losal and hisal
where sal >=2000    -- where 대신 and 가능 
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
-- 사원의 이름과 상사의 이름 출력

SELECT    e.ename    "사원의 이름" ,   m.ename  "상사의 이름"
from emp e, emp m
where e.mgr = m.empno and e.ename ='KING'
order by e.sal

SELECT    e.ename    "사원의 이름" ,   m.ename  "상사의 이름"
from emp e, emp m
where e.mgr = m.empno 
order by e.sal;

SELECT    e.ename    "사원의 이름" ,   m.ename  "상사의 이름"
from emp e, emp m
where e.mgr = m.empno(+) 
order by e.sal;

SELECT    e.ename    "사원의 이름" ,   m.ename  "상사의 이름"
from emp e join emp m  -- ANSI inner join
on e.mgr = m.empno 
order by e.sal;

SELECT    e.ename    "사원의 이름" ,   m.ename  "상사의 이름"
from emp e  left join emp m  -- ANSI outer join  (left ,right ,full)
on e.mgr = m.empno 
order by e.sal;

-- 사원의 급여가   상사의 급여보다 많은 사원 목록 리스트
SELECT    e.ename   "사원의 이름" ,    m.ename  "상사의 이름"
from emp e  left join emp m  -- ANSI outer join  (left ,right ,full)
on e.mgr = m.empno 
where e.sal > m.sal
order by e.sal;


SELECT    e.ename    "사원의 이름" ,   nvl(m.ename,'<TOP>')  "상사의 이름"
from emp e  left join emp m  -- ANSI outer join  (left ,right ,full)
on e.mgr = m.empno ;

-- 주의  *****   join 구문  where , and 구분 
select empno,ename,dname,loc,sal 
from  emp    right outer join  dept
on emp.deptno = dept.deptno
where sal > 2000; -- outer join 제외

select empno,ename,dname,loc,sal 
from  emp    right outer join  dept
on emp.deptno = dept.deptno
and sal > 2000; -- outer join 포함 
     
-- natural join
select empno,ename,dname,loc,sal 
from emp natural join dept;

-- using join
select empno,ename,dname,loc,sal 
from emp join dept
using(deptno);


-- join  : 컬럼을 붙임
-- union : row 붙이기 


