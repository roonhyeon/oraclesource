--<�����>--
--SCOTT, HR => �����ͺ��̽��� �����Ͽ� �����͸� �����ϴ� ����
--TABLE, INDEX, VIEW �� ���� ��ü�� ����ں�(SCOTT, HR)�� ī�װ��� �����ȴ�.
--������ ���� ����ڵ��� ������ �����Ѵ�.

--<��Ű��>--
--������ �� ����, ������ ����, �������� �� �����͸� �����ϰ� �����ϱ� ���� ������ �����ͺ��̽�
--��Ű��==����� IN CASE OF ORACLE DB

--<����>--
--����� ����: ����� ���� �� ������ �ʿ��ϴ�. �ƹ��� �� �� �ִ� ���� �ƴϴ�. => �� ������ SYS, SYSTEM�� �ִ�.
--1) �ý��� ����
--�� ����� ����(CREATE USER), ����(ALTER USER), ����(DROP USER)
--�� �����ͺ��̽� ����(CREATE SESSION), ����(ALTER SESSION)
--�� ���� ��ü ����(VIEW, SYNONYM) �� ���� ����
--2) ��ü ����
--�� CREATE SESSION�� ����ڿ��� �ο�: GRANT CREATE SESSION TO ����ڸ�;
--�� ���̺� ����/����, �ε��� ����/����/����/��ȸ/����, �� ����/����/����/��ȸ/����, ������ ����/��ȸ, ���ν���, �Լ�, ��Ű�� ����


--<����� ����>--
-- ����� ���� �� ��ҹ��ڴ� �������� �ʴ´�.(��, ��й�ȣ�� ������ �Ѵ�.)
-- CREATE: ����, ALTER: ����, DROP: ����, DELETE: ����
-- ����Ŭ ������ �ö󰡸鼭 ����ڸ� ������ �� �䱸�ϴ� ���λ�(C##)�� �����ϰ� �Ǿ���. EX) JAVADB => C##JAVADB
-- ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; => ���� C##�� ������� �ʰڽ��ϴ�.
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;


--<JAVADB>--
-- USER ���� => ������ SYS, SYSTEM �� �����ϴ�.
-- CREATE USER ����ڸ� IDENTIFIED BY ��й�ȣ
CREATE USER JAVADB IDENTIFIED BY 12345
-- USER�� ����� ���� �Ҵ�
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
ALTER USER JAVADB QUOTA 2M ON USERS;
-- GRANT: ���� �ο� (����� ������ �ؼ��� �ƹ��͵� �� ���� ����. => JAVADB���� CONNECT�� RESOURCE�� ������ �ο�
GRANT CONNECT, RESOURCE TO JAVADB;


--<SCOTT>--
CREATE USER SCOTT IDENTIFIED BY TIGER
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
--SCOTT���� ���� �ο�
GRANT CONNECT, RESOURCE TO SCOTT;
--�� ���� ���� �ο�
GRANT CREATE VIEW TO SCOTT;
--SYNONYM ���� ���� �ο�
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;

select * from all_users;

GRANT UNLIMITED TABLESPACE TO SCOTT;

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY TIGER;
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;


--<TEST>--
CREATE USER test IDENTIFIED BY 12345;
--TEST ���� ���� �ο�(ACCORDING TO ����� TEST�� CREATE SESSION ������ ���������� ����.)
GRANT CREATE SESSION TO TEST;
--���̺� ���� ���� �ο�(ACCORDING TO ������ ������մϴ�.)
GRANT RESOURCE, CREATE TABLE TO TEST;
--���̺� �� ���� ���� �ο�(ACCORDING TO ���̺����̽� 'USERS'�� ���� ������ �����ϴ�.)
ALTER USER TEST DEFAULT TABLESPACE USERS;
ALTER USER TEST TEMPORARY TABLESPACE TEMP;
ALTER USER TEST QUOTA 2M ON USERS; --USERS�� 2MGB ���� ���� �Ҵ�

--SCOTT���� TEST�� ������ MEMBER ���̺� ��ȸ ���� �ο�
--GRANT SELECT ON MEMBER TO SCOTT;

--<�ο��� ���� ���>--
--REVOKE SELECT, INSERT ON MEMBER FROM SCOTT;

--<������ ����� ����>--
--DROP USER TEST;
DROP USER TEST CASCADE; --����� ������ �� TEST�� ���õ� ��� ��ü�� �Բ� ����


--<TEST2>--
--## �ؿ� �� 4���� ����ڿ� ���̺� ���� ���� �⺻�ڵ�
--<����� ���� + ���̺� �����̽� ���� �ο�>--
CREATE USER TEST2 IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
--<��>--
--1) ���� ���ѵ��� ����
--2) CONNECT ��: CREATE SESSION 
--3) RESOURCE ��: CREATE TRIGGER, CREATE SEQUENCE, CREATE PROCEDURE, CREATE TABLE....
--4) �⺻������ �� 2���� ������ �ο��ϰ� �����Ѵ�.
GRANT CONNECT, RESOURCE TO TEST2;
