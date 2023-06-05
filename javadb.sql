--<JAVADB>--

--1. USERTBL 테이블 생성
--NO: 숫자 4자리, USERNAME: 한글 4자리, BIRTHYEAR: 년도 숫자 4자리, ADDR: 주소 한글/숫자, MOBILE: 010-1234-1234
--NO PK 제약조건 지정(제약조건명: PK_USERTBL)
CREATE TABLE USERTBL(
NO NUMBER(4) CONSTRAINT PK_USERTBL PRIMARY KEY,
USERNAME NVARCHAR2(4) NOT NULL,
BIRTHYEAR NUMBER(4) NOT NULL,
ADDR VARCHAR2(50) NOT NULL,
MOBILE VARCHAR2(50));

desc usertbl;

--select(+서브쿼리, 조인) + DML(insert, delete, update)
--전체조회
select * from usertbl;
--개별조회(특정번호, 특정이름...)
--여러 행이 나오는 상태냐? 하나의 행이 결과로 나올 것이냐?
select * from usertbl where no=1;
select * from usertbl where username='홍길동';

--like: _ or % 와 함께 쓴다.
select * from usertbl where username like '_길동%';

--insert into 테이블명(필드명1, 필드명2...)
--values();

--update 테이블명
--set 업데이트할 필드명=값, 업데이트할 필드명=값....
--where 조건;

--delete 테이블명 where 조건

--delete from 테이블명 where 조건

--시퀀스 생성
--USER_SEQ 생성(기본)
CREATE SEQUENCE USER_SEQ;

--행 추가
INSERT INTO USERTBL(NO, USERNAME, BIRTHYEAR, ADDR, MOBILE) 
VALUES(USER_SEQ.NEXTVAL, '홍길동', 1990, '서울시 서초구 서초중앙로200', '010-1234-1234');

COMMIT;


--모든 컬럼은 NOT NULL
--2. PAYTYPE 테이블 생성
--PAYTYPE: PAY_NO(숫자 1자리-PK), INFO(영어 4자리)
--PAYTYPE_SEQ 생성
CREATE TABLE PAYTYPE(
PAY_NO NUMBER(1) PRIMARY KEY,
INFO VARCHAR2(4) NOT NULL);

CREATE SEQUENCE PAYTYPE_SEQ;

INSERT INTO PAYTYPE VALUES(PAYTYPE_SEQ.NEXTVAL, 'CARD');
INSERT INTO PAYTYPE VALUES(PAYTYPE_SEQ.NEXTVAL, 'CASH');

SELECT * FROM PAYTYPE; --1: CARD, 2: CASH 


--3. SHOP USER 테이블 생성
--SUSER: USER_ID(숫자 4자리-PK), NAME(한글), PAY_NO(숫자 1자리: PAYTYPE에 있는 PAY_NO 참조해서 사용)
CREATE TABLE SUSER(
USER_ID NUMBER(4) PRIMARY KEY,
NAME VARCHAR2(50) NOT NULL,
PAY_NO NUMBER(1) NOT NULL CONSTRAINT SUSER_PAY_NO_FK REFERENCES PAYTYPE(PAY_NO));


--4. PRODUCT 테이블 생성
--PRODUCT: PRODUCT_ID(숫자 8자리-PK), PNAME(문자), PRICE(숫자), CONTENT(문자 FOR 해상도)
CREATE TABLE PRODUCT(
PRODUCT_ID NUMBER(8) PRIMARY KEY,
PNAME VARCHAR2(50) NOT NULL,
PRICE NUMBER(10) NOT NULL,
CONTENT VARCHAR2(50) NOT NULL);


--5. SHOP ORDER 테이블 생성
--SORDER: ORDER_ID(숫자 8자리-PK), USER_ID(USER에 있는 USER_ID 참조), PRODUCT_ID(PRODUCT에 있는 PRODUCT_ID 참조)
--ORDER_SEQ 생성
CREATE TABLE SORDER(
ORDER_ID NUMBER(8) PRIMARY KEY,
USER_ID NOT NULL CONSTRAINT SORDER_USER_ID_FK REFERENCES SUSER(USER_ID),
PRODUCT_ID NOT NULL CONSTRAINT SORDER_PRODUCT_ID_FK REFERENCES PRODUCT(PRODUCT_ID));
--구매일 추가
ALTER TABLE SORDER ADD ORDER_DATE DATE;

CREATE SEQUENCE ORDER_SEQ;
--장바구니
--INSERT INTO SORDER VALUES(ORDER_SEQ.NEXTVAL, 물건을 구매한 ID, 상품ID, SYODATE)
--주문 정보 전체 조회
SELECT * FROM SORDER;


--6. SUSER와 PAYTYPE 조인
SELECT S.USER_ID, S.NAME, P.PAY_NO, P.INFO FROM SUSER S, PAYTYPE P 
WHERE S.PAY_NO=P.PAY_NO AND S.USER_ID=1000;


--7. 전체 주문 목록 조회: 기준은 SORDER
--USER_ID, NAME, CARD/CASH, PRODUCT_ID, PNAME, PRICE, CONTENT
--SUSER 테이블: NAME, PAYTYPE 테이블: CARD/CASH, PRODUCT 테이블: PRODUCT_ID, PNAME, PRICE, CONTENT
SELECT O.USER_ID, S.NAME, T.INFO, P.PRODUCT_ID, P.PNAME, P.PRICE, P.CONTENT, O.ORDER_DATE
FROM SORDER O, SUSER S, PAYTYPE T, PRODUCT P 
WHERE O.USER_ID=S.USER_ID AND O.PRODUCT_ID=P.PRODUCT_ID AND S.PAY_NO=T.PAY_NO;


--8. 홍길동 주문 목록 조회: 기준은 SORDER
--USER_ID, NAME, CARD/CASH, PRODUCT_ID, PNAME, PRICE, CONTENT
--SUSER 테이블: NAME, PAYTYPE 테이블: CARD/CASH, PRODUCT 테이블: PRODUCT_ID, PNAME, PRICE, CONTENT
SELECT O.USER_ID, S.NAME, T.INFO, P.PRODUCT_ID, P.PNAME, P.PRICE, P.CONTENT, O.ORDER_DATE
FROM SORDER O, SUSER S, PAYTYPE T, PRODUCT P 
WHERE O.USER_ID=S.USER_ID AND O.PRODUCT_ID=P.PRODUCT_ID AND S.PAY_NO=T.PAY_NO AND O.USER_ID=1000;


--9. 도서 table 생성
--code, title, writer, price 컬럼 4개 필요
--code: 1001(PK)
--title: '자바의 신'
--writer: '홍길동'
--price: 25000
CREATE TABLE BOOKTBL(
CODE NUMBER(4) PRIMARY KEY,
TITLE NVARCHAR2(20) NOT NULL,
WRITER NVARCHAR2(20) NOT NULL,
PRICE NUMBER(8) NOT NULL);

INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE) VALUES(1001,'이것이 자바다','신용균',25000);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE) VALUES(1002,'자바의 신','강신용',28000);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE) VALUES(1003,'오라클로 배우는 데이터베이스','이지훈',28000);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE) VALUES(1004,'자바 1000제','김용만',29000);
INSERT INTO BOOKTBL(CODE, TITLE, WRITER, PRICE) VALUES(1005,'자바 프로그래밍 입문','박은종',30000);

COMMIT;

alter table booktbl add decription NVARCHAR2(100);


--10. member table 생성, 모두 NOT NULL
--USERID(영어, 숫자, 특수문자) 최대 12문자 허용, PK
--PASSWORD(영어, 숫자, 특수문자) 최대 15 허용
--NAME(한글)
--GENDER(한글: 남, 여)
--EMAIL
CREATE TABLE MEMBERTBL(
USERID VARCHAR2(15) PRIMARY KEY,
PASSWORD VARCHAR2(20) NOT NULL,
NAME NVARCHAR2(10) NOT NULL,
GENDER NVARCHAR2(2) NOT NULL,
EMAIL VARCHAR2(50) NOT NULL);

INSERT INTO MEMBERTBL VALUES('hong123','hong123#','홍길동','남','hong123@naver.com');
commit;


--11. BOARD TABLE 생성
--글번호(BNO, 숫자, 시퀀스 삽입, PK), 작성자(NAME, 한글), 비밀번호(PASSWORD, 숫자+영문자), 제목(TITLE, 한글), 내용(CONTENT, 한글), 파일첨부(ATTACH, 파일명), 
--답변글 작성시 참조되는 글번호(RE_REF, 숫자), 답변글 레벨(RE_LEV, 숫자), 답변글 순서(RE_SEQ_숫자), 조회수(CNT, 숫자, DEFAULT 0으로 지정), 작성날짜(REGDATE, DEFAULT로 SYSDATE 지정)
CREATE TABLE BOARD(
BNO NUMBER(8) CONSTRAINT PK_BOARD PRIMARY KEY,
NAME NVARCHAR2(10) NOT NULL,
PASSWORD VARCHAR2(20) NOT NULL,
TITLE NVARCHAR2(50) NOT NULL,
CONTENT NVARCHAR2(1000) NOT NULL,
ATTACH NVARCHAR2(100),
RE_REF NUMBER(8) NOT NULL,
RE_LEV NUMBER(8) NOT NULL,
RE_SEQ NUMBER(8) NOT NULL,
CNT NUMBER(8) DEFAULT 0,
REGDATE DATE DEFAULT SYSDATE
);

--시퀀스 생성 BOARD_SEQ
CREATE SEQUENCE BOARD_SEQ;

--서브쿼리
INSERT INTO BOARD(BNO,NAME,PASSWORD,TITLE,CONTENT,RE_REF,RE_LEV,RE_SEQ)
(SELECT BOARD_SEQ.NEXTVAL, NAME, PASSWORD, TITLE, CONTENT, BOARD_SEQ.CURRVAL, RE_LEV, RE_SEQ FROM BOARD);

COMMIT;


--12. 댓글
--RE_REF, RE_LEV, RE_SEQ
--원본글 작성 RE_REF: BNO 값과 동일, RE_LEV: 0, RE_SEQ: 0
SELECT BNO, TITLE, RE_REF, RE_LEV, RE_SEQ FROM BOARD WHERE BNO=6148;

--RE_REF: 그룹번호, RE_SEQ: 그룹 내에서 댓글의 순서, 
--RE_LEV: 그룹 내에서 댓글의 깊이(원본 글의 댓글인지, 대댓글인지)
--댓글도 새 글 => INSERT 작업, BNO: BOARD_SEQ.NEXTVAL, RE_REF: 원본 글의 RE_REF 값과 동일, RE_SEQ: 원본 글의 RE_SEQ+1
--RE_LEV: 원본 글의 RE_LEV+1

--첫번째 댓글 작성
INSERT INTO BOARD(BNO, NAME, PASSWORD, TITLE, CONTENT, ATTACH, RE_REF, RE_LEV, RE_SEQ)
VALUES(board_seq.nextval,'김댓글','12345','RE: 게시글','게시글 댓글', NULL, 6148, 1, 1);

COMMIT;

--가장 최신글의 댓글을 가지고 오기(+RE_SEQ ASC: 댓글의 최신순으로)
SELECT BNO, TITLE, RE_REF, RE_LEV, RE_SEQ FROM BOARD WHERE RE_REF=6148 ORDER BY RE_SEQ;

--두번째 댓글 작성
--RE_SEQ의 값이 작을수록 최신글
--항상 기존 댓글이 존재하는지 생각하기 => 기존 댓글의 RE_SEQ 값을 변경한 후(UPDATE 작업 후) INSERT 작업을 해야 한다.
--UPDATE 구문에서 WHERE 절의 RE_REF는 원본글의 RE_REF 값, RE_SEQ 비교구문은 원본글의 RE_SEQ 값과 비교
UPDATE BOARD SET RE_SEQ=RE_SEQ+1 WHERE RE_REF=6148 AND RE_SEQ>0; --부모의 RE_SEQ보다는 커야해서 0보다 크다고 지정해줌

COMMIT;

INSERT INTO BOARD(BNO, NAME, PASSWORD, TITLE, CONTENT, ATTACH, RE_REF, RE_LEV, RE_SEQ)
VALUES(board_seq.nextval,'김댓글','12345','RE: 게시글2','게시글 댓글2', NULL, 6148, 1, 1);

--대댓글 작성
--UPDATE / INSERT
UPDATE BOARD SET RE_SEQ=RE_SEQ+1 WHERE RE_REF=6148 AND RE_SEQ>2;

INSERT INTO BOARD(BNO, NAME, PASSWORD, TITLE, CONTENT, ATTACH, RE_REF, RE_LEV, RE_SEQ)
VALUES(board_seq.nextval,'김댓글','12345','RERE: 게시글','대댓글', NULL, 6148, 2, 3); --RE_LEV+1, RE_SEQ+1의 기준은 무조건 바로 부모의 것을 기준으로 삼는다.

--페이지 나누기(한 페이지 당 게시글 30개씩 할당)
--ROWNUM: 조회된 결과에 번호를 매겨준다.
--ORDER BY 구문에 INDEX가 들어가지 않는다면 제대로 된 결과를 보장하지 않는다.
--PK가 INDEX로 사용된다.
SELECT ROWNUM, BNO, TITLE FROM BOARD ORDER BY BNO DESC;
SELECT ROWNUM, BNO, TITLE, RE_REF, RE_LEV, RE_SEQ FROM BOARD ORDER BY RE_REF DESC, RE_SEQ ASC;

--해결
--ORDER BY 구문을 먼저 실행한 후 ROWNUM을 붙여야 한다.
SELECT ROWNUM, BNO, TITLE, RE_REF, RE_LEV, RE_SEQ
FROM(SELECT BNO, TITLE, RE_REF, RE_LEV, RE_SEQ FROM BOARD ORDER BY RE_REF DESC, RE_SEQ ASC)
WHERE ROWNUM <=30;

--한 페이지 당 게시글 30개씩 할당
--1 2 3 4 5......
--1PAGE 요청(1~30)
--2PAGE 요청(31~60)
--3PAGE 요청(61~90)
SELECT *
FROM (SELECT ROWNUM rnum, BNO, TITLE, RE_REF, RE_LEV, RE_SEQ
      FROM(SELECT BNO, TITLE, RE_REF, RE_LEV, RE_SEQ 
           FROM BOARD ORDER BY RE_REF DESC, RE_SEQ ASC)
      WHERE ROWNUM <=60)
WHERE rnum>30;

SELECT *
FROM (SELECT ROWNUM rnum, BNO, TITLE, RE_REF, RE_LEV, RE_SEQ
      FROM(SELECT BNO, TITLE, RE_REF, RE_LEV, RE_SEQ 
           FROM BOARD ORDER BY RE_REF DESC, RE_SEQ ASC)
      WHERE ROWNUM <=?)
WHERE rnum>?;

--1PAGE: RNUM>0, ROWNUM<=30
--2PAGE: RNUM>30, ROWNUM<=60
--3PAGE: RNUM>60, ROWNUM<=90

--1,2,3
--ROWNUM 값: 페이지번호*한 페이지에 보여줄 목록 개수
--RNUM 값: (페이지번호-1)*한 페이지에 보여줄 목록 개수


--13. SPRING_BOARD 테이블 생성
--BNO(숫자 10, PK, 제약조건명 PK_SPRING_BOARD 부여), TITLE(200, NOT NULL), CONTENT(2000, NOT NULL)
--WRITER(50, NOT NULL), REGDATE(DATE DEFAULT로 현재 시스템 날짜), UPDATEDATE(DATE DEFAULT로 현재 시스템 날짜)
CREATE TABLE SPRING_BOARD(
BNO NUMBER(10) CONSTRAINT PK_SPRING_BOARD PRIMARY KEY,
TITLE VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
WRITER VARCHAR2(50) NOT NULL,
REGDATE DATE DEFAULT SYSDATE,
UPDATEDATE DATE DEFAULT SYSDATE
);

--시퀀스 SEQ_BOARD
CREATE SEQUENCE SEQ_BOARD;

--mybatis 연습용 테이블
CREATE TABLE PERSON(
ID VARCHAR2(20) PRIMARY KEY,
NAME VARCHAR2(30) NOT NULL);

SELECT * FROM PERSON;

INSERT INTO PERSON VALUES('Kim123','김길동');

commit;


--14. 트랜잭션 테스트 테이블 생성
--트랜잭션: 하나의 업무에 여러 개의 작은 업무들이 같이 묶여 있음 => ㅓ하나의 단위로 처리 
--EX) 계좌이체: 계좌 출금 => 타 계좌 입금
CREATE TABLE TBL_SAMPLE1(COL1 VARCHAR2(500));
CREATE TABLE TBL_SAMPLE2(COL1 VARCHAR2(50));

SELECT * FROM TBL_SAMPLE1;
SELECT * FROM TBL_SAMPLE2;

DELETE TBL_SAMPLE1;

COMMIT;


--15. 페이지 나누기
--ROWNUM: 조회된 결과에 번호를 매겨줌
--SPRING_BOARD: BNO가 PK 상황(ORDER BY 기준도 BNO)
--1 PAGE: 가장 최신글 20개
--2 PAGE: 그 다음 최신글 20개
INSERT INTO SPRING_BOARD(BNO, TITLE, CONTENT, WRITER)
(SELECT SEQ_BOARD.NEXTVAL, TITLE, CONTENT, WRITER FROM SPRING_BOARD);

COMMIT;

SELECT COUNT(*) FROM SPRING_BOARD;


SELECT * FROM SPRING_BOARD;


--페이지 나누기를 할 때 필요한 SQL 코드
SELECT *
FROM (SELECT ROWNUM RN, BNO, TITLE, WRITER 
      FROM (SELECT BNO, TITLE, WRITER FROM SPRING_BOARD ORDER BY BNO DESC)
      WHERE ROWNUM<=20)
WHERE RN>0;

--오라클 힌트 사용: (SELECT BNO, TITLE, WRITER FROM SPRING_BOARD ORDER BY BNO DESC) 대체
SELECT BNO, TITLE, WRITER, REGDATE, UPDATEDATE
FROM (SELECT /*+INDEX_DESC(SPRING_BOARD PK_SPRING_BOARD)*/ ROWNUM RN, BNO, TITLE, WRITER, REGDATE, UPDATEDATE
      FROM SPRING_BOARD
      WHERE ROWNUM<=40)
WHERE RN>20;


--16. 댓글 테이블
CREATE TABLE SPRING_REPLY(
RNO NUMBER(10,0) CONSTRAINT PK_REPLY PRIMARY KEY,--댓글 글번호
BNO NUMBER(10,0) NOT NULL,--원본글 글번호
REPLY VARCHAR2(1000) NOT NULL,--댓글 내용
REPLYER VARCHAR2(50) NOT NULL,--댓글 작성자
REPLYDATE DATE DEFAULT SYSDATE,--댓글 작성일
CONSTRAINT FK_REPLY_BOARD FOREIGN KEY(BNO) REFERENCES SPRING_BOARD(BNO)--외래키 제약조건
);

--댓글 테이블 수정(컬럼 추가): UPDATEDATE
ALTER TABLE SPRING_REPLY ADD(UPDATEDATE DATE DEFAULT SYSDATE);

CREATE SEQUENCE SEQ_REPLY;

--댓글 작성
INSERT INTO SPRING_REPLY(RNO, BNO, REPLY, REPLYER)
<<<<<<< HEAD
VALUES(seq_REPLY.nextval,1041,'게시글 댓글','TEST2');
=======
VALUES(seq_REPLY.nextval,917,'게시글 댓글 답니다.','TEST1');
>>>>>>> 43d53ca91b27e3f12c3738f144d5850e8616df90

COMMIT;

--spring_reply index 추가 설정
CREATE INDEX IDX_REPLY ON SPRING_REPLY(BNO DESC, RNO ASC);

SELECT RNO, BNO, REPLY, REPLYER, REPLYDATE, UPDATEDATE
FROM (SELECT /*+INDEX(SPRING_REPLY IDX_REPLY)*/ ROWNUM RN, RNO, BNO, REPLY, REPLYER, REPLYDATE, UPDATEDATE
      FROM SPRING_REPLY
      WHERE BNO=1041 AND ROWNUM <= 10)
WHERE RN>0;

--spring_board에 컬럼 추가(댓글 수 저장)
alter table spring_board add replycnt number default 0;

--이미 들어간 댓글 수 삽입
update spring_board set replycnt=(select count(rno) from spring_reply where spring_board.bno=spring_reply.bno);

commit;

select * from spring_board where bno=1041;
      WHERE BNO=917 AND ROWNUM <= 10)
WHERE RN>0;


--17. 파일 첨부 테이블 생성
--spring_attach: uuid, uploadpath, filename, filetype
create table spring_attach(
    uuid varchar2(100) constraint pk_attach primary key,
    uploadpath varchar2(200) not null,
    filename varchar2(100) not null,
    filetype char(1) default '1',
    bno number(10,0) not null,
    constraint fk_board_attach foreign key(bno) references spring_board(bno)
)


--18. spring_board bno와 spring_attach bno 일치 시
--title, content, writer, bno, uuid, uploadpath, filetype, filename
--inner join
select title, content, writer, b.bno, uuid, uploadpath, filetype, filename
from spring_board b, spring_attach a
where b.bno=a.bno;


--19. 어제 날짜의 첨부 목록 가져오기
select * from spring_attach where uploadpath=to_char(sysdate-1,'yyyy\mm\dd');


--20. security 프로젝트에서 사용할 테이블
--user 테이블 작성 시 enabled 컬럼 추가됨
create table sp_user(
userid varchar2(50) primary key,
email varchar2(100) not null,
password varchar2(100) not null,
enabled char(1) default '1');

--user 테이블과 관련된 권한 테이블 작성
create table sp_user_authority(
userid varchar2(50) not null,
authority varchar2(50) not null);

--외래키 설정
alter table sp_user_authority add constraint sp_user_authority_fk foreign key(userid) references sp_user(userid);

insert into sp_user(userid, email, password) values('hong123','hong123@gmail.com','1111');
insert into sp_user_authority(userid, authority) values('hong123', 'ROLE_USER');
insert into sp_user_authority(userid, authority) values('hong123', 'ROLE_ADMIN');
commit;

--sp_user와 sp_user_authority left outer join
select u.userid, u.email, u.password, u.enabled, a.authority 
from sp_user u left outer join sp_user_authority a on u.userid=a.userid;

--특정 user의 정보를 추출
select u.userid, u.email, u.password, u.enabled, a.authority 
from sp_user u left outer join sp_user_authority a on u.userid=a.userid
where u.userid='hong123';


--21. remember-me를 위한 테이블 작성
create table persistent_logins(
username varchar(64) not null,
series varchar(64) primary key,
token varchar(64) not null,
last_used timestamp not null);


--22. spring_board 연결할 user 테이블 생성 => spring_member
--userid, userpw, username(성명), regdate, updatedate, enabled






