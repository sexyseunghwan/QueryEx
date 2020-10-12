
--1. tblInsa. 80���� ���� �������� ��� ����(basicpay)���� �� ���� �޴� 80���� ���������� ����Ͻÿ�.(subquery)

SELECT * FROM TBLINSA WHERE SUBSTR(SSN,8,1) = '2' AND SUBSTR(SSN,1,1) = '8' AND BASICPAY >= (SELECT AVG(BASICPAY) FROM TBLINSA WHERE SUBSTR(SSN,8,1) = '1' AND SUBSTR(SSN,1,1) = '8');

--2. tblStaff, tblProject. ���� �������� ��� ������ �̸�, �ּ�, ����, ���������Ʈ���� ����Ͻÿ�.(join)
-- inner join �� outer join ���迡 ���� �����غ���.
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
        


--3. tblVideo, tblRent, tblMember. '�ǻ��ұ��' ��� ������ ������ ȸ���� �̸�?(join)

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
                    WHERE TV.NAME = '�ǻ��ұ��';


select m.name from tblVideo v
		inner join tblRent r
				on v.seq = r.video
						inner join tblMember m
								on m.seq = r.member
										where v.name = '�ǻ��ұ��';
                                        
--4. tblInsa. ��� �̻��� ������ �޴� ������?(subquery)
SELECT NAME,BASICPAY FROM TBLINSA WHERE BASICPAY >= (SELECT AVG(BASICPAY) FROM TBLINSA);


--7. tblVideo. '�й̳�����' ������ �ѹ��̶� �������� ȸ������ �̸�?(join)
SELECT * FROM TBLVIDEO;
SELECT * FROM TBLRENT;
SELECT * FROM TBLMEMBER;




