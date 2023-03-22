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
    empno           사원번호,
    ename           사원명,
    sal             연봉,
    comm            커미션,
    job             "직 책",
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


--IN 연산자: JOB이 MANAGER 이거나 SALESMAN 이거나 CLERK인 사원 조회할 때 훨씬 간편하게 작성 가능
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

--JOB이 MANAGER, SALESMAN, CLERK이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
        job != 'MANAGER'
    AND job^= 'SALESMAN'
    AND job <> 'CLERK';

--JOB이 MANAGER, SALESMAN, CLERK이 아닌 사원 조회(간편한 방법)
SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

--부서번호가 10,20 사원조회(IN 사용)
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

--급여가 2000 이상 3000 이하인 사원 조회(BETWEEN 최솟값 AND 최댓값)
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

--급여가 2000 이상 3000 이하가 아닌 사원 조회(NOT BETWEEN 최솟값 AND 최댓값)
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;


--LIKE 연산자와 와일드 카드(_,%)
--사원 이름이 S로 시작하는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%'; --%:뒤에 오는 길이와 상관없이(문자가 없는 경우도 포함) 모든 문자 데이터를 의미한다.

--사원 이름의 두 번째 글자가 L인 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%'; --어떤 값이든 상관없이 언더바(_) 하나가 하나의 문자 데이터를 의미한다.

--사원 이름에 AM이 포함된 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

--사원 이름에 AM이 포함되지 않은 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';


--IS NULL 연산자
--NULL: 데이터값이 완전히 비어 있는 상태
--NULL은 'SOMETHING = NULL'로 사용하지 못한다.
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

--MGR이 NULL인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

--MGR이 NULL이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;


--집합연산자
--합집합: UNION,UNION ALL
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
    deptno = 10; --중복값 자동 제거
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
    deptno = 10; --중복값 자동 제거 안됨

--차집합: MINUS
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
    deptno = 10; --전체를 구해서 10번만 제외

--교집합: INTERSECT
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
    deptno = 10; --10번만 나옴

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
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';

--EMP 테이블에서 30번 부서에 근무하는 사원 중에서 직책이 SALESMAN인 사원의 사원번호, 이름, 급여 조회(SAL 내림차순)
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

--EMP 테이블을 사용하여 20,30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원 조회
--사원번호, 이름, 급여, 부서번호 조회
--집합 연산자를 사용하는 방식과 사용하지 않는 방식 두 가지를 사용한다.
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

--사원 이름에 E가 포함되어 있는 30번 부서 사원 중 급여가 1000~2000 사이가 아닌 사원의 이름
--사원번호, 급여, 부서번호 조회
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

--추가 수당이 존재하지 않으며, 상급자가 있고 직책이 MANAGER, CLERK인 사원 중에서 사원 이름의 두 번째 글자가 L이 아닌 사원의 정보 조회
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
--오라클 함수
--오라클에서 기본으로 제공하는 내장 함수, 사용자가 필요에 의해 직접 정의한 사용자 정의 함수

--#내장 함수#
--1. 문자열 함수
--1) UPPER(모두 대문자),LOWER(모두 소문자),INITCAP(첫 글자만 대문자)
SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;
--대문자나 소문자 등 조건을 걸고 키워드 검색 등을 할 때 유용하게 쓸 수 있다.
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

--2) 문자열 길이: LENGTH
SELECT
    ename,
    length(ename)
FROM
    emp;
--사원 이름의 길이가 5 이상인 사원 조회 => 함수는 조건절에서도 사용 가능
SELECT
    ename,
    length(ename)
FROM
    emp
WHERE
    length(ename) >= 5;
--한글일 때
--DUAL: SYS가 소유하는 테이블(임시 연산이나 함수의 결과값을 확인하는 용도)
--LENGTHB: BYTE 수 => 영어는 1BYTE, 한글은 한 글자 당 3BYTE
SELECT
    length('한글'),
    lengthb('한글'),
    lengthb('AB')
FROM
    dual; --출력값: 2, 6, 2

--3) SUBSTR(문자열 데이터, 시작 위치, 추출 길이): 추출 길이는 생략 가능
--문자열의 일부를 추출하는 함수(=JAVA SUBSTRING)
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5),
    substr(job, - 3)
FROM
    emp; -- -3은 뒤에서부터 추출
--ENAME, 세 번째 글자부터 출력
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;

--4) INSTR(대상 문자열, 위치를 찾으려는 문자열, 대상 문자열에서 찾기를 시작할 위치(선택), 시작 위치에서 찾으려는 문자가 여러 개가 있을 때 몇 번째를 찾을 것인지 지정(선택)): 문자열 데이터 안에서 특정 문자 위치 찾기
--'HELLO, ORACLE!' 문자열에서 'L' 문자열 찾기
SELECT
    instr('HELLO, ORACLE!', 'L')       AS instr_1,
    instr('HELLO, ORACLE!', 'L', 5)    AS instr_2,
    instr('HELLO, ORACLE!', 'L', 2, 2) AS instr_3
FROM
    dual; --출력값: 3, 12, 4

--5) REPLACE(문자열 데이터, 찾는 문자, 변경 문자): 특정 문자를 다른 문자로 변경
--010-1234-5678 '-'를 빈 문자열로 변경하기/'-'를 없애기
SELECT
    '010-1234-5678'                    AS 변경전,
    replace('010-1234-5678', '-', ' ') AS replace_1,
    replace('010-1234-5678', '-')      AS replace_2
FROM
    dual;
--'이것이 ORACLE 이다', '이것이' => 'THIS IS'로 변경
SELECT
    '이것이 ORACLE 이다'                            AS 변경전,
    replace('이것이 ORACLE 이다', '이것이', 'THIS IS') AS 변경후
FROM
    dual;

--6) CONCAT: 두 문자열 데이터 합치기(무조건 2개만 가능)
SELECT
    concat(empno, ename)
FROM
    emp;
--3개 이상을 하고 싶으면 그만큼 CONCAT을 더 넣어주면 된다.
SELECT
    concat(empno,
           concat(':', ename))
FROM
    emp;

--7) ||: 문자열 연결 연산자(여러 개 연결 가능)
SELECT
    empno
    || ':'
    || ename
FROM
    emp;

--8) TRIM(양쪽),LTRIM(왼쪽),RTRIM(오른쪽): 공백 포함 특정 문자 제거
SELECT
    '    THIS IS    ',
    TRIM('    THIS IS    ')
FROM
    dual;


--2023.03.21--
--2. 숫자함수
--1) ROUND,TRUNC,CEIL,FLOOR,MOD
--ROUND(숫자, 반올림 위치(선택)): 반올림
SELECT
    round(1234.5678)      AS round, --소수점 첫째 자리에서 반올림(1235)
    round(1234.5678, 0)   AS round0, --소수점 첫째 자리에서 반올림(1235)
    round(1234.5678, 1)   AS round1, --소수점 둘째 자리에서 반올림(1234.6)
    round(1234.5678, 2)   AS round2, --소수점 셋째 자리에서 반올림(1234.57)
    round(1234.5678, - 1) AS round_minus1, --자연수 첫째 자리에서 반올림(4에서 반올림해서 1230으로 나온다.)
    round(1234.5678, - 2) AS round_minus2 ----자연수 둘째 자리에서 반올림(3에서 반올림해서 1200으로 나온다.)
FROM
    dual;
    
--TRUNC(숫자, 버리는 위치(선택)): 특정 위치에서 버리는 함수
SELECT
    trunc(1234.5678)      AS trunc, --소수점 첫째 자리에서 버림(1234)
    trunc(1234.5678, 0)   AS trunc0, --소수점 첫째 자리에서 버림(1234)
    trunc(1234.5678, 1)   AS trunc1, --소수점 둘째 자리에서 버림(1234.5)
    trunc(1234.5678, 2)   AS trunc2, --소수점 셋째 자리에서 버림(1234.56)
    trunc(1234.5678, - 1) AS trunc_minus1, --자연수 첫째 자리에서 버림(1230)
    trunc(1234.5678, - 2) AS trunc_minus2 ----자연수 둘째 자리에서 버림(1200)
FROM
    dual;

--CEIL(숫자), FLOOR(숫자): 입력된 숫자와 가까운 큰 정수, 작은 정수
SELECT
    ceil(3.14), --출력값: 4
    floor(3.14), --출력값: 3
    ceil(- 3.14), --출력값: -3
    floor(- 3.14) --출력값: -4
FROM
    dual;

--MOD(숫자, 나눌 수): 나머지값
SELECT
    mod(15, 6), --출력값: 3
    mod(10, 2), --출력값: 0
    mod(11, 2) --출력값: 1
FROM
    dual;


--3. 날짜 함수
--날짜 데이터 + 숫자: 현재 날짜 데이터에서 더한 숫자만큼의 일수 이후의 날짜
--날짜 데이터 - 날짜 데이터: 두 날짜 데이터 간의 일수 차이
--단, 날짜 데이터 + 날짜 데이터: 연산 불가
--1) SYSDATE 함수: 현재 날짜 데이터, 오라클 데이터베이스 서버가 설치된 OS의 현재 날짜와 시간을 가져온다.
SELECT SYSDATE AS TODAY, SYSDATE -1 AS YESTERDAY, SYSDATE +1 AS TOMORROW FROM DUAL;

--2) ADD_MONTHS(날짜, 더할 개월수): 몇 개월 이후의 날짜 구하기
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL; --3개월 뒤 날짜 출력

--입사 50주년이 되는 날짜 구하기
--EMPNO,ENAME,HIREDATE,입사 50주년 날짜 조회
SELECT EMPNO,ENAME,HIREDATE,ADD_MONTHS(HIREDATE,600) FROM EMP;

--현재 날짜와 6개월 후 날짜 출력
SELECT SYSDATE AS TODAY, ADD_MONTHS(SYSDATE,6) FROM DUAL;

--3) MONTHS_BETWEEN(첫 번째 날짜, 두 번째 날짜): 두 날짜 데이터 간의 날짜 차이를 개월수로 계산하여 출력
--입사 45년 미만인 사원 데이터 조회
SELECT EMPNO,ENAME,HIREDATE FROM EMP WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE)<540;

--예제
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

--4) NEXT_DAY(날짜, 요일): 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
--LAST_DAY(날짜): 특정 날짜가 속한 달의 마지막 날짜를 출력
SELECT SYSDATE,NEXT_DAY(SYSDATE,'금요일'),LAST_DAY(SYSDATE) FROM DUAL;

--날짜의 반올림, 버림: ROUND, TRUNC
--CC: 네 자리 연도의 끝 두자리를 기준으로 사용
--2023년인 경우 2050 이하이므로 2001년으로 처리
SELECT
    sysdate,
    round(sysdate, 'CC')   AS format_CC,
    round(sysdate, 'YYYY') AS format_YYYY, --6월 기준
    round(sysdate, 'DDD')  AS format_DDD, --12시 기준
    round(sysdate, 'HH')   AS format_HH 
FROM
    dual;
    

--4. 형변환 함수: 자료형을 형 변환
--1) NUMEBR, VARCHAR2, DATE
SELECT EMPNO,ENAME,EMPNO+'500' FROM EMP WHERE ENAME='FORD'; --500을 숫자로 형변환해서 잘 더해진다.

--SELECT EMPNO,ENAME,EMPNO+'ABCD' FROM EMP WHERE ENAME='FORD'; --오류난다. 같은 숫자여야 형변환을 해서 더해주지 아예 문자를 입력하면 숫자와 더할 수 없다.

--2) TO_CHAR(): 숫자 또는 날짜 데이터를 문자 데이터로 변환, TO_NUMBER(): 문자 데이터를 숫자 데이터로 변환, TO_DATE(): 문자 데이터를 날짜 데이터로 변환
--TO_CHAR(): 원하는 출력 형태로 날짜를 출력하고 싶을 때 주로 사용한다.
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간 FROM DUAL;

SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD') AS 현재날짜,
    to_char(sysdate, 'YYYY')       AS 현재연도,
    to_char(sysdate, 'MM')         AS 현재월,
    to_char(sysdate, 'DD')         AS 현재일자
FROM
    dual;

--MON, MONTH: 월 이름, DDD: 365일 중에서 몇 일이 지났는가?
SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD')    AS 현재날짜,
    to_char(sysdate, 'YYYY')          AS 현재연도,
    to_char(sysdate, 'MM')            AS 현재월1, --03
    to_char(sysdate, 'MON')           AS 현재월2, --3월
    to_char(sysdate, 'DD')            AS 현재일자1,
    to_char(sysdate, 'DDD')           AS 현재일자2, --80
    to_char(sysdate, 'HH12:MI:SS AM') AS 현재시간
FROM
    dual;

--TO_NUMBER(문자열 데이터, 인식될 숫자 형태): 
SELECT 1300-'1500','1300'+1500 FROM DUAL; --자동 형변환
--SELECT 1300-'1,500','1300'+1500 FROM DUAL; --연산 오류
SELECT TO_NUMBER('1,300','999,999')-TO_NUMBER('1,500','999,999') FROM DUAL; --자동 형변환이 안되는 상황

--SAL 필드에 ','나 '$' 같은 통화 단위 표시를 하고 싶다면?
--L: 현재 오라클이 설치된 서버의 로컬 통화 단위를 따라간다.
SELECT SAL, TO_CHAR(SAL,'$999,999') AS SAL_$, TO_CHAR(SAL,'L999,999') AS SAL_L FROM EMP;

--TO_DATE(문자열 데이터, '인식될 날짜 형태'):
SELECT TO_DATE('2018-07-14','YYYY-MM-DD') AS TODATE1, TO_DATE('20230321','YYYY-MM-DD') AS TODATE2 FROM DUAL;

--날짜 빼기
--SELECT '2023-03-21'-'2023-02-01' FROM DUAL; --오류
SELECT TO_DATE('2023-03-21')-TO_DATE('2023-02-01') FROM DUAL;


--5. NULL처리 함수
--NULL+300 => NULL. 어떻게 하면 300이 나올까??
--NULL을 다른 걸로 바꿔준다. => NVL(데이터, NULL일 경우 반환할 데이터)
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL(COMM,0), SAL+NVL(COMM,0) FROM EMP;

--NVL2(데이터, NULL이 아닐 경우 반환할 데이터, NULL일 경우 반환할 데이터)
SELECT EMPNO, ENAME, COMM, NVL2(COMM,'O','X'), NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL FROM EMP;


--6. DECODE함수 / CASE 문
--DECODE(검사 대상이 될 데이터, 
--       조건1, 조건1이 일치할 때 실행할 구문 
--       조건2, 조건2이 일치할 때 실행할 구문)

--1) DECODE 함수
--EMP 테이블에 직책이 MANAGER인 사람은 급여의 10% 인상,
--SALESMAN인 사람은 5%, ANALYST인 사람은 그대로, 나머지는 3% 인상된 급여 출력
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upsal
FROM
    emp;
    
--2) CASE 문
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
            '해당사항 없음'
        WHEN comm = 0 THEN
            '수당 없음'
        WHEN comm > 0 THEN
            '수당: ' || comm
    END AS comm_text
FROM
    emp;
    
--[실습1]
SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;
    
--[실습2]
SELECT EMPNO,ENAME,HIREDATE,NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일') AS R_JOB,
CASE WHEN COMM IS NULL THEN 'N/A' ELSE TO_CHAR(COMM) END AS COMM--한 카테고리 내에서 동일한 타입일 때만 출력할 때 오류가 없다.
FROM EMP;

--[실습3]
--DECODE 함수 활용
SELECT EMPNO,ENAME,MGR,
DECODE(SUBSTR(TO_CHAR(MGR),1,2),NULL,'0000','75','5555','76','6666','77','7777','78','8888',SUBSTR(TO_CHAR(MGR),1)) AS CHG_MGR
FROM EMP;
--CASE 문 활용
SELECT EMPNO,ENAME,MGR,
CASE WHEN MGR IS NULL THEN '0000'
WHEN C='75' THEN '5555'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='76' THEN '6666'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='77' THEN '7777'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='78' THEN '8888'
ELSE SUBSTR(TO_CHAR(MGR),1) END AS CHG_MGR
FROM EMP;


--7. 다중행 함수: SUM, COUNT, MAX, MIN, AVG
SELECT SUM(SAL) FROM EMP;
SELECT SUM(DISTINCT SAL), SUM(ALL SAL), SUM(SAL) FROM EMP;

--COMM에 NULL이 있는데도 불구하고 합산이 잘 된다.
--1) SUM(): NULL은 알아서 제외하고 합계를 구해준다.
SELECT SUM(COMM) FROM EMP;

--2) COUNT(): NULL은 알아서 제외하고 센다.
SELECT COUNT(SAL) FROM EMP;
SELECT COUNT(COMM) FROM EMP;
SELECT COUNT(*) FROM EMP; --EMP 테이블의 행의 개수가 몇 개?
SELECT COUNT(*) FROM EMP WHERE DEPTNO=30;

--3) MAX(),MIN()
SELECT MAX(SAL) FROM EMP;
SELECT MAX(HIREDATE) FROM EMP WHERE DEPTNO=20; --부서번호가 20인 사원의 입사일 중 제일 최신 입사일
SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO=20; --부서번호가 20인 사원의 입사일 중 제일 오래된 입사일

--4) AVG()
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=30;

--5) GROUP BY: 결과값을 원하는 열로 묶어 출력
--단, GROUP BY 절에 들어온 것만 SELECT 안에 쓸 수 있다.(SELECT에서 특정 함수로 묶어준 거는 GROUP BY에서 제외)
--부서별 SAL 평균 구하기
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=10;
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=20;
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=30;

SELECT AVG(SAL),DEPTNO FROM EMP GROUP BY DEPTNO;

--부서별 추가수당 평균 구하기
SELECT AVG(COMM),DEPTNO FROM EMP GROUP BY DEPTNO;

--6) GROUP BY + HAVING: GROUP BY 절에 조건을 줄 때 사용한다.
--WHERE과의 차이점: '그룹화'된 대상의 출력을 제한할 때 HAVING을 사용한다.
--각 부서의 직책별 평균 급여 구하기(단, 평균 급여가 2000 이상인 그룹만 출력)
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000 ORDER BY DEPTNO,JOB;

--HAVING 대신에 WHERE을 사용했을 경우, 그룹 함수는 허가되지 않는다고 오류가 난다.
--SELECT DEPTNO, JOB, AVG(SAL) FROM EMP WHERE AVG(SAL)>=2000 GROUP BY DEPTNO,JOB ORDER BY DEPTNO,JOB; 

--WHERE 절과 HAVING 절을 같이 쓰는 경우
--실행 순서: FROM 구문 실행 -> WHERE 절 실행 -> GROUP BY 실행 -> HAVING 절 실행 -> SELECT 구문 실행 -> ORDER BY 실행
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP WHERE SAL<=3000 GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000 ORDER BY DEPTNO,JOB;


--[실습4]
--EMP 테이블을 이용하여 부서번호, 평균 급여, 최고 급여, 최저 급여, 사원 수를 출력한다.
--단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호 별로 출력하는 SQL 문을 작성하시오.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT 
FROM EMP
GROUP BY DEPTNO;

--[실습5]
--같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력
SELECT JOB, COUNT(*) 
FROM EMP
GROUP BY JOB HAVING COUNT(JOB)>=3;

--[실습6]
--사원들의 입사연도를 기준으로 부서별로 몇 명이 입사했는지 출력하는 SQL문을 작성하시오.
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,DEPTNO,COUNT(*) AS CNT 
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY'),DEPTNO;


--2023.03.22--
--8. 조인: 여러 테이블을 하나의 테이블처럼 사용 (면접 시 단골 질문 코너)
--1) 내부조인(inner join): 여러 테이블 간의 공통 요소만 뽑아내는 것
--2) 외부조인(outer join): left outer join(왼쪽 기준으로 뽑아냄), right outer join(오른쪽 기준으로 뽑아냄), full outer join(양쪽에서 뽑아냄)

--예제: DEPT 4행, EMP 12행 => 특정 조건을 주지 않으면 4*12=총 48행이(나올 수 있는 모든 조합이) 나와버린다. => 크로스 조인
SELECT * FROM EMP, DEPT ORDER BY EMPNO;

--1) 내부조인
--ORA-00918: 열의 정의가 애매합니다 => SELECT 안에 들어가 있는 DEPTNO가 양쪽 테이블의 중복되는 요소이기 때문에 어디서 뽑아낼지 몰라서 오류가 발생했다.
--오류를 방지하기 위해서 각 요소별 앞에다가 어디 테이블 것인지를 명시해준다.

--① 등가조인: 두 개의 열이 일치할 때 값 추출
SELECT E.EMPNO,E.ENAME,D.DEPTNO,D.DNAME,D.LOC FROM EMP E,DEPT D
WHERE E.DEPTNO=D.DEPTNO; --EMP 테이블의 DEPTNO와 DEPT 테이블의 DEPTNO가 같다면 EMPNO,ENAME,DEPTNO,DNAME,LOC을 출력하겠다.

SELECT E.EMPNO,E.ENAME,D.DEPTNO,D.DNAME,D.LOC FROM EMP E,DEPT D
WHERE E.DEPTNO=D.DEPTNO AND SAL>=3000; --조건 더 추가 가능

--SQL-99 표준
--##JOIN~ON
SELECT E.EMPNO,E.ENAME,D.DEPTNO,D.DNAME,D.LOC 
FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO --ON에 기준을 넣는다.
WHERE SAL>=3000;

--EMP,DEPT INNER JOIN, 급여가 2500 이하이고, 사원번호가 9999 이하인 사원 정보 조회
SELECT E.EMPNO,E.ENAME,E.SAL,D.DEPTNO,D.DNAME,D.LOC FROM EMP E,DEPT D
WHERE E.DEPTNO=D.DEPTNO AND SAL<=2500 AND E.EMPNO<=9999;

--SQL-99 표준
--##JOIN~ON
SELECT E.EMPNO,E.ENAME,E.SAL,D.DEPTNO,D.DNAME,D.LOC 
FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
WHERE SAL<=2500 AND E.EMPNO<=9999;

--② 비등가조인: 범위에 해당할 때 값 추출
--EMP와 SALGRADE 조인
--EMP 테이블의 SAL이 SALGRADE 테이블의 LOSAL과 HISAL 범위에 들어가는 형태로 조인
SELECT * FROM EMP E,SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--SQL-99 표준
--##JOIN~ON
SELECT * FROM EMP E JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--SELF JOIN: 자기 자신 테이블과 조인
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2
WHERE E1.MGR=E2.EMPNO;

--2) 외부조인
--① LEFT OUTER JOIN
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME 
FROM EMP E1, EMP E2 --처음에 나오는 게 LEFT, 나중에 나오는 게 RIGHT
WHERE E1.MGR=E2.EMPNO(+); --안 똑같아도 왼쪽 것을 기준으로 출력해줘

--SQL-99 표준
--##JOIN~ON
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME 
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON E1.MGR=E2.EMPNO;

--② RIGHT OUTER JOIN
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME 
FROM EMP E1, EMP E2 --처음에 나오는 게 LEFT, 나중에 나오는 게 RIGHT
WHERE E1.MGR(+)=E2.EMPNO; --안 똑같아도 출력해줘

--SQL-99 표준
--##JOIN~ON
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME 
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON E1.MGR=E2.EMPNO;

--③ FULL OUTER JOIN
--SQL-99 표준
--##JOIN~ON
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME 
FROM EMP E1 FULL OUTER JOIN EMP E2 ON E1.MGR=E2.EMPNO;

--연결해야 할 테이블이 3개일 때
SELECT * FROM TABLE1 T1,TABLE2 T2,TABLE3 T3
WHERE T1.EMPNO=T2.EMPNO AND T2.DEPTNO=T3.DEPTNO; --그냥 나열해주면 된다.

--SQL-99 표준
--##JOIN~ON
SELECT * FROM TABLE1 T1 JOIN TABLE2 T2 ON T1.EMPNO=T2.EMPNO 
JOIN TABLE3 T3 ON T2.DEPTNO=T3.DEPTNO;

--[실습1]: 급여가 2000 초과인 사원들의 부서 정보, 사원 정보를 출력
SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.SAL FROM EMP E, DEPT D
WHERE D.DEPTNO=E.DEPTNO AND E.SAL>2000 ORDER BY D.DEPTNO;

SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.SAL FROM EMP E JOIN DEPT D ON D.DEPTNO=E.DEPTNO
WHERE E.SAL>2000 ORDER BY D.DEPTNO;

--[실습2]: 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원 수를 출력하는 SQL문을 작성
SELECT D.DEPTNO,D.DNAME, TRUNC(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL, MIN(E.SAL) AS MIN_SAL, COUNT(E.EMPNO) AS CNT
FROM EMP E, DEPT D WHERE D.DEPTNO=E.DEPTNO GROUP BY D.DEPTNO,D.DNAME ORDER BY D.DEPTNO;

SELECT D.DEPTNO,D.DNAME, TRUNC(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL, MIN(E.SAL) AS MIN_SAL, COUNT(E.EMPNO) AS CNT
FROM EMP E JOIN DEPT D ON D.DEPTNO=E.DEPTNO GROUP BY D.DEPTNO,D.DNAME ORDER BY D.DEPTNO;

--[실습3]: 모든 부서정보와 사원정보를 아래와 같이 부서번호, 사원이름 순으로 정렬하여 출력
SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.JOB,E.SAL 
FROM EMP E, DEPT D WHERE E.DEPTNO(+)=D.DEPTNO ORDER BY D.DEPTNO,E.EMPNO;

SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.JOB,E.SAL 
FROM EMP E RIGHT OUTER JOIN DEPT D ON D.DEPTNO=E.DEPTNO ORDER BY D.DEPTNO,E.EMPNO;


--9. 서브쿼리: 단일행, 다중행, 다중열
--SQL 문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 SQL 문 내부에서 사용하는 SELECT 문
--구조: SELECT 조회할 열 FROM 테이블명 WHERE 조건식(SELECT 조회할 열 FROM 테이블 WHERE 조건식)

--1) 단일행 서브쿼리: 서브쿼리 결과로 하나의 행 반환(급여, 추가수당, 입사일, 평균 급여)
--존스의 급여보다 높은 급여를 받는 사원 조회(서브쿼리)
--먼저 JONES 급여 알아내기, 알아낸 JONES 급여를 가지고 조건식
SELECT SAL FROM EMP WHERE ENAME='JONES'; --2975
SELECT * FROM EMP WHERE SAL>2975;
--한 줄로
SELECT * FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='JONES');

--사원이름이 ALLEN인 사원의 추가수당 보다 많은 추가수당을 받는 사원 조회
SELECT * FROM EMP WHERE COMM>(SELECT COMM FROM EMP WHERE ENAME='ALLEN');

--사원 이름이 WARD인 사원의 입사일 보다 빨리 입사한 사원 조회
SELECT * FROM EMP WHERE HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='WARD');

--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원정보 및 부서정보 조회
--사원번호, 사원명, 직무, 급여, 부서번호, 부서명, 지역
SELECT E.EMPNO,E.ENAME,E.JOB,E.SAL,D.DEPTNO,D.DNAME,D.LOC
FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
WHERE E.DEPTNO=20 AND E.SAL>(SELECT AVG(SAL) FROM EMP);

--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 작거나 같은 급여를 받는 사원정보 및 부서정보 조회
--사원번호, 사원명, 직무, 급여, 부서번호, 부서명, 지역
SELECT E.EMPNO,E.ENAME,E.JOB,E.SAL,D.DEPTNO,D.DNAME,D.LOC
FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
WHERE E.DEPTNO=20 AND E.SAL<=(SELECT AVG(SAL) FROM EMP);

--2) 다중행 서브쿼리: 서브쿼리 결과로 여러 개의 행 반환
--IN, ANY(SOME), ALL, EXISTS 연산자 허용(단일행 서브쿼리에 쓰는 연산자(=,<=,>=,<>,^=) 사용 불가)
--각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 조회
--각 부서별 최고 급여
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO; 
--동일한 급여를 받는 사원 정보 조회
--SELECT * FROM EMP WHERE SAL=(SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO); --오류 발생
--IN: 메인쿼리 결과와 서브쿼리 결과 중 하나라도 일치하면 TRUE
SELECT * FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--30번 부서 사원들의 급여보다 적은 급여를 받는 사원 정보 조회
--ANY(SOME): 메인쿼리 결과가 서브쿼리 결과의 하나 이상이면 TRUE
SELECT * FROM EMP WHERE SAL < SOME(SELECT SAL FROM EMP WHERE DEPTNO=30);
SELECT * FROM EMP WHERE SAL < ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);
--위 결과는 단일행 쿼리로도 작성할 수 있었다.
SELECT * FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);

--30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 조회
--① 단일행 서브쿼리
SELECT * FROM EMP WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);
--② 다중행 서브쿼리
SELECT * FROM EMP WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);

--ALL: 서브쿼리의 모든 결과가 조건식에 맞아 떨어져야만 메인쿼리 조건식이 TRUE가 된다.
SELECT * FROM EMP WHERE SAL < ALL(SELECT SAL FROM EMP WHERE DEPTNO=30); 

--EXISTS: 서브쿼리에 결과값이 하나 이상 존재하면 조건식이 모두 TRUE, 존재하지 않으면 FALSE
SELECT * FROM EMP WHERE EXISTS(SELECT DNAME FROM DEPT WHERE DEPTNO=10)

--[실습4]
--전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 부서 정보를 다음과 같이 출력하는 SQL문을 작성하시오.
SELECT JOB,EMPNO,ENAME,SAL,DEPTNO FROM EMP WHERE JOB IN(SELECT JOB FROM EMP WHERE ENAME='ALLEN');

--[실습5]
--전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보, 부서정보, 급여 등급 정보를 출력하는 SQL문을 작성하시오.
--단, 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는 사원 번호를 기준으로 오름차순으로 정렬
SELECT E.EMPNO,E.ENAME,D.DNAME,E.HIREDATE,D.LOC,E.SAL,S.GRADE 
FROM EMP E,DEPT D,SALGRADE S
WHERE E.DEPTNO=D.DEPTNO and e.sal between s.losal and s.hisal and E.SAL>(SELECT AVG(SAL) FROM EMP) ORDER BY e.SAL desc,e.EMPNO;

--3) 다중열 서브쿼리: 서브쿼리의 SELECT 절에서 비교할 데이터를 여러 개 지정
SELECT * FROM EMP WHERE (DEPTNO,SAL) IN (SELECT deptno,MAX(SAL) FROM EMP GROUP BY DEPTNO);

--4) FROM 절에 사용하는 서브쿼리(인라인 뷰)
--FROM 절에 직접 테이블을 명시해서 사용하기에는 테이블 내 데이터 규모가 클 때 혹은 불필요한 열이 많을 때 쓴다.
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO=10) E10, --부서번호가 10번인 애들만 가지고 DEPT와 조인
     (SELECT * FROM DEPT) D 
WHERE E10.DEPTNO=D.DEPTNO;

--5) 스칼라 서브쿼리: SELECT 절에 사용하는 서브쿼리
--SELECT 절에 사용하는 서브쿼리는 반드시 하나의 결과만 반환해야 한다.
SELECT EMPNO, ENAME, JOB, SAL, 
(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE, 
DEPTNO,(SELECT DNAME FROM DEPT WHERE E.DEPTNO=DEPT.DEPTNO) AS DNAME
FROM EMP E;

--[실습6]
--10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 사원정보, 부서 정보를 출력하는 SQL문을 작성하시오.
SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.JOB NOT IN(SELECT JOB FROM EMP WHERE DEPTNO=30) AND E.DEPTNO=10;

--[실습7]
--직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원정보, 급여등급 정보를 출력하는 SQL문을 작성하시오.
--단, 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원번호를 기준으로 오름차순 정렬하여 출력하시오.
--① 단일행 쿼리로 작성
SELECT E.EMPNO,E.ENAME,E.SAL,S.GRADE 
FROM EMP E, SALGRADE S 
WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.SAL>(SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN')
ORDER BY E.EMPNO;
--② 다중행 쿼리로 작성
SELECT E.EMPNO,E.ENAME,E.SAL,S.GRADE 
FROM EMP E, SALGRADE S 
WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.SAL>ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN')
ORDER BY E.EMPNO;
--③ 스칼라 서브쿼리로 작성
SELECT E.EMPNO,E.ENAME,E.SAL,(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) GRADE
FROM EMP E
WHERE E.SAL>(SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN')
ORDER BY E.EMPNO;
