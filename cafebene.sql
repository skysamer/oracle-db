INSERT INTO book ( bookno, title) VALUES (3, 'spring');

INSERT INTO book VALUES (3, 'HTML5', '��浿', null);
select * from book;
rollback;

desc book;


--Ʈ�����
--�ڽ��� ���� ����� �θ� �����
drop table dept2 cascade constraint purge;
create table dept2 as select * from dept;

--â1
delete from dept2 where deptno=10;
rollback;

--â2
update dept2 set loc='....' where deptno=10;
commit;
