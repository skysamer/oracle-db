@\c:\lib\datatable.sql;

--10장: 데이터 조작어 DML: insert, update, delete ==> rollback 가능
--11장: DDL table 생성 (auto commit) ==> rollback 불가능

-- 프로젝트 ==>> CURD : insert, update, select(가장 많음), delete
-- SQL : DML, DDL, DTL, DCL, Query문(select)


-- book 테이블
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

ROLLBACK; --이전 명령취소
COMMIT; --확정

DESC book;

INSERT INTO book ( bookno, title, author, pubdate) 
            VALUES (1, 'JAVA', '홍길동', SYSDATE );

COMMIT;

col title for a14;
col author for a14;
col bookno for 9999;


INSERT INTO book ( bookno, title, author, pubdate) 
            VALUES (1, 'JAVA', '홍길동', SYSDATE );

COMMIT;

INSERT INTO book VALUES (2, 'SQL', '홍길동', SYSDATE );
commit;

INSERT INTO book ( bookno, title) VALUES (3, 'spring');

INSERT INTO book VALUES (3, 'HTML5', '고길동', null);

select * from book where author is null;

rollback;

INSERT INTO book VALUES (2, 'SQL', '홍길동', SYSDATE );
commit;

INSERT INTO book ( bookno, title) VALUES (3, 'spring');
INSERT INTO book VALUES (3, 'HTML5', '고길동', null);
commit;

INSERT INTO book VALUES (4, 'HTML5', '김길동', '17/1/5');
INSERT INTO book VALUES (4, 'HTML5', '김길동', '17/5/1');
INSERT INTO book VALUES (4, 'HTML5', '김길동', to_date('12/30/2017', 'mm/dd/yyyy'));
--RR/MM/DD
--select sysdate from dual
rollback;
INSERT INTO book VALUES (4, 'HTML5', '김길동', to_date('12/30/2017', 'mm/dd/yyyy'));
INSERT INTO book VALUES (2, 'SQL', '홍길동', SYSDATE );
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








