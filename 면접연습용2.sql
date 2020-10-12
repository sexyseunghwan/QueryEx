
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




