-- 부서명을 입력 받아 같은 부서에 있는 사원의
-- 사원명, 부서명, 급여 조회
SELECT EMP_NAME,
	NVL(DEPT_TITLE, '부서없음') AS DEPT_TITLE, SALARY
FROM EMPLOYEE 
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE NVL(DEPT_TITLE, '부서없음') = '회계관리부'
;  
   -- NVL이 부서없음이면 부서없음 컬럼이, 다른 부서면 다른 부서 컬럼이 결과로 반환됨.

SELECT EMP_NAME
FROM EMPLOYEE   -- 23명
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)  --21명
-- NULL값이 빠졌으므로 LEFT (OUTER) JOIN 사용하기





-- 직급명, 급여를 입력 받아
-- 해당 직급에서 입력 받은 급여보다 많이 받는 사원의
-- 이름, 직급명, 급여, 연봉을 조회하여 출력

SELECT EMP_NAME, NVL(JOB_NAME, '직급없음'), SALARY, SALARY*12 ANNUAL_INCOME
FROM EMPLOYEE 
JOIN JOB USING (JOB_CODE)
-- NATURAL JOIN JOB
WHERE NVL(JOB_NAME, '직급없음') = '차장'
AND SALARY > 2000000 

-- 직급없는 사람이 없지만 NVL 적용함.





--	입사일을 입력("2022-09-06") 받아
--	입력 받은 값보다 먼저 입사한 사람의 
--	이름, 입사일(1990년 01월 01일), 성별(M,F) 조회
SELECT EMP_NAME 이름, 
	   TO_CHAR(HIRE_DATE,'YYYY"년" MM"월" DD"일"') 입사일,
	   DECODE(SUBSTR(EMP_NO, 8, 1), 1, 'M', 2, 'F') 성별 
FROM EMPLOYEE
WHERE HIRE_DATE > TO_DATE('2022-09-06') 
;
					--> TO_DATE 생략 가능

-- 데이터베이스에서 문자열은 CHAR와 VARCHAR뿐. 둘다 '문자열'
-- 문자 하나를 나타내는 자료형이 없음




