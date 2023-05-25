--scott

--describe emp(employee): emp table ���� ���� => �ʵ��(���̸�)(EMPNO:�����ȣ)  ��������(NOT NULL)  ������Ÿ��(NUMBER(4))
--ENAME(�����), JOB(��å), MGR(���ӻ�� ��ȣ), HIREDATE(�Ի���), SAL(�޿�), COMM(����), DEPTNO(�μ���ȣ)
--NUMBER: �Ҽ��� �ڸ����� �����ؼ� ������ �� �ִ�.(������ �͸�)
--NUMBER(4): 4�ڸ� ���ڱ��� ���, NUMBER(8,2): ��ü �ڸ����� 8�ڸ��̰� �Ҽ��� 2�ڸ��� �����Ѵ�.
--VARCHAR2: ������ ���ڿ� ����
--VARCHAR2(10): 10byte ���ڱ��� ������ �� �ִ�.
--DATE: ��¥ ������
DESC emp;

--DEPTNO(�μ���ȣ) DNAME(�μ���), LOC(�μ���ġ)
DESC dept;

--GRADE(�޿����), LOSAL(�ּ� �޿���), HISAL(�ִ� �޿���)
DESC salgrade;

--*****select: ������ ��ȸ
--��ȸ���: selection(�� ������ ��ȸ), projection(�� ������ ��ȸ), *****join(�� �� �̻��� table�� ����Ͽ� ��ȸ)
--SELECT ���̸�1, ���̸�2....(��ȸ�� ���� ��ü��� *�� ó���Ѵ�.)
--FROM ���̺��;

--1.EMP table�� ��ü ���� ��ȸ
SELECT
    *
FROM
    emp;

--2.EMP table���� �����ȣ, �̸�, �޿��� ��ȸ
SELECT
    empno,
    ename,
    sal
FROM
    emp;

--3.DEPT table ��ü ��ȸ
SELECT
    *
FROM
    dept;

--4.DEPT ���̺� �ȿ� �μ���ȣ, ������ ��ȸ
SELECT
    deptno,
    loc
FROM
    dept;
    
--5.EMP ���̺� �ȿ� �μ���ȣ ��ȸ
SELECT
    deptno
FROM
    emp;
    
--6.EMP ���̺� �ȿ� �ߺ��Ǵ� �μ���ȣ ����(DISTINCT)
SELECT DISTINCT
    deptno
FROM
    emp;

--7.���� ���� ���� ���(��� �ߺ��̳� �ƴϳĸ� �Ǵ��Ѵ�.)    
SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
--8.����: ������� 1�� ���� ���ϱ�(SAL*12+COMM)
--��µǴ� �ʵ���� ���� ���� �� �ִ�. ((AS) �ʵ��) ��, ������ �ַ��� ""�� �����ش�.
SELECT
    empno           �����ȣ,
    ename           �����,
    sal             ����,
    comm            Ŀ�̼�,
    job             "�� å",
    sal * 12 + comm AS annsal
FROM
    emp;

--9.������ ����: ORDER BY
--��������: DESC, ��������: ASC
--ENAME, SAL �� �����ϰ�, SAL�� ������������ ����
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

--ENAME, SAL �� �����ϰ�, SAL�� ������������ ����. ASC�� ORDER BY�� �⺻�̹Ƿ� ASC�� ���� ����.
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;
    
--��ü ���� ����ϰ�, ����� �����ȣ�� ������������ ����
SELECT
    *
FROM
    emp
ORDER BY
    empno;
    
--��ü ���� ����ϰ�, ����� �μ���ȣ�� ���������� �޿��� ������������ ����
SELECT
    *
FROM
    emp
ORDER BY
    deptno,
    sal DESC;
    
--[�ǽ�] EMP ���̺��� ��� �� ���
--EMPNO => EMPLOYEE_NO (�̷��� ��Ī ���̱�)
--ENAME => EMPLOYEE_NAME
--MGR => MANAGER
--SAL => SALARY
--COMM => COMMISION
--DEPTNO => DEPARTMENT_NO
--�μ� ��ȣ�� �������� ������������ �����ϵ� �μ���ȣ�� ���ٸ� ��� �̸��� �������� �������� ����
SELECT
    empno  employee_no,
    ename  employee_name,
    mgr    manager,
    sal    salary,
    comm   commision,
    deptno department_no
FROM
    emp
ORDER BY
    deptno DESC,
    ename;
    
--10.(SELECT + FROM + )WHERE: Ư�� '����'�� �������� ���ϴ� ���� ��ȸ
--�μ���ȣ�� 30�� �����͸� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

--�����ȣ�� 7782�� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

--�μ���ȣ�� 30�̰�, �����å�� SALESMAN ���� ��ȸ => ���������� AND�� ���
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN'; --=''���� ��ҹ��� ����
    
--�����ȣ�� 7499�̰�, �μ���ȣ�� 30�� �� ��ȸ
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;
    
--�μ���ȣ�� 30�̰ų�, �����å�� CLERK�� �� ��ȸ => �� �� �ϳ��� ���� ������ OR�� ���
SELECT
    *
FROM
    emp
WHERE
    job = 'CLERK'
    OR deptno = 30;

--11.���������: +,-,*,/,MOD(������-ǥ���� �ƴϰ� ONLY IN ORACLE) 
--�񱳿�����: >,<,>=,<=
--��񱳿�����: =,!=,<>,^=(�ڿ� 3���� �ǹ̰� ��� ����: A���� B���� �ٸ� ��� TRUE, ���� ��� FALSE)
--������������: NOT
--IN ������
--BETWEEN A AND B ������
--LIKE �����ڿ� ���ϵ� ī��(_,%)
--IS NULL ������
--���տ�����: UNION(������-�ߺ�����), UNION ALL(������-�ߺ�����), MINUS(������), INTERSECT(������)

--EMP ���̺��� �޿� ���� 12�� ���� ���� 36000�� �� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

--ENAME�� F ������ ���ڷ� �����ϴ� ��� ��ȸ
--���� ǥ�� �� ''�� ���(""�� ����� �� ����.)
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

--JOB�� MANAGER �̰ų� SALESMAN �̰ų� CLERK�� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN'
    OR job = 'CLERK';

--SAL�� 3000�� �ƴ� ����� ��ȸ(�� �� ��� ���� �ǹ�)
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;


--IN ������: JOB�� MANAGER �̰ų� SALESMAN �̰ų� CLERK�� ��� ��ȸ�� �� �ξ� �����ϰ� �ۼ� ����
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

--JOB�� MANAGER, SALESMAN, CLERK�� �ƴ� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
        job != 'MANAGER'
    AND job^= 'SALESMAN'
    AND job <> 'CLERK';

--JOB�� MANAGER, SALESMAN, CLERK�� �ƴ� ��� ��ȸ(������ ���)
SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

--�μ���ȣ�� 10,20 �����ȸ(IN ���)
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

--�޿��� 2000 �̻� 3000 ������ ��� ��ȸ(BETWEEN �ּڰ� AND �ִ�)
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

--�޿��� 2000 �̻� 3000 ���ϰ� �ƴ� ��� ��ȸ(NOT BETWEEN �ּڰ� AND �ִ�)
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;


--LIKE �����ڿ� ���ϵ� ī��(_,%)
--��� �̸��� S�� �����ϴ� ��� ���� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%'; --%:�ڿ� ���� ���̿� �������(���ڰ� ���� ��쵵 ����) ��� ���� �����͸� �ǹ��Ѵ�.

--��� �̸��� �� ��° ���ڰ� L�� ����� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%'; --� ���̵� ������� �����(_) �ϳ��� �ϳ��� ���� �����͸� �ǹ��Ѵ�.

--��� �̸��� AM�� ���Ե� ����� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

--��� �̸��� AM�� ���Ե��� ���� ����� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';


--IS NULL ������
--NULL: �����Ͱ��� ������ ��� �ִ� ����
--NULL�� 'SOMETHING = NULL'�� ������� ���Ѵ�.
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

--MGR�� NULL�� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

--MGR�� NULL�� �ƴ� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;


--���տ�����
--������: UNION,UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10; --�ߺ��� �ڵ� ����
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10; --�ߺ��� �ڵ� ���� �ȵ�

--������: MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10; --��ü�� ���ؼ� 10���� ����

--������: INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10; --10���� ����

--������ �켱����
--1) ��������� *,/
--2) ��������� +,-
--3) �񱳿�����
--4) IS NULL, IS NOT NULL, LIKE, IN
--5) BETWEEN A AND B
--6) NOT
--7) AND
--8) OR
--�켱������ ��� �Ѵٸ� �Ұ�ȣ ��� ��õ


--EMP ���̺��� ����̸��� S�� ������ ��� ������ ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';

--EMP ���̺��� 30�� �μ��� �ٹ��ϴ� ��� �߿��� ��å�� SALESMAN�� ����� �����ȣ, �̸�, �޿� ��ȸ(SAL ��������)
SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN'
ORDER BY
    sal DESC;

--EMP ���̺��� ����Ͽ� 20,30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿��� 2000 �ʰ��� ��� ��ȸ
--�����ȣ, �̸�, �޿�, �μ���ȣ ��ȸ
--���� �����ڸ� ����ϴ� ��İ� ������� �ʴ� ��� �� ������ ����Ѵ�.
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 20
    AND sal > 2000
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 30
    AND sal > 2000;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    sal > 2000
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

--��� �̸��� E�� ���ԵǾ� �ִ� 30�� �μ� ��� �� �޿��� 1000~2000 ���̰� �ƴ� ����� �̸�
--�����ȣ, �޿�, �μ���ȣ ��ȸ
SELECT
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal NOT BETWEEN 1000 AND 2000;

--�߰� ������ �������� ������, ����ڰ� �ְ� ��å�� MANAGER, CLERK�� ��� �߿��� ��� �̸��� �� ��° ���ڰ� L�� �ƴ� ����� ���� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';

--------------
--����Ŭ �Լ�
--����Ŭ���� �⺻���� �����ϴ� ���� �Լ�, ����ڰ� �ʿ信 ���� ���� ������ ����� ���� �Լ�

--#���� �Լ�#
--1. ���ڿ� �Լ�
--1) UPPER(��� �빮��),LOWER(��� �ҹ���),INITCAP(ù ���ڸ� �빮��)
SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;
--�빮�ڳ� �ҹ��� �� ������ �ɰ� Ű���� �˻� ���� �� �� �����ϰ� �� �� �ִ�.
SELECT
    *
FROM
    emp
WHERE
    upper(ename) = 'FORD';

SELECT
    *
FROM
    emp
WHERE
    upper(ename) LIKE upper('%FORD%');

--2) ���ڿ� ����: LENGTH
SELECT
    ename,
    length(ename)
FROM
    emp;
--��� �̸��� ���̰� 5 �̻��� ��� ��ȸ => �Լ��� ������������ ��� ����
SELECT
    ename,
    length(ename)
FROM
    emp
WHERE
    length(ename) >= 5;
--�ѱ��� ��
--DUAL: SYS�� �����ϴ� ���̺�(�ӽ� �����̳� �Լ��� ������� Ȯ���ϴ� �뵵)
--LENGTHB: BYTE �� => ����� 1BYTE, �ѱ��� �� ���� �� 3BYTE
SELECT
    length('�ѱ�'),
    lengthb('�ѱ�'),
    lengthb('AB')
FROM
    dual; --��°�: 2, 6, 2

--3) SUBSTR(���ڿ� ������, ���� ��ġ, ���� ����): ���� ���̴� ���� ����
--���ڿ��� �Ϻθ� �����ϴ� �Լ�(=JAVA SUBSTRING)
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5),
    substr(job, - 3)
FROM
    emp; -- -3�� �ڿ������� ����
--ENAME, �� ��° ���ں��� ���
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;

--4) INSTR(��� ���ڿ�, ��ġ�� ã������ ���ڿ�, ��� ���ڿ����� ã�⸦ ������ ��ġ(����), ���� ��ġ���� ã������ ���ڰ� ���� ���� ���� �� �� ��°�� ã�� ������ ����(����)): ���ڿ� ������ �ȿ��� Ư�� ���� ��ġ ã��
--'HELLO, ORACLE!' ���ڿ����� 'L' ���ڿ� ã��
SELECT
    instr('HELLO, ORACLE!', 'L')       AS instr_1,
    instr('HELLO, ORACLE!', 'L', 5)    AS instr_2,
    instr('HELLO, ORACLE!', 'L', 2, 2) AS instr_3
FROM
    dual; --��°�: 3, 12, 4

--5) REPLACE(���ڿ� ������, ã�� ����, ���� ����): Ư�� ���ڸ� �ٸ� ���ڷ� ����
--010-1234-5678 '-'�� �� ���ڿ��� �����ϱ�/'-'�� ���ֱ�
SELECT
    '010-1234-5678'                    AS ������,
    replace('010-1234-5678', '-', ' ') AS replace_1,
    replace('010-1234-5678', '-')      AS replace_2
FROM
    dual;
--'�̰��� ORACLE �̴�', '�̰���' => 'THIS IS'�� ����
SELECT
    '�̰��� ORACLE �̴�'                            AS ������,
    replace('�̰��� ORACLE �̴�', '�̰���', 'THIS IS') AS ������
FROM
    dual;

--6) CONCAT: �� ���ڿ� ������ ��ġ��(������ 2���� ����)
SELECT
    concat(empno, ename)
FROM
    emp;
--3�� �̻��� �ϰ� ������ �׸�ŭ CONCAT�� �� �־��ָ� �ȴ�.
SELECT
    concat(empno,
           concat(':', ename))
FROM
    emp;

--7) ||: ���ڿ� ���� ������(���� �� ���� ����)
SELECT
    empno
    || ':'
    || ename
FROM
    emp;

--8) TRIM(����),LTRIM(����),RTRIM(������): ���� ���� Ư�� ���� ����
SELECT
    '    THIS IS    ',
    TRIM('    THIS IS    ')
FROM
    dual;


--2023.03.21--
--2. �����Լ�
--1) ROUND,TRUNC,CEIL,FLOOR,MOD
--ROUND(����, �ݿø� ��ġ(����)): �ݿø�
SELECT
    round(1234.5678)      AS round, --�Ҽ��� ù° �ڸ����� �ݿø�(1235)
    round(1234.5678, 0)   AS round0, --�Ҽ��� ù° �ڸ����� �ݿø�(1235)
    round(1234.5678, 1)   AS round1, --�Ҽ��� ��° �ڸ����� �ݿø�(1234.6)
    round(1234.5678, 2)   AS round2, --�Ҽ��� ��° �ڸ����� �ݿø�(1234.57)
    round(1234.5678, - 1) AS round_minus1, --�ڿ��� ù° �ڸ����� �ݿø�(4���� �ݿø��ؼ� 1230���� ���´�.)
    round(1234.5678, - 2) AS round_minus2 ----�ڿ��� ��° �ڸ����� �ݿø�(3���� �ݿø��ؼ� 1200���� ���´�.)
FROM
    dual;
    
--TRUNC(����, ������ ��ġ(����)): Ư�� ��ġ���� ������ �Լ�
SELECT
    trunc(1234.5678)      AS trunc, --�Ҽ��� ù° �ڸ����� ����(1234)
    trunc(1234.5678, 0)   AS trunc0, --�Ҽ��� ù° �ڸ����� ����(1234)
    trunc(1234.5678, 1)   AS trunc1, --�Ҽ��� ��° �ڸ����� ����(1234.5)
    trunc(1234.5678, 2)   AS trunc2, --�Ҽ��� ��° �ڸ����� ����(1234.56)
    trunc(1234.5678, - 1) AS trunc_minus1, --�ڿ��� ù° �ڸ����� ����(1230)
    trunc(1234.5678, - 2) AS trunc_minus2 ----�ڿ��� ��° �ڸ����� ����(1200)
FROM
    dual;

--CEIL(����), FLOOR(����): �Էµ� ���ڿ� ����� ū ����, ���� ����
SELECT
    ceil(3.14), --��°�: 4
    floor(3.14), --��°�: 3
    ceil(- 3.14), --��°�: -3
    floor(- 3.14) --��°�: -4
FROM
    dual;

--MOD(����, ���� ��): ��������
SELECT
    mod(15, 6), --��°�: 3
    mod(10, 2), --��°�: 0
    mod(11, 2) --��°�: 1
FROM
    dual;


--3. ��¥ �Լ�
--��¥ ������ + ����: ���� ��¥ �����Ϳ��� ���� ���ڸ�ŭ�� �ϼ� ������ ��¥
--��¥ ������ - ��¥ ������: �� ��¥ ������ ���� �ϼ� ����
--��, ��¥ ������ + ��¥ ������: ���� �Ұ�
--1) SYSDATE �Լ�: ���� ��¥ ������, ����Ŭ �����ͺ��̽� ������ ��ġ�� OS�� ���� ��¥�� �ð��� �����´�.
SELECT SYSDATE AS TODAY, SYSDATE -1 AS YESTERDAY, SYSDATE +1 AS TOMORROW FROM DUAL;

--2) ADD_MONTHS(��¥, ���� ������): �� ���� ������ ��¥ ���ϱ�
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL; --3���� �� ��¥ ���

--�Ի� 50�ֳ��� �Ǵ� ��¥ ���ϱ�
--EMPNO,ENAME,HIREDATE,�Ի� 50�ֳ� ��¥ ��ȸ
SELECT EMPNO,ENAME,HIREDATE,ADD_MONTHS(HIREDATE,600) FROM EMP;

--���� ��¥�� 6���� �� ��¥ ���
SELECT SYSDATE AS TODAY, ADD_MONTHS(SYSDATE,6) FROM DUAL;

--3) MONTHS_BETWEEN(ù ��° ��¥, �� ��° ��¥): �� ��¥ ������ ���� ��¥ ���̸� �������� ����Ͽ� ���
--�Ի� 45�� �̸��� ��� ������ ��ȸ
SELECT EMPNO,ENAME,HIREDATE FROM EMP WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE)<540;

--����
SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(hiredate, sysdate)        AS months1,
    months_between(sysdate, hiredate)        AS months2,
    trunc(months_between(sysdate, hiredate)) AS months3
FROM
    emp;

--4) NEXT_DAY(��¥, ����): Ư�� ��¥�� �������� ���ƿ��� ������ ��¥ ���
--LAST_DAY(��¥): Ư�� ��¥�� ���� ���� ������ ��¥�� ���
SELECT SYSDATE,NEXT_DAY(SYSDATE,'�ݿ���'),LAST_DAY(SYSDATE) FROM DUAL;

--��¥�� �ݿø�, ����: ROUND, TRUNC
--CC: �� �ڸ� ������ �� ���ڸ��� �������� ���
--2023���� ��� 2050 �����̹Ƿ� 2001������ ó��
SELECT
    sysdate,
    round(sysdate, 'CC')   AS format_CC,
    round(sysdate, 'YYYY') AS format_YYYY, --6�� ����
    round(sysdate, 'DDD')  AS format_DDD, --12�� ����
    round(sysdate, 'HH')   AS format_HH 
FROM
    dual;
    

--4. ����ȯ �Լ�: �ڷ����� �� ��ȯ
--1) NUMEBR, VARCHAR2, DATE
SELECT EMPNO,ENAME,EMPNO+'500' FROM EMP WHERE ENAME='FORD'; --500�� ���ڷ� ����ȯ�ؼ� �� ��������.

--SELECT EMPNO,ENAME,EMPNO+'ABCD' FROM EMP WHERE ENAME='FORD'; --��������. ���� ���ڿ��� ����ȯ�� �ؼ� �������� �ƿ� ���ڸ� �Է��ϸ� ���ڿ� ���� �� ����.

--2) TO_CHAR(): ���� �Ǵ� ��¥ �����͸� ���� �����ͷ� ��ȯ, TO_NUMBER(): ���� �����͸� ���� �����ͷ� ��ȯ, TO_DATE(): ���� �����͸� ��¥ �����ͷ� ��ȯ
--TO_CHAR(): ���ϴ� ��� ���·� ��¥�� ����ϰ� ���� �� �ַ� ����Ѵ�.
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð� FROM DUAL;

SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD') AS ���糯¥,
    to_char(sysdate, 'YYYY')       AS ���翬��,
    to_char(sysdate, 'MM')         AS �����,
    to_char(sysdate, 'DD')         AS ��������
FROM
    dual;

--MON, MONTH: �� �̸�, DDD: 365�� �߿��� �� ���� �����°�?
SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD')    AS ���糯¥,
    to_char(sysdate, 'YYYY')          AS ���翬��,
    to_char(sysdate, 'MM')            AS �����1, --03
    to_char(sysdate, 'MON')           AS �����2, --3��
    to_char(sysdate, 'DD')            AS ��������1,
    to_char(sysdate, 'DDD')           AS ��������2, --80
    to_char(sysdate, 'HH12:MI:SS AM') AS ����ð�
FROM
    dual;

--TO_NUMBER(���ڿ� ������, �νĵ� ���� ����): 
SELECT 1300-'1500','1300'+1500 FROM DUAL; --�ڵ� ����ȯ
--SELECT 1300-'1,500','1300'+1500 FROM DUAL; --���� ����
SELECT TO_NUMBER('1,300','999,999')-TO_NUMBER('1,500','999,999') FROM DUAL; --�ڵ� ����ȯ�� �ȵǴ� ��Ȳ

--SAL �ʵ忡 ','�� '$' ���� ��ȭ ���� ǥ�ø� �ϰ� �ʹٸ�?
--L: ���� ����Ŭ�� ��ġ�� ������ ���� ��ȭ ������ ���󰣴�.
SELECT SAL, TO_CHAR(SAL,'$999,999') AS SAL_$, TO_CHAR(SAL,'L999,999') AS SAL_L FROM EMP;

--TO_DATE(���ڿ� ������, '�νĵ� ��¥ ����'):
SELECT TO_DATE('2018-07-14','YYYY-MM-DD') AS TODATE1, TO_DATE('20230321','YYYY-MM-DD') AS TODATE2 FROM DUAL;

--��¥ ����
--SELECT '2023-03-21'-'2023-02-01' FROM DUAL; --����
SELECT TO_DATE('2023-03-21')-TO_DATE('2023-02-01') FROM DUAL;


--5. NULLó�� �Լ�
--NULL+300 => NULL. ��� �ϸ� 300�� ���ñ�??
--NULL�� �ٸ� �ɷ� �ٲ��ش�. => NVL(������, NULL�� ��� ��ȯ�� ������)
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL(COMM,0), SAL+NVL(COMM,0) FROM EMP;

--NVL2(������, NULL�� �ƴ� ��� ��ȯ�� ������, NULL�� ��� ��ȯ�� ������)
SELECT EMPNO, ENAME, COMM, NVL2(COMM,'O','X'), NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL FROM EMP;


--6. DECODE�Լ� / CASE ��
--DECODE(�˻� ����� �� ������, 
--       ����1, ����1�� ��ġ�� �� ������ ���� 
--       ����2, ����2�� ��ġ�� �� ������ ����)

--1) DECODE �Լ�
--EMP ���̺� ��å�� MANAGER�� ����� �޿��� 10% �λ�,
--SALESMAN�� ����� 5%, ANALYST�� ����� �״��, �������� 3% �λ�� �޿� ���
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upsal
FROM
    emp;
    
--2) CASE ��
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;
    
SELECT
    empno,
    ename,
    job,
    sal,
    CASE
        WHEN comm IS NULL THEN
            '�ش���� ����'
        WHEN comm = 0 THEN
            '���� ����'
        WHEN comm > 0 THEN
            '����: ' || comm
    END AS comm_text
FROM
    emp;
    
--[�ǽ�1]
SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;
    
--[�ǽ�2]
SELECT EMPNO,ENAME,HIREDATE,NEXT_DAY(ADD_MONTHS(HIREDATE,3),'������') AS R_JOB,
CASE WHEN COMM IS NULL THEN 'N/A' ELSE TO_CHAR(COMM) END AS COMM--�� ī�װ� ������ ������ Ÿ���� ���� ����� �� ������ ����.
FROM EMP;

--[�ǽ�3]
--DECODE �Լ� Ȱ��
SELECT EMPNO,ENAME,MGR,
DECODE(SUBSTR(TO_CHAR(MGR),1,2),NULL,'0000','75','5555','76','6666','77','7777','78','8888',SUBSTR(TO_CHAR(MGR),1)) AS CHG_MGR
FROM EMP;
--CASE �� Ȱ��
SELECT EMPNO,ENAME,MGR,
CASE WHEN MGR IS NULL THEN '0000'
WHEN C='75' THEN '5555'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='76' THEN '6666'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='77' THEN '7777'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='78' THEN '8888'
ELSE SUBSTR(TO_CHAR(MGR),1) END AS CHG_MGR
FROM EMP;


--7. ������ �Լ�: SUM, COUNT, MAX, MIN, AVG
SELECT SUM(SAL) FROM EMP;
SELECT SUM(DISTINCT SAL), SUM(ALL SAL), SUM(SAL) FROM EMP;

--COMM�� NULL�� �ִµ��� �ұ��ϰ� �ջ��� �� �ȴ�.
--1) SUM(): NULL�� �˾Ƽ� �����ϰ� �հ踦 �����ش�.
SELECT SUM(COMM) FROM EMP;

--2) COUNT(): NULL�� �˾Ƽ� �����ϰ� ����.
SELECT COUNT(SAL) FROM EMP;
SELECT COUNT(COMM) FROM EMP;
SELECT COUNT(*) FROM EMP; --EMP ���̺��� ���� ������ �� ��?
SELECT COUNT(*) FROM EMP WHERE DEPTNO=30;

--3) MAX(),MIN()
SELECT MAX(SAL) FROM EMP;
SELECT MAX(HIREDATE) FROM EMP WHERE DEPTNO=20; --�μ���ȣ�� 20�� ����� �Ի��� �� ���� �ֽ� �Ի���
SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO=20; --�μ���ȣ�� 20�� ����� �Ի��� �� ���� ������ �Ի���

--4) AVG()
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=30;

--5) GROUP BY: ������� ���ϴ� ���� ���� ���
--��, GROUP BY ���� ���� �͸� SELECT �ȿ� �� �� �ִ�.(SELECT���� Ư�� �Լ��� ������ �Ŵ� GROUP BY���� ����)
--�μ��� SAL ��� ���ϱ�
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=10;
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=20;
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=30;

SELECT AVG(SAL),DEPTNO FROM EMP GROUP BY DEPTNO;

--�μ��� �߰����� ��� ���ϱ�
SELECT AVG(COMM),DEPTNO FROM EMP GROUP BY DEPTNO;

--6) GROUP BY + HAVING: GROUP BY ���� ������ �� �� ����Ѵ�.
--WHERE���� ������: '�׷�ȭ'�� ����� ����� ������ �� HAVING�� ����Ѵ�.
--�� �μ��� ��å�� ��� �޿� ���ϱ�(��, ��� �޿��� 2000 �̻��� �׷츸 ���)
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000 ORDER BY DEPTNO,JOB;

--HAVING ��ſ� WHERE�� ������� ���, �׷� �Լ��� �㰡���� �ʴ´ٰ� ������ ����.
--SELECT DEPTNO, JOB, AVG(SAL) FROM EMP WHERE AVG(SAL)>=2000 GROUP BY DEPTNO,JOB ORDER BY DEPTNO,JOB; 

--WHERE ���� HAVING ���� ���� ���� ���
--���� ����: FROM ���� ���� -> WHERE �� ���� -> GROUP BY ���� -> HAVING �� ���� -> SELECT ���� ���� -> ORDER BY ����
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP WHERE SAL<=3000 GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000 ORDER BY DEPTNO,JOB;


--[�ǽ�4]
--EMP ���̺��� �̿��Ͽ� �μ���ȣ, ��� �޿�, �ְ� �޿�, ���� �޿�, ��� ���� ����Ѵ�.
--��, ��� �޿��� ����� �� �Ҽ����� �����ϰ� �� �μ���ȣ ���� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT 
FROM EMP
GROUP BY DEPTNO;

--[�ǽ�5]
--���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο����� ���
SELECT JOB, COUNT(*) 
FROM EMP
GROUP BY JOB HAVING COUNT(JOB)>=3;

--[�ǽ�6]
--������� �Ի翬���� �������� �μ����� �� ���� �Ի��ߴ��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,DEPTNO,COUNT(*) AS CNT 
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY'),DEPTNO;


--2023.03.22--
--8. ����: ���� ���̺��� �ϳ��� ���̺�ó�� ��� (���� �� �ܰ� ���� �ڳ�)
--1) ��������(inner join): ���� ���̺� ���� ���� ��Ҹ� �̾Ƴ��� ��
--2) �ܺ�����(outer join): left outer join(���� �������� �̾Ƴ�), right outer join(������ �������� �̾Ƴ�), full outer join(���ʿ��� �̾Ƴ�)

--����: DEPT 4��, EMP 12�� => Ư�� ������ ���� ������ 4*12=�� 48����(���� �� �ִ� ��� ������) ���͹�����. => ũ�ν� ����
SELECT * FROM EMP, DEPT ORDER BY EMPNO;

--1) ��������
--ORA-00918: ���� ���ǰ� �ָ��մϴ� => SELECT �ȿ� �� �ִ� DEPTNO�� ���� ���̺��� �ߺ��Ǵ� ����̱� ������ ��� �̾Ƴ��� ���� ������ �߻��ߴ�.
--������ �����ϱ� ���ؼ� �� ��Һ� �տ��ٰ� ��� ���̺� �������� ������ش�.

--�� �����: �� ���� ���� ��ġ�� �� �� ����
SELECT E.EMPNO,E.ENAME,D.DEPTNO,D.DNAME,D.LOC FROM EMP E,DEPT D
WHERE E.DEPTNO=D.DEPTNO; --EMP ���̺��� DEPTNO�� DEPT ���̺��� DEPTNO�� ���ٸ� EMPNO,ENAME,DEPTNO,DNAME,LOC�� ����ϰڴ�.

SELECT E.EMPNO,E.ENAME,D.DEPTNO,D.DNAME,D.LOC FROM EMP E,DEPT D
WHERE E.DEPTNO=D.DEPTNO AND SAL>=3000; --���� �� �߰� ����

--SQL-99 ǥ��
--##JOIN~ON
SELECT E.EMPNO,E.ENAME,D.DEPTNO,D.DNAME,D.LOC 
FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO --ON�� ������ �ִ´�.
WHERE SAL>=3000;

--EMP,DEPT INNER JOIN, �޿��� 2500 �����̰�, �����ȣ�� 9999 ������ ��� ���� ��ȸ
SELECT E.EMPNO,E.ENAME,E.SAL,D.DEPTNO,D.DNAME,D.LOC FROM EMP E,DEPT D
WHERE E.DEPTNO=D.DEPTNO AND SAL<=2500 AND E.EMPNO<=9999;

--SQL-99 ǥ��
--##JOIN~ON
SELECT E.EMPNO,E.ENAME,E.SAL,D.DEPTNO,D.DNAME,D.LOC 
FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
WHERE SAL<=2500 AND E.EMPNO<=9999;

--�� ������: ������ �ش��� �� �� ����
--EMP�� SALGRADE ����
--EMP ���̺��� SAL�� SALGRADE ���̺��� LOSAL�� HISAL ������ ���� ���·� ����
SELECT * FROM EMP E,SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--SQL-99 ǥ��
--##JOIN~ON
SELECT * FROM EMP E JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--SELF JOIN: �ڱ� �ڽ� ���̺�� ����
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2
WHERE E1.MGR=E2.EMPNO;

--2) �ܺ�����
--�� LEFT OUTER JOIN
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME 
FROM EMP E1, EMP E2 --ó���� ������ �� LEFT, ���߿� ������ �� RIGHT
WHERE E1.MGR=E2.EMPNO(+); --�� �Ȱ��Ƶ� ���� ���� �������� �������

--SQL-99 ǥ��
--##JOIN~ON
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME 
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON E1.MGR=E2.EMPNO;

--�� RIGHT OUTER JOIN
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME 
FROM EMP E1, EMP E2 --ó���� ������ �� LEFT, ���߿� ������ �� RIGHT
WHERE E1.MGR(+)=E2.EMPNO; --�� �Ȱ��Ƶ� �������

--SQL-99 ǥ��
--##JOIN~ON
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME 
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON E1.MGR=E2.EMPNO;

--�� FULL OUTER JOIN
--SQL-99 ǥ��
--##JOIN~ON
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME 
FROM EMP E1 FULL OUTER JOIN EMP E2 ON E1.MGR=E2.EMPNO;

--�����ؾ� �� ���̺��� 3���� ��
SELECT * FROM TABLE1 T1,TABLE2 T2,TABLE3 T3
WHERE T1.EMPNO=T2.EMPNO AND T2.DEPTNO=T3.DEPTNO; --�׳� �������ָ� �ȴ�.

--SQL-99 ǥ��
--##JOIN~ON
SELECT * FROM TABLE1 T1 JOIN TABLE2 T2 ON T1.EMPNO=T2.EMPNO 
JOIN TABLE3 T3 ON T2.DEPTNO=T3.DEPTNO;

--[�ǽ�1]: �޿��� 2000 �ʰ��� ������� �μ� ����, ��� ������ ���
SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.SAL FROM EMP E, DEPT D
WHERE D.DEPTNO=E.DEPTNO AND E.SAL>2000 ORDER BY D.DEPTNO;

SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.SAL FROM EMP E JOIN DEPT D ON D.DEPTNO=E.DEPTNO
WHERE E.SAL>2000 ORDER BY D.DEPTNO;

--[�ǽ�2]: �� �μ��� ��� �޿�, �ִ� �޿�, �ּ� �޿�, ��� ���� ����ϴ� SQL���� �ۼ�
SELECT D.DEPTNO,D.DNAME, TRUNC(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL, MIN(E.SAL) AS MIN_SAL, COUNT(E.EMPNO) AS CNT
FROM EMP E, DEPT D WHERE D.DEPTNO=E.DEPTNO GROUP BY D.DEPTNO,D.DNAME ORDER BY D.DEPTNO;

SELECT D.DEPTNO,D.DNAME, TRUNC(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL, MIN(E.SAL) AS MIN_SAL, COUNT(E.EMPNO) AS CNT
FROM EMP E JOIN DEPT D ON D.DEPTNO=E.DEPTNO GROUP BY D.DEPTNO,D.DNAME ORDER BY D.DEPTNO;

--[�ǽ�3]: ��� �μ������� ��������� �Ʒ��� ���� �μ���ȣ, ����̸� ������ �����Ͽ� ���
SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.JOB,E.SAL 
FROM EMP E, DEPT D WHERE E.DEPTNO(+)=D.DEPTNO ORDER BY D.DEPTNO,E.EMPNO;

SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.JOB,E.SAL 
FROM EMP E RIGHT OUTER JOIN DEPT D ON D.DEPTNO=E.DEPTNO ORDER BY D.DEPTNO,E.EMPNO;


--9. ��������: ������, ������, ���߿�
--SQL ���� �����ϴ� �� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���� SQL �� ���ο��� ����ϴ� SELECT ��
--����: SELECT ��ȸ�� �� FROM ���̺�� WHERE ���ǽ�(SELECT ��ȸ�� �� FROM ���̺� WHERE ���ǽ�)

--1) ������ ��������: �������� ����� �ϳ��� �� ��ȯ(�޿�, �߰�����, �Ի���, ��� �޿�)
--������ �޿����� ���� �޿��� �޴� ��� ��ȸ(��������)
--���� JONES �޿� �˾Ƴ���, �˾Ƴ� JONES �޿��� ������ ���ǽ�
SELECT SAL FROM EMP WHERE ENAME='JONES'; --2975
SELECT * FROM EMP WHERE SAL>2975;
--�� �ٷ�
SELECT * FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='JONES');

--����̸��� ALLEN�� ����� �߰����� ���� ���� �߰������� �޴� ��� ��ȸ
SELECT * FROM EMP WHERE COMM>(SELECT COMM FROM EMP WHERE ENAME='ALLEN');

--��� �̸��� WARD�� ����� �Ի��� ���� ���� �Ի��� ��� ��ȸ
SELECT * FROM EMP WHERE HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='WARD');

--20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� �� �μ����� ��ȸ
--�����ȣ, �����, ����, �޿�, �μ���ȣ, �μ���, ����
SELECT E.EMPNO,E.ENAME,E.JOB,E.SAL,D.DEPTNO,D.DNAME,D.LOC
FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
WHERE E.DEPTNO=20 AND E.SAL>(SELECT AVG(SAL) FROM EMP);

--20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� �۰ų� ���� �޿��� �޴� ������� �� �μ����� ��ȸ
--�����ȣ, �����, ����, �޿�, �μ���ȣ, �μ���, ����
SELECT E.EMPNO,E.ENAME,E.JOB,E.SAL,D.DEPTNO,D.DNAME,D.LOC
FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
WHERE E.DEPTNO=20 AND E.SAL<=(SELECT AVG(SAL) FROM EMP);

--2) ������ ��������: �������� ����� ���� ���� �� ��ȯ
--IN, ANY(SOME), ALL, EXISTS ������ ���(������ ���������� ���� ������(=,<=,>=,<>,^=) ��� �Ұ�)
--�� �μ��� �ְ� �޿��� ������ �޿��� �޴� ��� ���� ��ȸ
--�� �μ��� �ְ� �޿�
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO; 
--������ �޿��� �޴� ��� ���� ��ȸ
--SELECT * FROM EMP WHERE SAL=(SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO); --���� �߻�
--IN: �������� ����� �������� ��� �� �ϳ��� ��ġ�ϸ� TRUE
SELECT * FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--30�� �μ� ������� �޿����� ���� �޿��� �޴� ��� ���� ��ȸ
--ANY(SOME): �������� ����� �������� ����� �ϳ� �̻��̸� TRUE
SELECT * FROM EMP WHERE SAL < SOME(SELECT SAL FROM EMP WHERE DEPTNO=30);
SELECT * FROM EMP WHERE SAL < ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);
--�� ����� ������ �����ε� �ۼ��� �� �־���.
SELECT * FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);

--30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���� ��ȸ
--�� ������ ��������
SELECT * FROM EMP WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);
--�� ������ ��������
SELECT * FROM EMP WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);

--ALL: ���������� ��� ����� ���ǽĿ� �¾� �������߸� �������� ���ǽ��� TRUE�� �ȴ�.
SELECT * FROM EMP WHERE SAL < ALL(SELECT SAL FROM EMP WHERE DEPTNO=30); 

--EXISTS: ���������� ������� �ϳ� �̻� �����ϸ� ���ǽ��� ��� TRUE, �������� ������ FALSE
SELECT * FROM EMP WHERE EXISTS(SELECT DNAME FROM DEPT WHERE DEPTNO=10)

--[�ǽ�4]
--��ü ��� �� ALLEN�� ���� ��å�� ������� �������, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT JOB,EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE JOB IN(SELECT JOB FROM EMP WHERE ENAME='ALLEN');

--[�ǽ�5]
--��ü ����� ��� �޿����� ���� �޿��� �޴� ������� �������, �μ�����, �޿� ��� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�.
--��, ����� �� �޿��� ���� ������ �����ϵ� �޿��� ���� ��쿡�� ��� ��ȣ�� �������� ������������ ����
SELECT E.EMPNO,E.ENAME,D.DNAME,E.HIREDATE,D.LOC,E.SAL,S.GRADE 
FROM EMP E,DEPT D,SALGRADE S
WHERE E.DEPTNO=D.DEPTNO and e.sal between s.losal and s.hisal and E.SAL>(SELECT AVG(SAL) FROM EMP) ORDER BY e.SAL desc,e.EMPNO;

--3) ���߿� ��������: ���������� SELECT ������ ���� �����͸� ���� �� ����
SELECT * FROM EMP WHERE (DEPTNO,SAL) IN (SELECT deptno,MAX(SAL) FROM EMP GROUP BY DEPTNO);

--4) FROM ���� ����ϴ� ��������(�ζ��� ��)
--FROM ���� ���� ���̺��� ����ؼ� ����ϱ⿡�� ���̺� �� ������ �Ը� Ŭ �� Ȥ�� ���ʿ��� ���� ���� �� ����.
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO=10) E10, --�μ���ȣ�� 10���� �ֵ鸸 ������ DEPT�� ����
     (SELECT * FROM DEPT) D 
WHERE E10.DEPTNO=D.DEPTNO;

--5) ��Į�� ��������: SELECT ���� ����ϴ� ��������
--SELECT ���� ����ϴ� ���������� �ݵ�� �ϳ��� ����� ��ȯ�ؾ� �Ѵ�.
SELECT EMPNO, ENAME, JOB, SAL, 
(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE, 
DEPTNO,(SELECT DNAME FROM DEPT WHERE E.DEPTNO=DEPT.DEPTNO) AS DNAME
FROM EMP E;

--[�ǽ�6]
--10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� �������, �μ� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.JOB NOT IN(SELECT JOB FROM EMP WHERE DEPTNO=30) AND E.DEPTNO=10;

--[�ǽ�7]
--��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� �������, �޿���� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�.
--��, ���������� Ȱ���� �� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.
--�� ������ ������ �ۼ�
SELECT E.EMPNO,E.ENAME,E.SAL,S.GRADE 
FROM EMP E, SALGRADE S 
WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.SAL>(SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN')
ORDER BY E.EMPNO;
--�� ������ ������ �ۼ�
SELECT E.EMPNO,E.ENAME,E.SAL,S.GRADE 
FROM EMP E, SALGRADE S 
WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.SAL>ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN')
ORDER BY E.EMPNO;
--�� ��Į�� ���������� �ۼ�
SELECT E.EMPNO,E.ENAME,E.SAL,(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) GRADE
FROM EMP E
WHERE E.SAL>(SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN')
ORDER BY E.EMPNO;


--2023.03.23--
--10. DML(DATA MANIPULATION LANGUAGE): �����͸� �߰�(INSERT), ����(UPDATE), ����(DELETE)�ϴ� ������ ���۾�
--SELECT + DML => ���� ����ϴ� SQL ����
--COMMIT: DML �۾��� �����ͺ��̽��� ���� �ݿ����ּ���.
--ROLLBACK: ���ݱ��� �����ߴ� DML �۾��� ����ҰԿ�.

--������ ���̺� ����
--���� ���̺� ����
CREATE TABLE DEPT_TEMP AS SELECT *FROM DEPT; --DEPT TABLE COPY ON DEPT_TEMP
DROP TABLE DEPT_TEMP; --TABLE DELETE

--1) INSERT INTO ���̺��(���̸�1, ���̸�2.....) VALUES(������1, ������2.....);
--���̸� �ۼ��� ���û���

--DEPT_TEMP�� ���ο� �μ�(50��) �߰��ϱ�
INSERT INTO DEPT_TEMP(DEPTNO,DNAME,LOC) VALUES(50,'DATABASE','SEOUL');

--�� �̸� ����
INSERT INTO DEPT_TEMP VALUES(60,'NETWORK','BUSAN');

--����1: �� ���� ���� ������ ��ü �ڸ������� ū ���� ���˴ϴ�.
--INSERT INTO DEPT_TEMP VALUES(600,'NETWORK','BUSAN');

--����2: ��ġ�� �������մϴ�.
--INSERT INTO DEPT_TEMP VALUES('NO','NETWORK','BUSAN'); --�ƿ� ���ڶ� ���þ��� ���ڴ� �ڵ� ����ȯ �� ��
INSERT INTO DEPT_TEMP VALUES('60','NETWORK','BUSAN'); --������ ���ڴ� ���ڷ� �ڵ� ����ȯ ��

--����3: ���� ���� ������� �ʽ��ϴ�.
--INSERT INTO DEPT_TEMP VALUES(70,'NETWORK');

--NULL �Էµ� ����
INSERT INTO DEPT_TEMP VALUES(80,'WEB',NULL);
INSERT INTO DEPT_TEMP VALUES(90,'MOBILE','');

--������ ��� ���õ� ����. ��, ���� �� ��ü Į���� �������� �ʴ´ٸ� � ���鸸 ���� ������ ���̸�(�ʵ��)�� �ʼ��� �ۼ��ؾ� �Ѵ�.
--** �ʵ���� ���̺� ������� �ۼ��ؾ� �Ѵ�.
INSERT INTO DEPT_TEMP(DEPTNO,LOC) VALUES(91,'INCHEON');

--EMP_TEMP ����(EMP ���̺� ����-�����ʹ� �����ϰ� ����)
CREATE TABLE EMP_TEMP AS SELECT *FROM EMP WHERE 1<>1;

--������ ���� �߰�
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(1111,'������','MANAGER',9999,'2002-01-05',4000,NULL,20);

--��¥ �Է� �� ��/��/�� ���� => ��/��/�� ����
--����4: ��¥ ������ ������ ���ʿ��� �����Ͱ� ���ԵǾ� �ֽ��ϴ�.
--INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
--VALUES(2222,'�̼���','MANAGER',9999,'07/01/2001',4000,NULL,20);

--TO_DATE() ����Ͽ� ����4 �ذ�
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(2222,'�̼���','MANAGER',9999,TO_DATE('07/01/2001','DD/HH/YYYY'),4000,NULL,20);

--SYSDATE ���
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(3333,'�ɺ���','MANAGER',9999,SYSDATE,4000,NULL,30);

--���������� INSERT ����
--EMP, SALGRADE ���̺��� ���� �� �޿� ����� 1�� ����� EMP_TEMP�� �߰�
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
SELECT E.EMPNO,E.ENAME,E.JOB,E.MGR,E.HIREDATE,E.SAL,E.COMM,E.DEPTNO --EMP_TEMP�� �� ������ �����־�� �Ѵ�.
FROM EMP E,SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE=1;

--1209~1264������ �۾��� ��� �ݿ��ϰ� ������
SELECT * FROM EMP_TEMP; COMMIT;

--2) UPDATE : ���̺� �ִ� ������ ����
--UPDATE ���̺�� SET ������ ���̸� = ������, ������ ���̸� = ������..... WHERE ������ ���� ��� ���� �����ϱ� ���� ����

--DEPT_TEMP LOC ���� ��� ���� SEOUL�� ����
UPDATE dept_temp SET LOC='SEOUL';

ROLLBACK; --���� �� ������ COMMIT �ϱ� ���̶� �ѹ��� �����ߴ�.

--�����͸� �Ϻκи� �����ϰ� ���� ���� WHERE ���� ����Ѵ�.
--DETP_TEMP �μ���ȣ�� 40���� LOC ���� ���� SEOUL�� ����
UPDATE dept_temp SET LOC='SEOUL' WHERE DEPTNO=40;

--DETP_TEMP �μ���ȣ 80���� DNAME�� SALES, LOC�� CHICAGO�� ���� 
UPDATE dept_temp SET DNAME='SALES',LOC='CHICAGO' WHERE DEPTNO=80;

--EMP_TEMP ����� �߿��� �޿��� 2500 ������ ����� �߰������� 50���� ����
UPDATE emp_temp SET COMM=50 WHERE SAL<=2500;

--���������� ����Ͽ� ������ ����
--DEPT ���̺��� 40�� �μ��� DNAME, LOC�� DEPT_TEMP 40�� �μ��� DNAME, LOC�� ������Ʈ�ϰ� �ʹ�.
UPDATE DEPT_TEMP 
SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO=40)
WHERE DEPTNO=40;

COMMIT;

--3) DELETE: ���̺� �ִ� ������ ����
--DELETE FROM(���û���)���̺�� WHERE ���� �����͸� �����ϱ� ���� ���ǽ� 
CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;

--Ư�� JOB�� ���� ��� ����
DELETE FROM EMP_TEMP2 WHERE JOB='MANAGER';

DELETE EMP_TEMP2 WHERE JOB='SALESMAN';

--��ü ������ ����
DELETE EMP_TEMP2;

ROLLBACK;

--���������� ����Ͽ� ����
--�޿� ����� 3����̰�, 30�� �μ��� ��� ����
DELETE EMP_TEMP2 WHERE EMPNO IN
(SELECT E.EMPNO FROM EMP_TEMP2 E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE=3 AND E.DEPTNO=30);

COMMIT;


--[�ǽ�1]
--�ǽ��� ���Ͽ� ���� ���̺��� �̿��Ͽ� ���̺��� �����Ѵ�.
--�� EMP ���̺��� ������ �̿��Ͽ� EXAM_EMP ����
--�� DEPT ���̺��� ������ �̿��Ͽ� EXAM_DEPT ����
--�� SALGRADE ���̺��� ������ �̿��Ͽ� EXAM_SALGRADE ����
CREATE TABLE EXAM_EMP AS SELECT *FROM EMP WHERE 1<>1;
CREATE TABLE EXAM_DEPT AS SELECT *FROM DEPT WHERE 1<>1;
CREATE TABLE EXAM_SALGRADE AS SELECT *FROM SALGRADE WHERE 1<>1;

--[�ǽ�2]
--������ ������ EXAM_EMP ���̺� �Է��Ͻÿ�.
INSERT INTO EXAM_EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500,NULL,50);
INSERT INTO EXAM_EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,NULL,50);
INSERT INTO EXAM_EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400,NULL,60);
INSERT INTO EXAM_EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (7204,'TEST_USER4','SLAESMAN',7201,'2016-05-31',2700,300,60);
INSERT INTO EXAM_EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (7205,'TEST_USER5','CLERK',7201,'2016-07-20',2600,NULL,70);
INSERT INTO EXAM_EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600,NULL,70);
INSERT INTO EXAM_EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300,NULL,80);
INSERT INTO EXAM_EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (7208,'TEST_USER8','STUDENT',7201,'2018-03-09',1200,NULL,80);

--[�ǽ�3] 
--EXAM_EMP�� ���� ��� �� 50�� �μ����� �ٹ��ϴ� ������� ��� �޿����� ���� �޿��� �ް� �ִ� ������� 70�� �μ��� �ű�� SQL �� �ۼ��ϱ�
UPDATE exam_emp SET DEPTNO=70 WHERE SAL>(SELECT AVG(SAL) FROM exam_emp WHERE DEPTNO=50);

--[�ǽ�4] 
--EXAM_EMP�� ���� ��� �� 60�� �μ��� ��� �߿��� �Ի����� ���� ���� ������� �ʰ� �Ի��� ����� �޿��� 10% �λ��ϰ� 80�� �μ��� �ű�� SQL �� �ۼ��ϱ�
UPDATE EXAM_EMP SET DEPTNO=80, SAL=SAL*1.1 
WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM EXAM_EMP WHERE DEPTNO=60);

--[�ǽ�5] 
--EXAM_EMP�� ���� ��� ��, �޿� ����� 5�� ����� �����ϴ� SQL���� �ۼ��ϱ�
DELETE EXAM_EMP WHERE EMPNO IN
(SELECT E.EMPNO FROM EXAM_EMP E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE=5);

COMMIT;


--11. TRANSACTION: �ּ� ���� ����
--Ʈ������� �����ϴ� ��ɾ� TCL(Transaction Control Language): COMMIT, ROLLBACK
CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;

--DML ����(3���� �ϳ��� Ʈ��������� ������.)
INSERT INTO DEPT_TCL VALUES(50,'DATABASE','SEOUL');
UPDATE DEPT_TCL SET LOC='BUSAN' WHERE DEPTNO=40;
DELETE FROM DEPT_TCL WHERE DNAME='RESEARCH';

SELECT * FROM DEPT_TCL;

--Ʈ����� ���
ROLLBACK;

--Ʈ����� ���� �ݿ�
COMMIT;

--SESSION: � Ȱ���� ���� �ð��̳� �Ⱓ
--DATABASE SESSION: �����ͺ��̽� ������ �������� ���� �۾��� ������ �� ������ �����ϴ� �ͱ���
--LOCK: ���(���� ���� ������ ���� ����) => SQL DEVELOPER���� ���� �ۼ��� ���� COMMIT�ϱ� �������� SQL PLUS�� �ۼ��� ���� ������� �ʰ� ���Ÿ�� �ִ�.
DELETE FROM DEPT_TCL WHERE DEPTNO=40; --���� COMMIT�� ���� �ʾƼ� SQL PLUS���� �����Ͱ� �ݿ����� �ʾҴ�.

COMMIT;

UPDATE DEPT_TCL SET LOC='SEOUL' WHERE DEPTNO=30;

COMMIT;


--2023.03.27
--DDL: ������ ���Ǿ�(������ ���̽� ��ü ����, ����, ����) VS DML
--1. ���̺� ����: CREATE TABLE ���̺��(���̸�1 �ڷ���, ���̸�2 �ڷ���....);

--<���̺� ����, ���̸� ���� ��Ģ> 
--1) ���̺�(��) �̸��� ���ڷ� �����Ѵ�.
--2) ���̺�(��) �̸��� 30BYTE ���Ϸ� �ۼ��Ѵ�.
--3) ���� ����� ������ ���̺�(��) �̸��� �ߺ��� �� ����.
--4) ���̺��(���̸�)�� ����� �� �ִ� Ư�����ڴ� '$, #, _' �����ϴ�.
--5) SQL Ű����(SELECT, FROM, WHERE...)�� ���̺��(���̸�)�� ����� �� ����.

--<�ڷ��� ����>
--1) ���� 
--VARCHAR2(����): ���� ���� ���ڿ� ������ ����, �ִ� 4000BYTE���� ����
--CHAR(����): ���� ���� ���ڿ� ������ ����
--NCHAR(����): UNICODE�� ���� ���� ���� ������ ����
--=>'NAME' CHAR(10): ����� 10��, �ѱ��� 3�� => �޸� 10BYTE ����
--=>'NAME' NCHAR(10): ����� 10��, �ѱ۵� 10�� => �޸� 10BYTE ����
--NVARCHAR2(����): UNICODE�� ���� ���� ���� ������ ����
--=> 'NAME' VARCHAR2(10): ����� 10��, �ѱ��� 3�ڱ��� �Է�
--=> 'NAME' NVARCHAR2(10): ����� 10��, �ѱ۵� 10�ڱ��� �Է�
--2) ����
--NUMBER(��ü �ڸ���, �Ҽ��� ���� �ڸ���)
--3) ��¥
--DATE: ��¥, �ð� ����
--TIMESTAMP
--4) ��Ÿ
--BLOB: ��뷮 ���� ������(�̹���, ������, �Ҹ� ��) ����
--CLOB: ��뷮 �ؽ�Ʈ ������ ����
--JSON: JSON ������ ����

CREATE TABLE EMP_DDL(
EMPNO NUMBER(4), --����� ���� �� 4�ڸ��� �����ϰڴ�.
ENAME VARCHAR2(10), --������� �� 10BYTE�� �����ϰڴ�.
JOB VARCHAR2(9), --������ �� 9BYTE�� �����ϰڴ�.
MGR NUMBER(4), --�Ŵ��� ��ȣ
HIREDATE DATE, --�ð�, ��¥ ����
SAL NUMBER(7,2), --�޿��� ��ü 7�ڸ��� ����(�Ҽ��� 2�ڸ����� ���)
COMM NUMBER(7,2), --�߰�����
DEPTNO NUMBER(2) --�μ���ȣ
);

DESC EMP_DDL;

--2. ���̺� ����: ALTER
--1) �� �߰�: ADD
ALTER TABLE EMP_TEMP2 ADD HP VARCHAR2(20);
--2) �� �̸� ����: RENAME
ALTER TABLE EMP_TEMP2 RENAME COLUMN HP TO TEL;
--3) �� �ڷ���, ���� ����: MODIFY
ALTER TABLE EMP_TEMP2 MODIFY EMPNO NUMBER(5);
--4) Ư�� ���� ����: DROP
ALTER TABLE EMP_TEMP2 DROP COLUMN TEL;

--3. ���̺�� ����: RENAME
RENAME EMP_TEMP2 TO EMP_RENAME;

--4. ���̺� ����
--1) ���̺� ������ ��ü ����(���̺� ������ ���� �ִ�.)
--DELETE FROM EMP_RENAME; --DML�� ROLLBACK�� �����ϴ�.
--ROLLBACK;

TRUNCATE TABLE EMP_RENAME; --DDL�� ROLLBACK�� �Ұ����ϴ�.
--2) ���̺� ����: DROP(���̺� ������ ���� �� �����ȴ�.)
DROP TABLE EMP_RENAME;


--[�ǽ�1]: MEMBER TABLE �ۼ�
CREATE TABLE MEMBER(
ID CHAR(8),
NAME VARCHAR2(10),
ADDR VARCHAR2(50),
NATION CHAR(4),
EMAIL VARCHAR2(50),
AGE NUMBER(7,2)
);

--[�ǽ�2]: MEMBER ���̺� ����
--member ���̺� BIGO �� �߰��ϱ�
--[����] ������ ���ڿ�, ���̴� 20
ALTER TABLE MEMBER ADD BIGO VARCHAR2(20);

--member ���̺��� BIGO �� ũ�⸦ 30���� �����ϱ�
ALTER TABLE MEMBER MODIFY BIGO VARCHAR2(30);

--member ���̺��� BIGO �� �̸��� REMARK�� �����ϱ�
ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;

DROP TABLE MEMBER;

--�Ʒ� ������ ������ �� �ߵ��� MEMBER ���̺� ����� 
INSERT INTO MEMBER VALUES('HONG1234','ȫ�浿','����� ���α� ������','���ѹα�','HONG1234@NAVER.COM',25);

CREATE TABLE MEMBER(
ID CHAR(8),
NAME VARCHAR2(10),
ADDR VARCHAR2(50),
NATION NCHAR(4),
EMAIL VARCHAR2(50),
AGE NUMBER(7,2)
);


--5. ������ ���̽� ��ü: ���̺�, �ε���, ��, ������ ����, ������, �ó��, ���ν���, �Լ�, ��Ű��, Ʈ����
--����: CREATE, ����: ALTER, ����: DROP


--6. �ε���: �� ���� �˻��� ������, ����ڰ� ���� Ư�� ���̺� ���� ���� ����, �⺻Ű(Ȥ�� UNIQUE KEY)�� �����ϸ� �ε����� ����
--1) INDEX ����: CREATE INDEX �ε����� ON ���̺��(�ε����� ����� ���̸�)
CREATE INDEX IDX_EMP_SAL ON EMP(SAL); --EMP ���̺��� SAL ���� �ε����� ����
--2) SELECT�� �˻����
--FULL SCAN
SELECT * FROM EMP; --��ȹ������ ������ FULL SCAN�� �Ѵ�.
--INDEX SCAN
SELECT * FROM EMP WHERE EMPNO=7900; --��ħ EMPNO�� INDEX���� UNIQUE SCAN���� ��ȹ ������ �ݼ� ������.
--3) INDEX ����
DROP INDEX IDX_EMP_SAL;


--7. VIEW: ���� ���̺�
--CREATE[OR REPLACE] [FORCE | NOFORCE] VIEW ���̸�(���̸�1, ���̸�2....) AS (������ SELECT ����)
--[WITH CHECK OPTION]
--[WITH READ ONLY]: �� ���� �� �б⸸ ����
CREATE VIEW VM_EMP_READ
AS SELECT EMPNO, ENAME, JOB FROM EMP WITH READ ONLY;

--1) ����: SELECT ���� ���⵵�� ��ȭ�ϱ� ���� ����Ѵ�.
--�� ���������� ���: �ڿ� ���� FROM�� ���������� ������ �ʹ� ����� �� VIEW�� ����Ѵ�.
--SELECT * FROM(SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=20);
CREATE VIEW VM_EMP20 AS (SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=20);

--2) ���ȼ�: ���̺��� Ư�� ���� �����ϰ� ���� ���� �� ����Ѵ�. 
--3) ������ ���� �� ���
SELECT * FROM VM_EMP20;
--4) ������ ���� �� ����
DROP VIEW VM_EMP20;

--5) VIEW�� INSERT �۾��� �����Ѱ�?
INSERT INTO VM_EMP20 VALUES(8888,'KIM','SALES',20); 
--���� ������ �Ͼ
SELECT * FROM EMP;

--6) ����: �б� ���� ��(READ ONLY)������ DML �۾��� ������ �� �����ϴ�.
INSERT INTO VM_EMP_READ VALUES(9999,'KIM','SALES');

--7) �ζ��� ��: ��ȸ������ ���� ����ϴ� ��
--ROWNUM: ��ȸ�� ������� �Ϸù�ȣ�� �ű��.
SELECT ROWNUM, E.* FROM EMP E;

--�޿� ���� 3�� ��ȸ
SELECT ROWNUM, E.* FROM(SELECT * FROM EMP E ORDER BY SAL DESC) E
WHERE ROWNUM<=3;


--8. ������: ��Ģ�� ���� �ڵ����� ���� ����
--CREATE SEQUENCE ��������; => ���� ���ϴ� �͵��� �� �⺻������ ���õȴ�.

--(�⺻�� �ƴ�)CREATE SEQUENCE �������� 
--[INCREMENT BY ����] => �⺻�� 1
--[START WITH ����] => �⺻�� 1
--[MAXVALUE ���� | NOMAXVALUE] => �ִ밪�� 90���� ����
--[MINVALUE ���� | NOMINVALUE] 
--[CYCLE | NOCYCLE] => CYCLE�� ��� MAXVALUE�� ���� �ٴٸ��� ���۰����� �ٽ� �����Ѵ�.
--[CACHE ���� | NOCACHE] => �������� ������ ��ȣ�� �̸� �޸𸮿� �Ҵ��� ���´�.(�⺻��: CACHE 20)
CREATE TABLE DEPT_SEQUENCE AS SELECT * FROM DEPT WHERE 1<>1;

CREATE SEQUENCE SEQ_DEPT_SEQUENCE 
INCREMENT BY 10 --10�� ����
START WITH 10 --���� ���� 10
MAXVALUE 90 --�ִ� 90���� ����
MINVALUE 0
NOCYCLE
CACHE 2; ���� 2�� ���� �־���

--������ ���: ������ �̸�.CURRVAL(���������� ������ ������ ��ȸ: ���� ������ �������� �����Ǿ���?), ������ �̸�.NEXTVAL(������ �ϳ��� ����)

--�μ���ȣ �Է� �� ������ ���
INSERT INTO DEPT_SEQUENCE(DEPTNO,DNAME,LOC) VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL,'DATABASE','SEOUL');

SELECT * FROM DEPT_SEQUENCE;

--������ SEQ_DEPT_SEQUENCE.NEXTVAL EXCEEDS MAXVALUE: NONCYCLE �������� �����߱� ������ ��ȣ�� ��ȯ���� �ʴ´�.

--������ ����
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

--CYCLE�� �پ 97���� ���ư� ������ �ٽ� 0���� �����Ѵ�.
CREATE SEQUENCE SEQ_DEPT_SEQUENCE INCREMENT BY 3
START WITH 10 MAXVALUE 99 MINVALUE 0 CYCLE CACHE 2; 

--�׳� 1�� ������Ű�� �������� �ڿ� ���� �ƹ��͵� �� ���̸� �ȴ�.
CREATE SEQUENCE SEQ_DEPT_SEQUENCE;


--9. SYNONYM(���Ǿ�): ���̺�, ��, ������ �� ��ü �̸� ��� ����� �� �ִ� �ٸ� �̸��� �ο��ϴ� ��ü
--EMP ���̺��� ��Ī�� E�� ����
CREATE SYNONYM E FOR EMP;

--PUBLIC: ���Ǿ �����ͺ��̽� �� ��� ����ڰ� ����� �� �ֵ��� ����
--CREATE [PUBLIC] SYNONYM E FOR EMP;
SELECT * FROM EMP;
SELECT * FROM E;

DROP SYNONYM E;


--[�ǽ�3]: ���� SQL���� �ۼ��Ͻÿ�.
--1) EMP ���̺�� ���� ������ �����͸� �����ϴ� EMPIDX ���̺��� �����Ͻÿ�.
CREATE TABLE EMPIDX AS SELECT * FROM EMP;

--2) ������ EMPIDX ���̺��� EMPNO ���� IDX_EMPIDX_EMPNO �ε����� �����Ͻÿ�.
CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(EMPNO);

--������ ���� �並 ���� ������ �ε��� ����Ʈ Ȯ��
SELECT * FROM USER_INDEXES;

--[�ǽ�4]: �ǽ�1���� ������ EMPIDX ���̺��� ������ �� �޿��� 1500 �ʰ��� ����鸸 ����ϴ� EMPIDX_OVER15K �並 �����Ͻÿ�.
--�����ȣ, ����̸�, ��å, �μ���ȣ, �޿�, �߰����� ���� ������ �ִ�.
CREATE VIEW EMPIDX_OVER15K AS (SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, COMM FROM EMPIDX WHERE SAL>1500);

--[�ǽ�5]: ���� SQL���� �ۼ��Ͻÿ�.
--1) DEPT ���̺�� ���� ���� �� ������ ������ DEPTSEQ ���̺��� �ۼ��Ͻÿ�.
CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;

--2) ������ DEPTSEQ ���̺��� DEPTNO ���� ����� �������� �Ʒ��� ���õ� Ư���� ���� ������ ���ÿ�.
CREATE SEQUENCE DEPTSEQ_DEPTNO_SEQUENCE 
INCREMENT BY 1 --1�� ����
START WITH 1 --���۰��� 1
MAXVALUE 99 --�ִ� 99���� ����
MINVALUE 1
NOCYCLE
NOCACHE;

--������ ���� �並 ���� ������ ������ ����Ʈ Ȯ��
SELECT * FROM USER_SEQUENCES;


--10. ��������(*ǥ�ô� ���� ����ϴ� �ֿ� ��������)
--���̺��� Ư�� ���� ����
--NULL ���/�����, ���ϰ�, ���ǽ��� �����ϴ� �����͸� �Է� ����....
--������ ���Ἲ(������ ��Ȯ��, �ϰ���) ���� => DML �۾� �� ���Ѿ� �Ѵ�.
--���� ���Ἲ, ��ü ���Ἲ, ���� ���Ἲ
--���̺� ���� �� �������� ����, Ȥ�� ���̺� ���� �Ŀ� ALTER�� ���ؼ� �������� �߰��� ���� ����

--1) *NOT NULL: �� ��� �Ұ�
--����ڷκ��� �Է°��� �ʼ��� �ԷµǾ�� �� �� ����Ѵ�.
CREATE TABLE TABLE_NOTNULL(
LOGIN_ID VARCHAR2(20) NOT NULL,
LOGIN_PASSWORD VARCHAR2(20) NOT NULL,
TEL VARCHAR2(20)
);

INSERT INTO TABLE_NOTNULL(LOGIN_ID,LOGIN_PASSWORD) VALUES('HONG123','HONG123');

SELECT * FROM TABLE_NOTNULL;

--����: NULL�� ("SCOTT"."TABLE_NOTNULL"."LOGIN_PASSWORD") �ȿ� ������ �� �����ϴ�.
--INSERT INTO TABLE_NOTNULL(LOGIN_ID,LOGIN_PASSWORD,TEL) VALUES('HONG123',NULL,'010-1234-1234');

--������ ��ü �������� ����Ʈ ��ȸ
SELECT * FROM USER_CONSTRAINTS;

--��������+���� �������Ǹ� ����
CREATE TABLE TABLE_NOTNULL2(
LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LOGIN_NN NOT NULL,
LOGIN_PASSWORD VARCHAR2(20) CONSTRAINT TBLNN2_LGPWD_NN NOT NULL,
TEL VARCHAR2(20)
);

--�̹� ������ ���̺� �������� �߰�: �̹� ���Ե� �����͵� üũ ����� �Ǳ� ������ ������ �� �� �ִ�.
--����: (SCOTT.) ������� ���� �Ұ� - �� ���� �߰ߵǾ����ϴ�. => �̹� TEL�� NULL�� �����Ͱ� �� �ֱ� ������ NOT NULL�� �ο����� ���Ѵ�.
ALTER TABLE TABLE_NOTNULL MODIFY(TEL NOT NULL);
--TEL�� NULL�� ���� �����ϰ� ���������� �߰��ϸ� �ȴ�.
UPDATE TABLE_NOTNULL SET TEL='010-1234-1234' WHERE LOGIN_ID='HONG123';
--���� �ƿ� ó������ ���������� �����ϰ� �����ϴ� ���� ���� ����ϴ�.
ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL CONSTRAINT TBLNN2_TEL_NN NOT NULL);

--�������Ǹ� ����
ALTER TABLE TABLE_NOTNULL2 RENAME CONSTRAINT TBLNN2_TEL_NN TO TBLNN3_TEL_NN;

--�������Ǹ� ����
ALTER TABLE TABLE_NOTNULL2 DROP CONSTRAINT TBLNN3_TEL_NN;

--2) UNIQUE: �ߺ����� �ʴ� ��(���̵�, ��ȭ��ȣ) => NULL�̵� ���� �������. �ߺ������� ������ ��.
CREATE TABLE TABLE_UNIQUE(
LOGIN_ID VARCHAR2(20) UNIQUE,
LOGIN_PASSWORD VARCHAR2(20) NOT NULL,
TEL VARCHAR2(20)
);

--LOGIN_ID�� �ߺ��� ��Ȳ�� ��(�ѹ� �� �߰��Ϸ��� �ϸ�) ��Ÿ���� ����: ���Ἲ ���� ����(SCOTT.SYS_C008366)�� ����˴ϴ�.
--NULL ������ ���� ���� �����ϴ�. ���̵� NULL�� �ߴ��� ������ �ν����� ���Ѵ�.
INSERT INTO TABLE_UNIQUE(LOGIN_ID,LOGIN_PASSWORD,TEL) VALUES(NULL,'HONG123','010-1234-1234');

SELECT * FROM TABLE_UNIQUE;

--3) *PRIMARY KEY(PK): UNIQUE + NOT NULL => �ߺ��� ������� �ʰ�, NULL�� ������� �ʴ´�. �ٸ� ���� �����Ǳ� ����.
--PRIMARY KEY�� INDEX�� �ڵ����� �����ȴ�.
CREATE TABLE TABLE_PRIMARY(
LOGIN_ID VARCHAR2(20) PRIMARY KEY,
LOGIN_PASSWORD VARCHAR2(20) NOT NULL,
TEL VARCHAR2(20)
);

--����: NULL�� ("SCOTT"."TABLE_PRIMARY"."LOGIN_ID") �ȿ� ������ �� �����ϴ�.
--INSERT INTO TABLE_PRIMARY(LOGIN_ID,LOGIN_PASSWORD,TEL) VALUES(NULL,'HONG123','010-1234-1234');

--����: �� ��° �߰��Ϸ��� �ϴ� ���Ἲ ���� ����(SCOTT.SYS_C008368)�� ����˴ϴ�.
--INSERT INTO TABLE_PRIMARY(LOGIN_ID,LOGIN_PASSWORD,TEL) VALUES('HONG123','HONG123','010-1234-1234');

--4) *FOREIGN KEY(FK): �ܷ�Ű. �ٸ� ���̺� �� ���踦 �����ϴµ� ����Ѵ�. Ư�� ���̺�(DEPT)���� PRIMARY KEY ���������� ������ ��(DEPTNO)�� �ٸ� ���̺�(EMP)�� Ư�� ��(DEPTNO)���� �����Ѵ�.
--��� �߰� �� DEPTNO �Է��� �� �� DEPT ���̺��� DEPTNO�� ������ �� �� �ִ�.
--REFERENCES ������ ���̺��(������ ��): �ܷ�Ű ���� ��� 
--�θ� ���̺�(������ ���̺�)
CREATE TABLE DEPT_FK(
DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);
--�ڽ� ���̺�
CREATE TABLE EMP_FK(
EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO));

--����: ���Ἲ ��������(SCOTT.EMPFK_DEPTNO_FK)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�.
--INSERT INTO EMP_FK VALUES(1000, 'TEST', 'SALES', 10);

--�ܷ�Ű ���� ����:
--�θ� ���̺� �����Ͱ� �����͸� ���� �Է��ؾ� �ڽ� ���̺��� �������� ������ �� �� �ִ�.
--���� �ÿ��� �ڽ� ���̺� �����͸� ���� ������ ��, �θ� ���̺� �����͸� �����ؾ� �Ѵ�.
INSERT INTO DEPT_FK VALUES(10,'DATABASE','SEOUL'); --�θ� ���̺� �߰�
INSERT INTO EMP_FK VALUES(1000, 'TEST', 'SALES', 10); --�ڽ� ���̺� �߰�

DELETE FROM EMP_FK WHERE DEPTNO=10; --�ڽ� ���̺� ����
DELETE FROM DEPT_FK WHERE DEPTNO=10; --�θ� ���̺� ����

--�ܷ�Ű �������� �߰� �ɼ�:
--ON DELETE CASCADE: �θ� �����Ǹ� �θ� �����ϴ� �ڽ� ���ڵ嵵 ���� �����ȴ�.
--ON DELETE SET NULL: �θ� �����Ǹ� �θ� �����ϴ� �ڽ� ���ڵ��� ���� NULL�� ����ȴ�.
CREATE TABLE DEPT_FK2(
DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK2 PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);

CREATE TABLE EMP_FK2(
EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK2 PRIMARY KEY,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK2 REFERENCES DEPT_FK2(DEPTNO) ON DELETE CASCADE);

INSERT INTO DEPT_FK2 VALUES(10,'DATABASE','SEOUL');
INSERT INTO EMP_FK2 VALUES(1000, 'TEST', 'SALES', 10);
--ON DELETE CASCADE�� ���� �ڽ� ���̺�(���)�� ���� �������� �ʰ� �θ� ���̺�(���� ��)���� �����ص� ������ �� ����.
DELETE FROM DEPT_FK2 WHERE DEPTNO=10;

--5) CHECK: ���� ������ �� �ִ� ���� ���� �Ǵ� ���� ���� => EX) ��й�ȣ�� 3�ڸ����� Ŀ�� �Ѵ�.
CREATE TABLE TABLE_CHECK(
LOGIN_ID VARCHAR2(20) PRIMARY KEY,
LOGIN_PASSWORD VARCHAR2(20) CHECK(LENGTH(LOGIN_PASSWORD)>3),
TEL VARCHAR2(20)
);

INSERT INTO TABLE_CHECK VALUES('TEST','1234','010-1234-1234');

--6) *DEFAULT: �⺻�� ���� => ����ڰ� ���� �������� �ʾ��� �� �⺻�� ����
CREATE TABLE TABLE_DEFAULT(
LOGIN_ID VARCHAR2(20) PRIMARY KEY,
LOGIN_PASSWORD VARCHAR2(20) DEFAULT '1234',
TEL VARCHAR2(20)
);

INSERT INTO TABLE_DEFAULT VALUES('TEST',NULL,'010-1234-1234');
INSERT INTO TABLE_DEFAULT(LOGIN_ID, TEL) VALUES('TEST1','010-1234-5678'); --����� �� ������ �ڵ������� '1234' �Էµ�.

SELECT * FROM TABLE_DEFAULT;
COMMIT;