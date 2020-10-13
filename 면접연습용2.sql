
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

SELECT * FROM TBLVIDEO TV
    INNER JOIN TBLRENT TR
        ON TV.SEQ = TR.VIDEO
            INNER JOIN TBLMEMBER TM
                ON TM.SEQ = TR.MEMBER
                    WHERE TV.NAME = '�й̳�����';


--8. tblStaff, tblProject. ����ÿ� ��� ������ ������ ������ �������� �̸�, ����, ���������Ʈ���� ����Ͻÿ�.(join) 
SELECT * FROM TBLSTAFF;
SELECT * FROM TBLPROJECT;

--8.1 ��� �������� ������ �ʿ��Ҷ�
SELECT TS.NAME,TS.SALARY,TP.PROJECT,TS.ADDRESS FROM TBLSTAFF TS
    LEFT OUTER JOIN TBLPROJECT TP
        ON TS.SEQ = TP.STAFF
            WHERE TS.ADDRESS <> '�����';
            
--8.2 ������Ʈ ���ֹ��� �������� �������� �ʿ��� ���.
select s.name as sname, s.salary, p.project as pname from tblStaff s
		inner join tblProject p
				on s.seq = p.staff
						where s.address <> '�����';


--9. tblCustomer, tblSales. ��ǰ�� 2��(���ϻ�ǰ) �̻� ������ ȸ���� ����ó, �̸�, ���Ż�ǰ��, ���� ����Ͻÿ�.(join)
SELECT * FROM TBLCUSTOMER;
SELECT * FROM TBLSALES;

SELECT * FROM TBLCUSTOMER TC
    INNER JOIN TBLSALES TS
        ON TC.SEQ = TS.CSEQ
            WHERE TS.QTY >= 2;


--10. tblVideo,TBLGENRE. ��� ���� ����, ��������, �뿩������ ����Ͻÿ�.(join)
SELECT * FROM TBLVIDEO;
SELECT * FROM TBLGENRE;

SELECT TV.NAME,TV.QTY,TG.PRICE FROM TBLVIDEO TV
    INNER JOIN TBLGENRE TG
        ON TV.GENRE = TG.SEQ;
        
--11. tblVideo,tblrent,tblmember,tblgenre 2007�� 2���� �뿩�� ���ų����� ����Ͻÿ�. ȸ����, ������, ����, �뿩������ �������ÿ�.(join)
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

--13. tblInsa. basicpay+sudang�� 100���� �̸�, 100���� �̻�~200���� �̸�, 200���� �̻��� �������� �� ����Ͻÿ�.(groupby)(*** ���� ����)
SELECT * FROM TBLINSA;

SELECT DECODE(FLOOR((BASICPAY+SUDANG)/1000000),0,'100��������',1,'100~200����',2,'200�̻�','�̿�'),COUNT(*) FROM TBLINSA GROUP BY FLOOR((BASICPAY+SUDANG)/1000000) ORDER BY FLOOR((BASICPAY+SUDANG)/1000000);

--14. tblInsa. �ֹι�ȣ�� ������ ��������� �⵵�� ������ ����Ͻÿ�.(group by)
SELECT '19' ||SUBSTR(SSN,1,2),COUNT(*) FROM TBLINSA GROUP BY SUBSTR(SSN,1,2) ORDER BY SUBSTR(SSN,1,2);

--15. tblInsa. �ֹι�ȣ�� �������� ���� ��������, ���� ������ �⵵ �������� ����Ͻÿ�.(�̸�, �ֹι�ȣ). SUBSTR() �Լ� �̿�.(orderby)
SELECT * FROM TBLINSA ORDER BY SUBSTR(SSN,3,2) ASC, SUBSTR(SSN,1,2) DESC;

--16. tblInsa. �Ի����� ��������  ���� ��������, ���� ������ �⵵ �������� ����Ͻÿ�.(orderby)
    -- ù��° Ǯ�̹��
    SELECT * FROM TBLINSA ORDER BY SUBSTR(IBSADATE,4,2) ASC, SUBSTR(IBSADATE,1,2) DESC;
    -- �ι�° Ǯ�̹��
    SELECT * FROM TBLINSA ORDER BY TO_CHAR(IBSADATE,'MM') ASC, TO_CHAR(IBSADATE,'YY') DESC;

--17. tblInsa. ��ü�ο���, �����ο���, �����ο����� ���� ����Ͻÿ�.(count+decode)(***)
    SELECT COUNT(*) AS "��ü�ο���" FROM TBLINSA;
    
    SELECT COUNT(*) AS "��ü�ο���",
            COUNT(DECODE(SUBSTR(SSN,8,1),1,1)) AS "����",
            COUNT(DECODE(SUBSTR(SSN,8,1),2,1)) AS "����"
        FROM TBLINSA;
    
--18. tblInsa. ���ߺ�, ������, �ѹ��� �ο��� ����Ͻÿ�.(count+decode)
SELECT * FROM TBLINSA;

SELECT COUNT(DECODE(BUSEO,'���ߺ�',1)) AS "���ߺ�",
        COUNT(DECODE(BUSEO,'������',1)) AS "������",
        COUNT(DECODE(BUSEO,'�ѹ���',1)) AS "�ѹ���"
    FROM TBLINSA;

--19. tblInsa. ���� ����� ���ڿ� ������ �⺻������ ����Ͻÿ�.(decode+group by)
SELECT * FROM TBLINSA;

SELECT DECODE(SUBSTR(SSN,8,1),1,'����',2,'����'),TO_CHAR(SUM(BASICPAY),'999,999,999') FROM TBLINSA WHERE CITY = '����' GROUP BY DECODE(SUBSTR(SSN,8,1),1,'����',2,'����');


--20. tblInsa. �μ��� ���ڿ� ���� �ο����� ����Ͻÿ�.(decode+group by)

SELECT BUSEO,COUNT(DECODE(SUBSTR(SSN,8,1),1,1)) AS "����", COUNT(DECODE(SUBSTR(SSN,8,1),2,1)) AS "����" FROM TBLINSA GROUP BY BUSEO;




