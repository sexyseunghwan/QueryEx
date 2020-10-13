
--1. tblInsa. 80년대생 남자 직원들의 평균 월급(basicpay)보다 더 많이 받는 80년대생 여직원들을 출력하시오.(subquery)

SELECT * FROM TBLINSA WHERE SUBSTR(SSN,8,1) = '2' AND SUBSTR(SSN,1,1) = '8' AND BASICPAY >= (SELECT AVG(BASICPAY) FROM TBLINSA WHERE SUBSTR(SSN,8,1) = '1' AND SUBSTR(SSN,1,1) = '8');

--2. tblStaff, tblProject. 현재 재직중인 모든 직원의 이름, 주소, 월급, 담당프로젝트명을 출력하시오.(join)
-- inner join 과 outer join 관계에 대해 생각해보자.
SELECT * FROM TBLSTAFF;
SELECT * FROM TBLPROJECT; 

SELECT * FROM TBLSTAFF TS 
    INNER JOIN TBLPROJECT TP
        ON TS.SEQ = TP.STAFF;

SELECT TS.NAME,TS.ADDRESS,TS.SALARY,TP.PROJECT FROM TBLSTAFF TS
    LEFT OUTER JOIN TBLPROJECT TP
        ON TS.SEQ = TP.STAFF;

SELECT TS.NAME,TS.ADDRESS,TS.SALARY,TP.PROJECT FROM TBLSTAFF TS
    RIGHT OUTER JOIN TBLPROJECT TP
        ON TS.SEQ = TP.STAFF; 
        


--3. tblVideo, tblRent, tblMember. '뽀뽀할까요' 라는 비디오를 빌려간 회원의 이름?(join)

SELECT * FROM TBLVIDEO;
SELECT * FROM TBLRENT;
SELECT * FROM TBLMEMBER;

SELECT 
    TM.NAME
FROM TBLVIDEO TV
    INNER JOIN TBLRENT TR
        ON TV.SEQ = TR.VIDEO
            INNER JOIN TBLMEMBER TM
                ON TM.SEQ = TR.MEMBER
                    WHERE TV.NAME = '뽀뽀할까요';


select m.name from tblVideo v
		inner join tblRent r
				on v.seq = r.video
						inner join tblMember m
								on m.seq = r.member
										where v.name = '뽀뽀할까요';
                                        
--4. tblInsa. 평균 이상의 월급을 받는 직원들?(subquery)
SELECT NAME,BASICPAY FROM TBLINSA WHERE BASICPAY >= (SELECT AVG(BASICPAY) FROM TBLINSA);


--7. tblVideo. '털미네이터' 비디오를 한번이라도 빌려갔던 회원들의 이름?(join)
SELECT * FROM TBLVIDEO;
SELECT * FROM TBLRENT;
SELECT * FROM TBLMEMBER;

SELECT * FROM TBLVIDEO TV
    INNER JOIN TBLRENT TR
        ON TV.SEQ = TR.VIDEO
            INNER JOIN TBLMEMBER TM
                ON TM.SEQ = TR.MEMBER
                    WHERE TV.NAME = '털미네이터';


--8. tblStaff, tblProject. 서울시에 사는 직원을 제외한 나머지 직원들의 이름, 월급, 담당프로젝트명을 출력하시오.(join) 
SELECT * FROM TBLSTAFF;
SELECT * FROM TBLPROJECT;

--8.1 모든 직원들의 정보가 필요할때
SELECT TS.NAME,TS.SALARY,TP.PROJECT,TS.ADDRESS FROM TBLSTAFF TS
    LEFT OUTER JOIN TBLPROJECT TP
        ON TS.SEQ = TP.STAFF
            WHERE TS.ADDRESS <> '서울시';
            
--8.2 프로젝트 수주받은 직원들의 정보만이 필요할 경우.
select s.name as sname, s.salary, p.project as pname from tblStaff s
		inner join tblProject p
				on s.seq = p.staff
						where s.address <> '서울시';


--9. tblCustomer, tblSales. 상품을 2개(단일상품) 이상 구매한 회원의 연락처, 이름, 구매상품명, 수량 출력하시오.(join)
SELECT * FROM TBLCUSTOMER;
SELECT * FROM TBLSALES;

SELECT * FROM TBLCUSTOMER TC
    INNER JOIN TBLSALES TS
        ON TC.SEQ = TS.CSEQ
            WHERE TS.QTY >= 2;


--10. tblVideo,TBLGENRE. 모든 비디오 제목, 보유수량, 대여가격을 출력하시오.(join)
SELECT * FROM TBLVIDEO;
SELECT * FROM TBLGENRE;

SELECT TV.NAME,TV.QTY,TG.PRICE FROM TBLVIDEO TV
    INNER JOIN TBLGENRE TG
        ON TV.GENRE = TG.SEQ;
        
--11. tblVideo,tblrent,tblmember,tblgenre 2007년 2월에 대여된 구매내역을 출력하시오. 회원명, 비디오명, 언제, 대여가격을 가져오시오.(join)
SELECT * FROM TBLVIDEO;
SELECT * FROM TBLRENT;
SELECT * FROM TBLMEMBER;
SELECT * FROM TBLGENRE;


SELECT SUBSTR(RENTDATE,1,5) FROM TBLRENT;

SELECT TM.NAME,TV.NAME,TR.RENTDATE,TG.PRICE FROM TBLVIDEO TV
    INNER JOIN TBLRENT TR
        ON TV.SEQ = TR.VIDEO
            INNER JOIN TBLMEMBER TM
                ON TM.SEQ = TR.MEMBER
                    INNER JOIN TBLGENRE TG
                        ON TG.SEQ = TV.GENRE
                    WHERE SUBSTR(TR.RENTDATE,1,5) = '07/02';

--13. tblInsa. basicpay+sudang가 100만원 미만, 100만원 이상~200만원 미만, 200만원 이상인 직원들의 수 출력하시오.(groupby)(*** 막힌 문제)
SELECT * FROM TBLINSA;

SELECT DECODE(FLOOR((BASICPAY+SUDANG)/1000000),0,'100만원이하',1,'100~200사이',2,'200이상','이외'),COUNT(*) FROM TBLINSA GROUP BY FLOOR((BASICPAY+SUDANG)/1000000) ORDER BY FLOOR((BASICPAY+SUDANG)/1000000);

--14. tblInsa. 주민번호를 가지고 생년월일의 년도별 직원수 출력하시오.(group by)
SELECT '19' ||SUBSTR(SSN,1,2),COUNT(*) FROM TBLINSA GROUP BY SUBSTR(SSN,1,2) ORDER BY SUBSTR(SSN,1,2);

--15. tblInsa. 주민번호를 기준으로 월별 오름차순, 월이 같으면 년도 내림차순 출력하시오.(이름, 주민번호). SUBSTR() 함수 이용.(orderby)
SELECT * FROM TBLINSA ORDER BY SUBSTR(SSN,3,2) ASC, SUBSTR(SSN,1,2) DESC;

--16. tblInsa. 입사일을 기준으로  월별 오름차순, 월이 같으면 년도 내림차순 출력하시오.(orderby)
    -- 첫번째 풀이방법
    SELECT * FROM TBLINSA ORDER BY SUBSTR(IBSADATE,4,2) ASC, SUBSTR(IBSADATE,1,2) DESC;
    -- 두번째 풀이방법
    SELECT * FROM TBLINSA ORDER BY TO_CHAR(IBSADATE,'MM') ASC, TO_CHAR(IBSADATE,'YY') DESC;

--17. tblInsa. 전체인원수, 남자인원수, 여자인원수를 동시 출력하시오.(count+decode)(***)
    SELECT COUNT(*) AS "전체인원수" FROM TBLINSA;
    
    SELECT COUNT(*) AS "전체인원수",
            COUNT(DECODE(SUBSTR(SSN,8,1),1,1)) AS "남자",
            COUNT(DECODE(SUBSTR(SSN,8,1),2,1)) AS "여자"
        FROM TBLINSA;
    
--18. tblInsa. 개발부, 영업부, 총무부 인원수 출력하시오.(count+decode)
SELECT * FROM TBLINSA;

SELECT COUNT(DECODE(BUSEO,'개발부',1)) AS "개발부",
        COUNT(DECODE(BUSEO,'영업부',1)) AS "영업부",
        COUNT(DECODE(BUSEO,'총무부',1)) AS "총무부"
    FROM TBLINSA;

--19. tblInsa. 서울 사람의 남자와 여자의 기본급합을 출력하시오.(decode+group by)
SELECT * FROM TBLINSA;

SELECT DECODE(SUBSTR(SSN,8,1),1,'남자',2,'여자'),TO_CHAR(SUM(BASICPAY),'999,999,999') FROM TBLINSA WHERE CITY = '서울' GROUP BY DECODE(SUBSTR(SSN,8,1),1,'남자',2,'여자');


--20. tblInsa. 부서별 남자와 여자 인원수를 출력하시오.(decode+group by)

SELECT BUSEO,COUNT(DECODE(SUBSTR(SSN,8,1),1,1)) AS "남자", COUNT(DECODE(SUBSTR(SSN,8,1),2,1)) AS "여자" FROM TBLINSA GROUP BY BUSEO;




