-- 대소문자 구별하지 않는다.(단, 비밀번호는 구별을 한다.)
-- CREATE: 생성, ALTER: 수정, DROP: 삭제, DELETE: 삭제
-- 오라클 버전이 변경되면서 사용자를 생성할 때 C## 문자를 넣어서 만들도록 변경되었다.
-- EX) JAVADB => C##JAVADB
-- ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; => 저는 C##을 사용하지 않겠습니다.
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; 

-- USER 생성 => 생성은 SYS, SYSTEM 만 가능하다.
-- CREATE USER 사용자명 IDENTIFIED BY 비밀번호
CREATE USER JAVADB IDENTIFIED BY 12345

-- USER가 사용할 공간 할당
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- GRANT: 권한 부여 (사용자 생성만 해서는 아무것도 할 수가 없다. => JAVADB에게 CONNECT와 RESOURCE의 권한을 부여
GRANT CONNECT, RESOURCE TO JAVADB;

CREATE USER SCOTT IDENTIFIED BY TIGER
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

--SCOTT에게 부여된 권한
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