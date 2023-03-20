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
    SAL 연봉,
    COMM 커미션,
    job "직 책",
    sal * 12 + comm AS annsal
FROM
    emp;

--9.데이터 정렬: ORDER BY
--내림차순: DESC, 오름차순: ASC
--ENAME, SAL 열 추출하고, SAL은 내림차순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

--ENAME, SAL 열 추출하고, SAL은 오름차순으로 정렬. ASC가 ORDER BY의 기본이므로 ASC는 생략 가능.
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;
    
--전체 내용 출력하고, 결과가 사원번호의 오름차순으로 정렬
SELECT
    *
FROM
    emp
ORDER BY
    empno;
    
--전체 내용 출력하고, 결과가 부서번호의 오름차순과 급여의 내림차순으로 정렬
SELECT
    *
FROM
    emp
ORDER BY
    deptno,
    sal DESC;
    
--[실습] EMP 테이블의 모든 열 출력
--EMPNO => EMPLOYEE_NO (이렇게 별칭 붙이기)
--ENAME => EMPLOYEE_NAME
--MGR => MANAGER
--SAL => SALARY
--COMM => COMMISION
--DEPTNO => DEPARTMENT_NO
--부서 번호를 기준으로 내림차순으로 정렬하되 부서번호가 같다면 사원 이름을 기준으로 오름차순 정렬
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
    
--10.(SELECT + FROM + )WHERE: 특정 '조건'을 기준으로 원하는 행을 조회
--부서번호가 30인 데이터만 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

--사원번호가 7782인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

--부서번호가 30이고, 사원직책이 SALESMAN 정보 조회 => 복수조건은 AND를 사용
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN'; --=''안은 대소문자 구별
    
--사원번호가 7499이고, 부서번호가 30인 행 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;
    
--부서번호가 30이거나, 사원직책이 CLERK인 행 조회 => 둘 중 하나의 조건 만족은 OR를 사용
SELECT
    *
FROM
    emp
WHERE
    job = 'CLERK'
    OR deptno = 30;

--11.산술연산자: +,-,*,/,MOD(나머지-표준은 아니고 ONLY IN ORACLE) 
--비교연산자: >,<,>=,<=
--등가비교연산자: =,!=,<>,^=(뒤에 3개는 의미가 모두 같음: A값과 B값이 다를 경우 TRUE, 같을 경우 FALSE)
--논리부정연산자: NOT
--IN 연산자
--BETWEEN A AND B 연산자
--LIKE 연산자와 와일드 카드(_,%)
--IS NULL 연산자
--집합연산자: UNION(합집합-중복제거), UNION ALL(합집합-중복포함), MINUS(차집합), INTERSECT(교집합)

--EMP 테이블에서 급여 열에 12를 곱한 값이 36000인 행 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

--ENAME이 F 이후의 문자로 시작하는 사원 조회
--문자 표현 시 ''만 사용(""은 사용할 수 없다.)
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

--JOB이 MANAGER 이거나 SALESMAN 이거나 CLERK인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN'
    OR job = 'CLERK';

--SAL이 3000이 아닌 사원만 조회(넷 다 모두 같은 의미)
SELECT * FROM EMP WHERE SAL!=3000;
SELECT * FROM EMP WHERE SAL<>3000;
SELECT * FROM EMP WHERE SAL^=3000;
SELECT * FROM EMP WHERE NOT SAL=3000;


--IN 연산자: JOB이 MANAGER 이거나 SALESMAN 이거나 CLERK인 사원 조회할 때 훨씬 간편하게 작성 가능
SELECT
    *
FROM
    emp
WHERE
    job IN('MANAGER','SALESMAN','CLERK');

--JOB이 MANAGER, SALESMAN, CLERK이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job != 'MANAGER'
    AND job ^= 'SALESMAN'
    AND job <> 'CLERK';

--JOB이 MANAGER, SALESMAN, CLERK이 아닌 사원 조회(간편한 방법)
SELECT
    *
FROM
    emp
WHERE
    job NOT IN('MANAGER','SALESMAN','CLERK');

--부서번호가 10,20 사원조회(IN 사용)
SELECT * FROM EMP WHERE DEPTNO IN(10,20);

--급여가 2000 이상 3000 이하인 사원 조회(BETWEEN 최솟값 AND 최댓값)
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;

--급여가 2000 이상 3000 이하가 아닌 사원 조회(NOT BETWEEN 최솟값 AND 최댓값)
SELECT * FROM EMP WHERE SAL NOT BETWEEN 2000 AND 3000;


--LIKE 연산자와 와일드 카드(_,%)
--사원 이름이 S로 시작하는 사원 정보 조회
SELECT * FROM EMP WHERE ENAME LIKE 'S%'; --%:뒤에 오는 길이와 상관없이(문자가 없는 경우도 포함) 모든 문자 데이터를 의미한다.

--사원 이름의 두 번째 글자가 L인 사원만 조회
SELECT * FROM EMP WHERE ENAME LIKE '_L%'; --어떤 값이든 상관없이 언더바(_) 하나가 하나의 문자 데이터를 의미한다.

--사원 이름에 AM이 포함된 사원만 조회
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';

--사원 이름에 AM이 포함되지 않은 사원만 조회
SELECT * FROM EMP WHERE ENAME NOT LIKE '%AM%';


--IS NULL 연산자
--NULL: 데이터값이 완전히 비어 있는 상태
--NULL은 'SOMETHING = NULL'로 사용하지 못한다.
SELECT * FROM EMP WHERE COMM IS NULL;

--MGR이 NULL인 사원 조회
SELECT * FROM EMP WHERE MGR IS NULL;

--MGR이 NULL이 아닌 사원 조회
SELECT * FROM EMP WHERE MGR IS NOT NULL;


--집합연산자
--합집합: UNION,UNION ALL
SELECT EMPNO,ENAME, SAL,DEPTNO FROM EMP WHERE DEPTNO=10 UNION SELECT EMPNO,ENAME, SAL,DEPTNO FROM EMP WHERE DEPTNO=10; --중복값 자동 제거
SELECT EMPNO,ENAME, SAL,DEPTNO FROM EMP WHERE DEPTNO=10 UNION ALL SELECT EMPNO,ENAME, SAL,DEPTNO FROM EMP WHERE DEPTNO=10; --중복값 자동 제거 안됨

--차집합: MINUS
SELECT EMPNO,ENAME, SAL,DEPTNO FROM EMP MINUS SELECT EMPNO,ENAME, SAL,DEPTNO FROM EMP WHERE DEPTNO=10; --전체를 구해서 10번만 제외

--교집합: INTERSECT
SELECT EMPNO,ENAME, SAL,DEPTNO FROM EMP INTERSECT SELECT EMPNO,ENAME, SAL,DEPTNO FROM EMP WHERE DEPTNO=10; --10번만 나옴

--연산자 우선순위
--1) 산술연산자 *,/
--2) 산술연산자 +,-
--3) 비교연산자
--4) IS NULL, IS NOT NULL, LIKE, IN
--5) BETWEEN A AND B
--6) NOT
--7) AND
--8) OR
--우선순위를 줘야 한다면 소괄호 사용 추천


--EMP 테이블에서 사원이름이 S로 끝나는 사원 데이터 조회
SELECT * FROM EMP WHERE ENAME LIKE '%S';

--EMP 테이블에서 30번 부서에 근무하는 사원 중에서 직책이 SALESMAN인 사원의 사원번호, 이름, 급여 조회(SAL 내림차순)
SELECT EMPNO,ENAME,SAL FROM EMP WHERE DEPTNO=30 AND JOB='SALESMAN' ORDER BY SAL DESC;

--EMP 테이블을 사용하여 20,30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원 조회
--사원번호, 이름, 급여, 부서번호 조회
--집합 연산자를 사용하는 방식과 사용하지 않는 방식 두 가지를 사용한다.
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE DEPTNO IN(20,30) AND SAL>2000;
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE DEPTNO=20 AND SAL>2000 UNION SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE DEPTNO=30 AND SAL>2000;
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE SAL>2000 MINUS SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE DEPTNO=10;

--사원 이름에 E가 포함되어 있는 30번 부서 사원 중 급여가 1000~2000 사이가 아닌 사원의 이름
--사원번호, 급여, 부서번호 조회
SELECT EMPNO,SAL,DEPTNO FROM EMP WHERE ENAME LIKE '%E%' AND DEPTNO=30 AND SAL NOT BETWEEN 1000 AND 2000;

--추가 수당이 존재하지 않으며, 상급자가 있고 직책이 MANAGER, CLERK인 사원 중에서 사원 이름의 두 번째 글자가 L이 아닌 사원의 정보 조회
SELECT * FROM EMP WHERE COMM IS NULL AND MGR IS NOT NULL AND JOB IN('MANAGER','CLERK') AND ENAME NOT LIKE '_L%';

--------------
--오라클 함수
--오라클에서 기본으로 제공하는 내장 함수, 사용자가 필요에 의해 직접 정의한 사용자 정의 함수

--1.내장 함수
--1) 문자열 함수: UPPER(모두 대문자),LOWER(모두 소문자),INITCAP(첫 글자만 대문자)
SELECT ENAME,UPPER(ENAME),LOWER(ENAME),INITCAP(ENAME) FROM EMP;
--대문자나 소문자 등 조건을 걸고 키워드 검색 등을 할 때 유용하게 쓸 수 있다.
SELECT * FROM EMP WHERE UPPER(ENAME)='FORD';
SELECT * FROM EMP WHERE UPPER(ENAME) LIKE UPPER('%FORD%');

--2) 문자열 길이: LENGTH
SELECT ENAME,LENGTH(ENAME) FROM EMP;
--사원 이름의 길이가 5 이상인 사원 조회 => 함수는 조건절에서도 사용 가능
SELECT ENAME,LENGTH(ENAME) FROM EMP WHERE LENGTH(ENAME)>=5;
--한글일 때
--DUAL: SYS가 소유하는 테이블(임시 연산이나 함수의 결과값을 확인하는 용도)
--LENGTHB: BYTE 수 => 영어는 1BYTE, 한글은 한 글자 당 3BYTE
SELECT LENGTH('한글'), LENGTHB('한글'), LENGTHB('AB') FROM DUAL; --출력값: 2, 6, 2

--3) SUBSTR(문자열 데이터, 시작 위치, 추출 길이): 추출 길이는 생략 가능
--문자열의 일부를 추출하는 함수(=JAVA SUBSTRING)
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5),SUBSTR(JOB,-3) FROM EMP; -- -3은 뒤에서부터 추출
--ENAME, 세 번째 글자부터 출력
SELECT ENAME, SUBSTR(ENAME,3) FROM EMP;

--4) INSTR(대상 문자열, 위치를 찾으려는 문자열, 대상 문자열에서 찾기를 시작할 위치(선택), 시작 위치에서 찾으려는 문자가 여러 개가 있을 때 몇 번째를 찾을 것인지 지정(선택)): 문자열 데이터 안에서 특정 문자 위치 찾기
--'HELLO, ORACLE!' 문자열에서 'L' 문자열 찾기
SELECT INSTR('HELLO, ORACLE!','L') AS INSTR_1, INSTR('HELLO, ORACLE!','L',5) AS INSTR_2, INSTR('HELLO, ORACLE!','L',2,2) AS INSTR_3 FROM DUAL; --출력값: 3, 12, 4

--5) REPLACE(문자열 데이터, 찾는 문자, 변경 문자): 특정 문자를 다른 문자로 변경
--010-1234-5678 '-'를 빈 문자열로 변경하기/'-'를 없애기
SELECT '010-1234-5678' AS 변경전, REPLACE('010-1234-5678','-',' ')AS REPLACE_1, REPLACE('010-1234-5678','-')AS REPLACE_2 FROM DUAL;
--'이것이 ORACLE 이다', '이것이' => 'THIS IS'로 변경
SELECT '이것이 ORACLE 이다' AS 변경전, REPLACE('이것이 ORACLE 이다','이것이','THIS IS')AS 변경후 FROM DUAL;

--6) CONCAT: 두 문자열 데이터 합치기(무조건 2개만 가능)
SELECT CONCAT(EMPNO,ENAME) FROM EMP;
--3개 이상을 하고 싶으면 그만큼 CONCAT을 더 넣어주면 된다.
SELECT CONCAT(EMPNO,CONCAT(':',ENAME)) FROM EMP;

--7) ||: 문자열 연결 연산자(여러 개 연결 가능)
SELECT EMPNO||':'||ENAME FROM EMP;

--8) TRIM(양쪽),LTRIM(왼쪽),RTRIM(오른쪽): 공백 포함 특정 문자 제거
SELECT '    THIS IS    ',TRIM('    THIS IS    ') FROM DUAL;