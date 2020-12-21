SELECT
    empno,    ename,    job,    mgr,    hiredate 입사일 ,    sal+nvl(comm,0) as 급여,    deptno
FROM  emp;

SELECT
    empno,    ename,    job,    mgr,    hiredate 입사일 ,    sal+nvl(comm,0) as 급여,    deptno
FROM  emp
where sal+nvl(comm,0) >= 3000;

SELECT
    empno,    ename,    job,    mgr,    hiredate 입사일 ,    sal+nvl(comm,0) as 급여,    deptno
FROM  emp
order by 급여 desc;

SELECT
from
where
order by 
;

SELECT deptno , empno,  ename,    job,  hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where sal+nvl(comm,0) > 900
order by 1 asc, 급여 Desc;

SELECT deptno , empno,  ename,    job,  hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where sal > 900
order by deptno asc, 급여 Desc;


SELECT
    employee_id,    first_name || last_name 이름,    email,  hire_date,
    salary+ nvl(commission_pct,0) 급여,    department_id
FROM
    employees
where department_id = 90
order by 급여;

SELECT deptno , empno,  ename,    job,  hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where deptno = &deptno;   --치환함수 

SELECT deptno , job,  ename,    job,  hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where job ='manager';

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where job = '&job';   

SELECT deptno , lower(job), ename,     hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp;

select 'aaa',UPPER('aaa') , lower('AAA') from dual;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where UPPER(job) = UPPER('&job');   


-- show parameter nls;
SELECT deptno , job,  ename,     hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where hiredate = '81/02/22';

select sysdate from dual;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where hiredate != '81/09/28';

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where hiredate <> '81/09/28';

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where hiredate = '81/02/20';


select sysdate from dual;


sELECT deptno , job,  ename,     hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where hiredate = to_date('20-2-1981','dd-mm-yyyy');

sELECT deptno , job,  ename,     hiredate 입사일 ,    sal+nvl(comm,0) as 급여
from emp
where hiredate < to_date('20-2-1981','dd-mm-yyyy');

sELECT    ename,  hiredate,  to_char(hiredate,'YYYY') 입사년도 , to_char(hiredate,'MM') 입사월 ,
          to_char(hiredate,'DD') 입사일, to_char(hiredate,'DAY')
from emp;


-- '82/2/1'
select to_date('82/2/1','RR/MM/DD'),to_char(to_date('82/2/1','RR/MM/DD'),'YYYY') from dual; --1982
select to_date('82/2/1','YY/MM/DD'),to_char(to_date('82/2/1','YY/MM/DD'),'YYYY') from dual; --2082



SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where sal >= 3000 and sal <=5000
order by 급여 DESC;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where sal between 3000 and 5000
order by 급여 DESC;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where sal not between 3000 and 5000
order by 급여 DESC;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where deptno = 10 or deptno = 20
order by deptno, 급여 DESC;

-- 집합 연산자
SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where deptno  in(10,30)
order by deptno, 급여 DESC;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where deptno  not in(10,30)
order by deptno, 급여 DESC;

SELECT *
from dept
where (deptno ,loc) in ((10,'NEW YORK'),(30,'NEW YORK'));

--like 연산자  %  _  

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where ename ='ALLEN'
order by deptno, 급여 DESC;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where ename  like 'a%'
order by deptno, 급여 DESC;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where upper(ename)  like upper('a%') -- ?
order by deptno, 급여 DESC;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where upper(ename)  like upper('%a_s%') -- ?
order by deptno, 급여 DESC;

--emp 테이블에서  81 년도에 입사자 목록 
SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where hiredate like '81%';

--emp 테이블에서  9월 입사자 목록 
SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where to_char(hiredate,'MM') like '%9%';

-- 이름이 A,B,C,D 로 시작하는 사원 목록 
SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where ename like 'A%' or ename like 'B%' or ename like 'C%' or ename like 'D%';

-- 정규식 사용
SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where REGEXP_LIKE (ename, 'A|B|C|D');

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where REGEXP_LIKE (ename, '^[A-D]');

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where REGEXP_LIKE (ename, '[A-D]$');

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여 , comm
from emp
where comm is null
order by 1;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여 , comm
from emp
where comm is not null
order by 1;

SELECT    * FROM    dept;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여 , comm
from emp
where mgr is null
order by 1;

-- 집합 연산자
SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where deptno  in(10,30)
order by deptno, 급여 DESC;


SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where deptno = any(10,30)
order by deptno, 급여 DESC;

SELECT deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
where deptno != all(10,30)
order by deptno, 급여 DESC;

-- oracle pageing 처리

SELECT rownum,deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp;

SELECT rownum,deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from emp
order by sal;

SELECT rownum,deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from (SELECT * from emp order by sal desc);

SELECT rownum,deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from (SELECT * from emp order by sal desc)
where rownum < 4;

SELECT rownum,deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
from (SELECT * from emp order by sal desc)
where rownum > 4;

-- 1 => 1~5   2 page => 6 ~10
select * from 
( SELECT rownum row#,deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
  from (SELECT * from emp order by sal desc))
where row# between 11 and 14;

select * from 
( SELECT rownum row#,deptno , job,  ename,     hiredate 입사일 ,    sal as 급여
  from (SELECT * from emp order by sal desc))
where row# between &start and &and;

SELECT employee_id, last_name, job_id,&column_name
FROM employees 
WHERE &condition 
ORDER BY &order_column ;


@ c:\lib\p104.sql

-- 이름의 세번째 문자가 'a'인 모든 사원 의 이름을 표시.
select ename
from emp
where ename like '__A%';

-- 내장함수  : single row function 
-- 형변환 , 묵시적(자동) ,  명시적(수동 명시)

select 3+4.5 from dual;
select 1/2 from dual;
select '3.5' + 4 from dual; --묵시적(자동) 


SELECT   employee_id, hire_date,    job_id ,SUBSTR(job_id, 4,6),SUBSTR(hire_date,1,2) 입사년도,
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

-- coalesce(a,b,c) a가 null이아니면 a , 
SELECT ename,sal,comm ,coalesce(sal+comm,sal,0) 실급여
FROM emp;

-- decode 함수
SELECT ename,sal ,decode(deptno, 10,  sal*0.5,20,sal * 0.7,sal ) 보너스 ,deptno
FROM emp
order by deptno;

-- case 구문 
SELECT ename,sal ,case
                       when  deptno=10 then  sal*0.5
                       when  deptno=20 then  sal * 0.7
                       else sal 
                  end 보너스 ,deptno
FROM emp
order by deptno;

--------- review  -----
select ename,sal,hiredate,to_char(hiredate,'YYYY"년"MM"월"DD"일"') 입사일 ,deptno
from emp
where deptno <> 10
order by deptno;

-- employees 에서 급여순으로 정렬 내림차순 , 5~10 로우 출력

select *
from (
        select rownum row# , empno,    ename,    job,    mgr,    hiredate,    sal,    comm,    deptno
        from  (select * from emp order by sal desc)
    )
where   row#  between 5 and 10;
;

rollback;
INSERT INTO emp 
VALUES(3333,'김','ANALYST',7566,sysdate,null,NULL,null);
          
-- DDL commit;
                              --'2020/12/16'
INSERT INTO emp 
VALUES(4444,'김','ANALYST',7566,to_date('12/16/20','mm/dd/yy'),null,NULL,null);


commit;
ROLLBACK;
select * from emp;

select ename,nvl(sal,0)+nvl(comm,0) 급여 
from emp;

SELECT ename,sal,comm ,coalesce(sal+comm,sal,0) 실급여
FROM emp;

-- 내장함수 , 단일행함수
-- 사용자 정의 함수

create or replace function tax(a number) return number
is
  v_tax number;
begin
  v_tax := a * 0.01;
  return v_tax;
END;
/

-- DDL auto commit;
select ename, sal,tax(sal) 세금  from emp;

drop function tax;    -- DDL auto commit;


select  length('hell0'),length('안녕~') from dual;
select  lengthb('hell0'),lengthb('선우용녀') from dual;


select  to_char('null') from dual;

5 -> '5' ->5 

-- 형변환
-- null , 빅데이터 수집 

select  nullif('11','11') from dual;
select  nullif('11','111') from dual;   --?

select * from emp;

INSERT INTO emp 
VALUES(5555,'홍','ANALYST',7566,to_date('12/16/20','mm/dd/yy'),-10,NULL,10);







