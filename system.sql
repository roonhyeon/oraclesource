--<사용자>--
--SCOTT, HR => 데이터베이스에 접속하여 데이터를 관리하는 계정
--TABLE, INDEX, VIEW 등 여러 객체가 사용자별(SCOTT, HR)로 카테고리가 생성된다.
--업무에 따라 사용자들을 나눠서 관리한다.

--<스키마>--
--데이터 간 관계, 데이터 구조, 제약조건 등 데이터를 관리하고 저장하기 위해 정의한 데이터베이스
--스키마==사용자 IN CASE OF ORACLE DB

--<권한>--
--사용자 생성: 사용자 생성 시 권한이 필요하다. 아무나 할 수 있는 것이 아니다. => 이 권한은 SYS, SYSTEM에 있다.
--1) 시스템 권한
--① 사용자 생성(CREATE USER), 수정(ALTER USER), 삭제(DROP USER)
--② 데이터베이스 접근(CREATE SESSION), 수정(ALTER SESSION)
--③ 여러 객체 생성(VIEW, SYNONYM) 및 관리 권한
--2) 객체 권한
--① CREATE SESSION을 사용자에게 부여: GRANT CREATE SESSION TO 사용자명;
--② 테이블 수정/삭제, 인덱스 생성/삽입/참조/조회/수정, 뷰 삭제/삽입/생성/조회/수정, 시퀀스 수정/조회, 프로시저, 함수, 패키지 권한


--<사용자 생성>--
-- 사용자 생성 시 대소문자는 구별하지 않는다.(단, 비밀번호는 구별을 한다.)
-- CREATE: 생성, ALTER: 수정, DROP: 삭제, DELETE: 삭제
-- 오라클 버전이 올라가면서 사용자를 생성할 때 요구하는 접두사(C##)를 생략하게 되었다. EX) JAVADB => C##JAVADB
-- ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; => 저는 C##을 사용하지 않겠습니다.
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;


--<JAVADB>--
-- USER 생성 => 생성은 SYS, SYSTEM 만 가능하다.
-- CREATE USER 사용자명 IDENTIFIED BY 비밀번호
CREATE USER JAVADB IDENTIFIED BY 12345
-- USER가 사용할 공간 할당
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
ALTER USER JAVADB QUOTA 2M ON USERS;
-- GRANT: 권한 부여 (사용자 생성만 해서는 아무것도 할 수가 없다. => JAVADB에게 CONNECT와 RESOURCE의 권한을 부여
GRANT CONNECT, RESOURCE TO JAVADB;


--<SCOTT>--
CREATE USER SCOTT IDENTIFIED BY TIGER
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
--SCOTT에게 권한 부여
GRANT CONNECT, RESOURCE TO SCOTT;
--뷰 생성 권한 부여
GRANT CREATE VIEW TO SCOTT;
--SYNONYM 생성 권한 부여
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;

select * from all_users;

GRANT UNLIMITED TABLESPACE TO SCOTT;

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY TIGER;
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;


--<TEST>--
CREATE USER test IDENTIFIED BY 12345;
--TEST 접속 권한 부여(ACCORDING TO 사용자 TEST는 CREATE SESSION 권한을 가지고있지 않음.)
GRANT CREATE SESSION TO TEST;
--테이블 생성 권한 부여(ACCORDING TO 권한이 불충분합니다.)
GRANT RESOURCE, CREATE TABLE TO TEST;
--테이블 행 생성 권한 부여(ACCORDING TO 테이블스페이스 'USERS'에 대한 권한이 없습니다.)
ALTER USER TEST DEFAULT TABLESPACE USERS;
ALTER USER TEST TEMPORARY TABLESPACE TEMP;
ALTER USER TEST QUOTA 2M ON USERS; --USERS에 2MGB 정도 공간 할당

--SCOTT에게 TEST가 생성한 MEMBER 테이블 조회 권한 부여
--GRANT SELECT ON MEMBER TO SCOTT;

--<부여한 권한 취소>--
--REVOKE SELECT, INSERT ON MEMBER FROM SCOTT;

--<생성한 사용자 삭제>--
--DROP USER TEST;
DROP USER TEST CASCADE; --사용자 삭제할 때 TEST와 관련된 모든 객체도 함께 삭제


--<TEST2>--
--## 밑에 총 4줄은 사용자와 테이블 생성 시의 기본코드
--<사용자 생성 + 테이블 스페이스 권한 부여>--
CREATE USER TEST2 IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
--<롤>--
--1) 여러 권한들의 모임
--2) CONNECT 롤: CREATE SESSION 
--3) RESOURCE 롤: CREATE TRIGGER, CREATE SEQUENCE, CREATE PROCEDURE, CREATE TABLE....
--4) 기본적으로 이 2개의 권한은 부여하고 시작한다.
GRANT CONNECT, RESOURCE TO TEST2;
