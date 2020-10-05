--1
select * from tblcountry;

--2
select name,capital from tblcountry;


 
select * from tblCountry;

--3
select 
    name as "[국가명]", 
    capital as "[수도명]",
    population as "[인구수]",
    continent as "[면적]",
    area as "[대륙]"
    from tblCountry;
    
--4
select * from tblCountry;

select  
    '국가명 : ' || name,
    '수도명 : ' || capital,
    '인구수 : ' || population,
    '대륙 : ' || continent,
    '면적 : ' || area
from tblCountry;


--5
select * from employees;

select 
    first_name || ' ' || last_name as "[이름]",
    email || '@GMAIl.COM' as "[이메일]",
    phone_number as "[연락처]",
    '$ ' || salary as "[급여]"
from employees;

--6
select * from tblCountry where area <= 100;

--7
select * from tblCountry where continent = 'AS' or continent = 'EU';

--7 다른방법
select * from tblCountry where continent in ('AS','EU');

--8 employees. 직업(job_id)이 프로그래머(it_prog)인 직원의 이름(풀네임)과 연락처 가져오시오.
select * from employees;

select 
    first_name || last_name,
    phone_number
    from employees
    where job_id = 'IT_PROG';

--9 employees.  last_name이 'Grant'인 직원의 이름, 연락처, 고용날짜를 가져오시오.

select 
    first_name || last_name,
    phone_number,
    hire_date
from hr.employees
    where last_name = 'Grant';

--10  employees. 특정 매니저(120)이 관리하는 직원의 이름, 급여, 연락처를 가져오시오.
select * from employees;

select 
    first_name || ' ' || last_name,
    '$ ' || salary,
    phone_number
from employees
    where manager_id = 120;

--다른 방법으로 풀기
select 
    first_name || ' ' || last_name,
    to_char(salary,'999,999'),
    phone_number
from employees
    where manager_id = 120;

--select to_char(124333,'999,999') from dual; 연습한것.

--11. employees. 특정 부서(60, 80, 100)에 속한 직원들의 이름, 연락처, 이메일, 부서ID 가져오시오.

select * from employees;

select 
    first_name || ' ' || last_name as "이름",
    phone_number as "연락처",
    email as "이메일",
    department_id as "부서ID"
from employees
    where department_id in (60,80,100);



--12. tblInsa. 기획부 직원들을 모두 가져오시오.
select * from tblinsa;

select * from tblinsa where buseo = '기획부';


--잠시 문제.. -> **실기면접 문제**
select * from employees;
select 
    department_id as "부서명",
    employee_id as "사번",
    first_name || ' ' || last_name as "성명",
    hire_date as "입사일",
    to_char(salary ,'999,999.99') || '$' as "연봉",
    (select to_char(avg(salary),'999,999.99') || '$' from employees) as "회사 평균 연봉"
from employees
    where salary > (select avg(salary) from employees)
        order by "부서명" asc, "입사일" desc, "성명" asc;



--13. tblInsa. 서울에 있는 직원들 중 직위가 부장인 사람의 이름, 직위, 전화번호를 가져오시오. 
select 
    name as "이름",
    jikwi as "직위",
    tel as "전화번호"
from tblinsa where city = '서울';

--14. tblInsa. 기본급여 + 수당 합쳐서 150만원 이상인 직원 중 서울에 직원만 가져오시오.
select * from tblinsa where basicpay + sudang >= 1500000 and city = '서울';

--15. tblInsa. 수당이 15만원 이하인 직원 중 직위가 사원, 대리만 가져오시오.
select * from tblinsa where sudang <= 150000 and jikwi in ('사원','대리');

--16. tblInsa. 수당을 제외한 기본 연봉이 2천만원 이상, 서울, 직위 과장(부장)만 가져오시오 : 문제를 잘 읽어라 븅신아..!!
select * from tblinsa where (basicpay*12) >= 20000000 and city = '서울' and jikwi in ('과장','부장');

--17. tblCountry. 국가명 'O국'인 나라를 가져오시오.
select * from tblcountry;
-- a. 국가명 두글자 
select * from tblcountry where name like '_국';
-- b. 국가명 글자수 상관없이.
select * from tblcountry where name like '%국';

--18. employees. 연락처가 '515'로 시작하는 직원들을 가져오시오.
-- 첫번째 방법
select * from employees where phone_number like '515%';

-- 두번째 방법
select * from employees where instr(phone_number,'515') = 1;
--instr 이란 해당 문장에서 해당 단어를 찾아 그 인덱스를 반환한다.

select instr('apple','p') from dual;

--19. employees. 직업 ID가 'SA'로 시작하는 직원들을 가져오시오.
select * from employees;
--a.
select * from employees where job_id like 'SA%';
select count(*) from employees where job_id like 'SA%';
--b.
select * from employees where instr(job_id,'SA') = 1;
select count(*) from employees where instr(job_id,'SA') = 1;

--19. employees. first_name에 'de'가 들어간 직원들을 가져오시오.(대소문자 상관없이)
select * from employees;

select * from employees where lower(first_name) like '%de%';

--20. tblInsa. 남자 직원만 가져오시오.
select * from tblinsa;

--a. 첫번째 방법
select * from tblinsa where substr(ssn,8,1) = 1;
select count(*) from tblinsa where substr(ssn,8,1) = 1;
--b. 두번째 방법
select * from tblinsa where ssn like '%-1%';
select count(*) from tblinsa where ssn like '%-1%';

--21. tblInsa. 여자 직원만 가져오시오.
select * from tblinsa where substr(ssn,8,1) = 2;
select count(*) from tblinsa where substr(ssn,8,1) = 2;
select * from tblinsa where ssn like '%-2%';
select count(*) from tblinsa where ssn like '%-2%';

--22. tblInsa. 여름에 태어난 직원들을 가져오시오.(7~9월생)
select * from tblinsa;
select * from tblinsa where substr(ssn,3,2) between 7 and 9;

--23. tblInsa. 서울, 인천에 사는 김씨 성을 가진 직원들을 가져오시오.
select * from tblinsa;

--a. 첫번째 방법
select * from tblinsa where city in ('서울','인천') and name like '김%'; 
--b. 두번째 방법
select * from tblinsa where city in ('서울','인천') and substr(name,1,1) = '김';


--24. tblInsa. 영업부/총무부/개발부 직원 중  사원급(사원/대리) 중에 010을 사용하는 직원들을 가져오시오.
select * from tblinsa;
-- 첫번째 방법
select * from tblinsa where buseo in ('영업부','총무부','개발부') and jikwi in ('사원','대리') and substr(TEL,1,3) = '010';
-- 두번째 방법
select * from tblinsa where buseo in ('영업부','총무부','개발부') and jikwi in ('사원','대리') and TEL LIKE '010%';

--25. tblInsa. 서울/인천/경기에 살고 입사일이 2010 ~ 2013년 사이인 직원들을 가져오시오.

--첫번째 방법
SELECT * FROM TBLINSA WHERE CITY IN ('서울','인천','경기') AND SUBSTR(TO_CHAR(IBSADATE),1,2) BETWEEN 10 AND 13;

--두번째 방법
SELECT * FROM TBLINSA WHERE CITY IN ('서울','인천','경기') AND TO_CHAR(IBSADATE,'YYYY') BETWEEN 2010 AND 2013;

--26. employees. 아직 부서가 배정 안된 직원들을 가져오시오.
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;

--27. employees. 해당 테이블에는 직업의 종류가 어떤 것들이 있습니까?
SELECT DISTINCT JOB_ID FROM EMPLOYEES;


--28. employees. 고용일이 2002~2004년 사이인 직원들은 어느 부서에 근무합니까?
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'YYYY') BETWEEN 2002 AND 2004;

--29. employees. 급여가 5000불 이상인 직원들은 담당 매니저가 누구입니까?
SELECT DISTINCT MANAGER_ID FROM EMPLOYEES WHERE SALARY >= 5000;


--30. tblInsa. 남자이며 80년대생은 직급이 어떤 것들이 있습니까?
SELECT * FROM TBLINSA;
SELECT DISTINCT JIKWI FROM TBLINSA WHERE SUBSTR(SSN,8,1) = 1 AND SUBSTR(SSN,1,1) = 8;


SELECT * FROM TABS;

--31. tblInsa. 수당 20만원 넘는 직원들은 어디 삽니까?
SELECT DISTINCT CITY FROM TBLINSA WHERE SUDANG >= 200000;

--32. tblInsa. 연락처가 아직 없는 직원은 어느 부서입니까?
SELECT DISTINCT BUSEO FROM TBLINSA WHERE TEL IS NULL;

--33. tblCountry. 아시아와 유럽에 속한 국가는 총 몇개입니까?
SELECT COUNT(*) FROM TBLCOUNTRY WHERE CONTINENT IN ('AS','EU');

--34. tblCountry. 인구가 5000 ~ 20000 사이인 국가 총 몇개입니까?
SELECT COUNT(*) FROM TBLCOUNTRY WHERE POPULATION BETWEEN 5000 AND 20000;

--35. employees. 직업이 'IT_PROG'인 직원 중에서 급여가 5000불 넘는 직원 몇명입니까?
SELECT COUNT(*) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG' AND SALARY > 5000;

--36. tblInsa. 010이 아닌 번호를 사용하는 직원은 몇명입니까?(연락처가 없는 사람 제외)
SELECT COUNT(*) FROM TBLINSA WHERE TEL IS NOT NULL AND SUBSTR(TEL,1,3) <> '010';

--37. tblInsa. 서울 사람 빼고 나머지는 모두 몇명입니까?
SELECT COUNT(*) FROM TBLINSA WHERE CITY <> '서울';

--38. tblInsa. 남자 직원은 모두 몇명입니까?
SELECT COUNT(*) FROM TBLINSA WHERE SUBSTR(SSN,8,1) = 1;

--39. tblCountry. 유럽과 아프리카에 속한 나라의 모든 인구의 합은?
SELECT SUM(POPULATION) FROM TBLCOUNTRY WHERE CONTINENT IN ('EU','AF');

--40. employees. 매니저(108)이 관리하고 있는 직원들의 급여 총 합은?
SELECT TO_CHAR(SUM(SALARY),'999,999') || '$' AS "급여총합" FROM EMPLOYEES WHERE MANAGER_ID = '108';

--41. employees. 직업이 ST_CLERK, SH_CLERK인 직원들을 급여 총 합은?
SELECT TO_CHAR(SUM(SALARY),'999,999') || '$' AS "직원급여총합" FROM EMPLOYEES WHERE JOB_ID IN ('ST_CLERK','SH_CLERK');

--42. tblInsa. 서울에 있는 직원들의 급여 합은(급여 + 수당)?
SELECT TO_CHAR(SUM(BASICPAY + SUDANG),'999,999,999') || '원' AS "급여 합" FROM TBLINSA WHERE CITY = '서울';

--43. tblInsa. 장급(부장+과장)들의 총 급여 합은?
SELECT SUM(BASICPAY) FROM TBLINSA WHERE JIKWI IN ('과장','부장');

--44. tblCountry. 아시아에 속한 국가의 평균 인구수는?
SELECT AVG(POPULATION) FROM TBLCOUNTRY WHERE CONTINENT = 'AS';

--45. employees. 이름(first_name)에 'NI'이 포함된 직원들의 평균 급여는?(대소문자 구분없이)
SELECT AVG(SALARY) FROM EMPLOYEES WHERE UPPER(FIRST_NAME) LIKE '%NI%';

--46. tblInsa. 간부급(과장,부장)들의 평균 급여는?
SELECT AVG(BASICPAY) FROM TBLINSA WHERE JIKWI IN ('과장','부장');

--47. tblInsa. 사원급(사원,대리)들의 평균 급여는?
SELECT AVG(BASICPAY) FROM TBLINSA WHERE JIKWI IN ('사원','대리');

--48. tblCountry. 면적이 가장 넓은 나라의 면적은?
SELECT MAX(AREA) FROM TBLCOUNTRY;

--49. tblInsa. 급여(급여+수당)가 가장 적게 받는 직원의 금액은?
SELECT MIN(BASICPAY+SUDANG) FROM TBLINSA;

--50. tblInsa. 직원명과 태어난 년도을 가져오되 태어난 년도를 오름차순으로 가져오시오.
SELECT * FROM TBLINSA;
SELECT NAME,'19' || SUBSTR(SSN,1,2) FROM TBLINSA ORDER BY SUBSTR(SSN,1,2) ASC;

--51. tblInsa. 서울에 사는 여직원 중 80년대생 몇명인지?
SELECT COUNT(*) FROM TBLINSA WHERE SUBSTR(SSN,1,1) = '8' AND SUBSTR(SSN,8,1) = '2' AND CITY = '서울';

--52. tblInsa. 간부급(과장/부장)들은 어떤 성(김,이,박..)들이 있는지?
SELECT DISTINCT SUBSTR(NAME,1,1) FROM TBLINSA WHERE JIKWI IN ('과장','부장');

--53. tblInsa. 직원들을 태어난 월순으로 정렬해서 가져오시오.(오름차순 → 월, 이름)
SELECT * FROM TBLINSA ORDER BY SUBSTR(SSN,3,2) ASC, NAME ASC;
SELECT * FROM TBLINSA;

--54. tblInsa. 모든 직원을 남자 → 여자 순으로 정렬해서 가져오시오. (같은 성별끼리는 이름순으로 정렬)
SELECT * FROM TBLINSA ORDER BY SUBSTR(SSN,8,1) ASC, NAME ASC;


--55. employees. 이름(first_name + last_name)이 가장 긴 순서대로 가져오시오.
SELECT * FROM EMPLOYEES ORDER BY LENGTH(FIRST_NAME || LAST_NAME) DESC;








