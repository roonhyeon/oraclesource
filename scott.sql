--scott

--describe emp(employee): emp table 구성 보기 => 필드명(열이름)(EMPNO:사원번호)  제약조건(NOT NULL)  데이터타입(NUMBER(4))
--ENAME(사원명), JOB(직책), MGR(직속상관 번호), HIREDATE(입사일), SAL(급여), COMM(수당), DEPTNO(부서번호)
--NUMBER: 소수점 자릿수를 포함해서 지정할 수 있다.(숫자인 것만)
--NUMBER(4): 4자리 숫자까지 허용, NUMBER(8,2): 전체 자릿수는 8자리이고 소수점 2자리를 포함한다.
--VARCHAR2: 가변형 문자열 저장
--VARCHAR2(10): 10byte 문자까지 저장할 수 있다.
--DATE: 날짜 데이터
DESC emp;

--DEPTNO(부서번호) DNAME(부서명), LOC(부서위치)
DESC dept;

--GRADE(급여등급), LOSAL(최소 급여액), HISAL(최대 급여액)
DESC salgrade;

--*****select: 데이터 조회
--조회방식: selection(행 단위로 조회), projection(열 단위로 조회), *****join(두 개 이상의 table을 사용하여 조회)
--SELECT 열이름1, 열이름2....(조회할 열이 전체라면 *로 처리한다.)
--FROM 테이블명;

--1.EMP table의 전체 열을 조회
SELECT
    *
FROM
    emp;

--2.EMP table에서 사원번호, 이름, 급여만 조회
SELECT
    empno,
    ename,
    sal
FROM
    emp;

--3.DEPT table 전체 조회
SELECT
    *
FROM
    dept;

--4.DEPT 테이블 안에 부서번호, 지역만 조회
SELECT
    deptno,
    loc
FROM
    dept;
    
--5.EMP 테이블 안에 부서번호 조회
SELECT
    deptno
FROM
    emp;
    
--6.EMP 테이블 안에 중복되는 부서번호 제거(DISTINCT)
SELECT DISTINCT
    deptno
FROM
    emp;

--7.열이 여러 개인 경우(묶어서 중복이냐 아니냐를 판단한다.)    
SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
--8.연산: 사원들의 1년 연봉 구하기(SAL*12+COMM)
--출력되는 필드명을 내가 정할 수 있다. ((AS) 필드명) 단, 공백을 주려면 ""로 묶어준다.
SELECT
    empno 사원번호,
    ename 사원명,
    JOB "직 책",
    sal * 12 + comm ANNSAL
FROM
    emp;