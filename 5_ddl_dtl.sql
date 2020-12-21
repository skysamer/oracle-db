@\c:\lib\datatable.sql;

--10��: ������ ���۾� DML: insert, update, delete ==> rollback ����
--11��: DDL table ���� (auto commit) ==> rollback �Ұ���

-- ������Ʈ ==>> CURD : insert, update, select(���� ����), delete
-- SQL : DML, DDL, DTL, DCL, Query��(select)


-- book ���̺�
-- title, author, pubdate....

select user from dual;

DROP table book;

CREATE TABLE book(
    bookno number(5),
    title VARCHAR2(30),
    author VARCHAR2(30),
    pubdate date
);

select * from book;

ROLLBACK; --���� ������
COMMIT; --Ȯ��

DESC book;

INSERT INTO book ( bookno, title, author, pubdate) 
            VALUES (1, 'JAVA', 'ȫ�浿', SYSDATE );

COMMIT;

col title for a14;
col author for a14;
col bookno for 9999;


INSERT INTO book ( bookno, title, author, pubdate) 
            VALUES (1, 'JAVA', 'ȫ�浿', SYSDATE );

COMMIT;

INSERT INTO book VALUES (2, 'SQL', 'ȫ�浿', SYSDATE );
commit;

INSERT INTO book ( bookno, title) VALUES (3, 'spring');

INSERT INTO book VALUES (3, 'HTML5', '��浿', null);

select * from book where author is null;

rollback;

INSERT INTO book VALUES (2, 'SQL', 'ȫ�浿', SYSDATE );
commit;

INSERT INTO book ( bookno, title) VALUES (3, 'spring');
INSERT INTO book VALUES (3, 'HTML5', '��浿', null);
commit;

INSERT INTO book VALUES (4, 'HTML5', '��浿', '17/1/5');
INSERT INTO book VALUES (4, 'HTML5', '��浿', '17/5/1');
INSERT INTO book VALUES (4, 'HTML5', '��浿', to_date('12/30/2017', 'mm/dd/yyyy'));
--RR/MM/DD
--select sysdate from dual
rollback;
INSERT INTO book VALUES (4, 'HTML5', '��浿', to_date('12/30/2017', 'mm/dd/yyyy'));
INSERT INTO book VALUES (2, 'SQL', 'ȫ�浿', SYSDATE );
commit;

select * from book;

DELETE FROM book;
rollback;
DELETE FROM book WHERE pubdate is null;
commit;
DELETE FROM book WHERE bookno =4;
DELETE FROM book WHERE bookno =9;
rollback;

update book set pubdate='20/1/1', title='...';
rollback;
commit;








