INSERT INTO book ( bookno, title) VALUES (3, 'spring');

INSERT INTO book VALUES (3, 'HTML5', '고길동', null);
select * from book;
rollback;

desc book;


--트랜잭션
--자식을 먼저 지우고 부모를 지운다
drop table dept2 cascade constraint purge;
create table dept2 as select * from dept;

--창1
delete from dept2 where deptno=10;
rollback;

--창2
update dept2 set loc='....' where deptno=10;
commit;
