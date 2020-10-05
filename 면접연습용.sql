--1
select * from tblcountry;

--2
select name,capital from tblcountry;


 
select * from tblCountry;

--3
select 
    name as "[������]", 
    capital as "[������]",
    population as "[�α���]",
    continent as "[����]",
    area as "[���]"
    from tblCountry;
    
--4
select * from tblCountry;

select  
    '������ : ' || name,
    '������ : ' || capital,
    '�α��� : ' || population,
    '��� : ' || continent,
    '���� : ' || area
from tblCountry;


--5
select * from employees;

select 
    first_name || ' ' || last_name as "[�̸�]",
    email || '@GMAIl.COM' as "[�̸���]",
    phone_number as "[����ó]",
    '$ ' || salary as "[�޿�]"
from employees;

--6
select * from tblCountry where area <= 100;

--7
select * from tblCountry where continent = 'AS' or continent = 'EU';

--7 �ٸ����
select * from tblCountry where continent in ('AS','EU');

--8 employees. ����(job_id)�� ���α׷���(it_prog)�� ������ �̸�(Ǯ����)�� ����ó �������ÿ�.
select * from employees;

select 
    first_name || last_name,
    phone_number
    from employees
    where job_id = 'IT_PROG';

--9 employees.  last_name�� 'Grant'�� ������ �̸�, ����ó, ��볯¥�� �������ÿ�.

select 
    first_name || last_name,
    phone_number,
    hire_date
from hr.employees
    where last_name = 'Grant';

--10  employees. Ư�� �Ŵ���(120)�� �����ϴ� ������ �̸�, �޿�, ����ó�� �������ÿ�.
select * from employees;

select 
    first_name || ' ' || last_name,
    '$ ' || salary,
    phone_number
from employees
    where manager_id = 120;

--�ٸ� ������� Ǯ��
select 
    first_name || ' ' || last_name,
    to_char(salary,'999,999'),
    phone_number
from employees
    where manager_id = 120;

--select to_char(124333,'999,999') from dual; �����Ѱ�.

--11. employees. Ư�� �μ�(60, 80, 100)�� ���� �������� �̸�, ����ó, �̸���, �μ�ID �������ÿ�.

select * from employees;

select 
    first_name || ' ' || last_name as "�̸�",
    phone_number as "����ó",
    email as "�̸���",
    department_id as "�μ�ID"
from employees
    where department_id in (60,80,100);



--12. tblInsa. ��ȹ�� �������� ��� �������ÿ�.
select * from tblinsa;

select * from tblinsa where buseo = '��ȹ��';


--��� ����.. -> **�Ǳ���� ����**
select * from employees;
select 
    department_id as "�μ���",
    employee_id as "���",
    first_name || ' ' || last_name as "����",
    hire_date as "�Ի���",
    to_char(salary ,'999,999.99') || '$' as "����",
    (select to_char(avg(salary),'999,999.99') || '$' from employees) as "ȸ�� ��� ����"
from employees
    where salary > (select avg(salary) from employees)
        order by "�μ���" asc, "�Ի���" desc, "����" asc;



--13. tblInsa. ���￡ �ִ� ������ �� ������ ������ ����� �̸�, ����, ��ȭ��ȣ�� �������ÿ�. 
select 
    name as "�̸�",
    jikwi as "����",
    tel as "��ȭ��ȣ"
from tblinsa where city = '����';

--14. tblInsa. �⺻�޿� + ���� ���ļ� 150���� �̻��� ���� �� ���￡ ������ �������ÿ�.
select * from tblinsa where basicpay + sudang >= 1500000 and city = '����';

--15. tblInsa. ������ 15���� ������ ���� �� ������ ���, �븮�� �������ÿ�.
select * from tblinsa where sudang <= 150000 and jikwi in ('���','�븮');

--16. tblInsa. ������ ������ �⺻ ������ 2õ���� �̻�, ����, ���� ����(����)�� �������ÿ� : ������ �� �о�� ��ž�..!!
select * from tblinsa where (basicpay*12) >= 20000000 and city = '����' and jikwi in ('����','����');

--17. tblCountry. ������ 'O��'�� ���� �������ÿ�.
select * from tblcountry;
-- a. ������ �α��� 
select * from tblcountry where name like '_��';
-- b. ������ ���ڼ� �������.
select * from tblcountry where name like '%��';

--18. employees. ����ó�� '515'�� �����ϴ� �������� �������ÿ�.
-- ù��° ���
select * from employees where phone_number like '515%';

-- �ι�° ���
select * from employees where instr(phone_number,'515') = 1;
--instr �̶� �ش� ���忡�� �ش� �ܾ ã�� �� �ε����� ��ȯ�Ѵ�.

select instr('apple','p') from dual;

--19. employees. ���� ID�� 'SA'�� �����ϴ� �������� �������ÿ�.
select * from employees;
--a.
select * from employees where job_id like 'SA%';
select count(*) from employees where job_id like 'SA%';
--b.
select * from employees where instr(job_id,'SA') = 1;
select count(*) from employees where instr(job_id,'SA') = 1;

--19. employees. first_name�� 'de'�� �� �������� �������ÿ�.(��ҹ��� �������)
select * from employees;

select * from employees where lower(first_name) like '%de%';

--20. tblInsa. ���� ������ �������ÿ�.
select * from tblinsa;

--a. ù��° ���
select * from tblinsa where substr(ssn,8,1) = 1;
select count(*) from tblinsa where substr(ssn,8,1) = 1;
--b. �ι�° ���
select * from tblinsa where ssn like '%-1%';
select count(*) from tblinsa where ssn like '%-1%';

--21. tblInsa. ���� ������ �������ÿ�.
select * from tblinsa where substr(ssn,8,1) = 2;
select count(*) from tblinsa where substr(ssn,8,1) = 2;
select * from tblinsa where ssn like '%-2%';
select count(*) from tblinsa where ssn like '%-2%';

--22. tblInsa. ������ �¾ �������� �������ÿ�.(7~9����)
select * from tblinsa;
select * from tblinsa where substr(ssn,3,2) between 7 and 9;

--23. tblInsa. ����, ��õ�� ��� �达 ���� ���� �������� �������ÿ�.
select * from tblinsa;

--a. ù��° ���
select * from tblinsa where city in ('����','��õ') and name like '��%'; 
--b. �ι�° ���
select * from tblinsa where city in ('����','��õ') and substr(name,1,1) = '��';


--24. tblInsa. ������/�ѹ���/���ߺ� ���� ��  �����(���/�븮) �߿� 010�� ����ϴ� �������� �������ÿ�.
select * from tblinsa;
-- ù��° ���
select * from tblinsa where buseo in ('������','�ѹ���','���ߺ�') and jikwi in ('���','�븮') and substr(TEL,1,3) = '010';
-- �ι�° ���
select * from tblinsa where buseo in ('������','�ѹ���','���ߺ�') and jikwi in ('���','�븮') and TEL LIKE '010%';

--25. tblInsa. ����/��õ/��⿡ ��� �Ի����� 2010 ~ 2013�� ������ �������� �������ÿ�.

--ù��° ���
SELECT * FROM TBLINSA WHERE CITY IN ('����','��õ','���') AND SUBSTR(TO_CHAR(IBSADATE),1,2) BETWEEN 10 AND 13;

--�ι�° ���
SELECT * FROM TBLINSA WHERE CITY IN ('����','��õ','���') AND TO_CHAR(IBSADATE,'YYYY') BETWEEN 2010 AND 2013;

--26. employees. ���� �μ��� ���� �ȵ� �������� �������ÿ�.
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;

--27. employees. �ش� ���̺��� ������ ������ � �͵��� �ֽ��ϱ�?
SELECT DISTINCT JOB_ID FROM EMPLOYEES;


--28. employees. ������� 2002~2004�� ������ �������� ��� �μ��� �ٹ��մϱ�?
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'YYYY') BETWEEN 2002 AND 2004;

--29. employees. �޿��� 5000�� �̻��� �������� ��� �Ŵ����� �����Դϱ�?
SELECT DISTINCT MANAGER_ID FROM EMPLOYEES WHERE SALARY >= 5000;


--30. tblInsa. �����̸� 80������ ������ � �͵��� �ֽ��ϱ�?
SELECT * FROM TBLINSA;
SELECT DISTINCT JIKWI FROM TBLINSA WHERE SUBSTR(SSN,8,1) = 1 AND SUBSTR(SSN,1,1) = 8;


SELECT * FROM TABS;

--31. tblInsa. ���� 20���� �Ѵ� �������� ��� ��ϱ�?
SELECT DISTINCT CITY FROM TBLINSA WHERE SUDANG >= 200000;

--32. tblInsa. ����ó�� ���� ���� ������ ��� �μ��Դϱ�?
SELECT DISTINCT BUSEO FROM TBLINSA WHERE TEL IS NULL;

--33. tblCountry. �ƽþƿ� ������ ���� ������ �� ��Դϱ�?
SELECT COUNT(*) FROM TBLCOUNTRY WHERE CONTINENT IN ('AS','EU');

--34. tblCountry. �α��� 5000 ~ 20000 ������ ���� �� ��Դϱ�?
SELECT COUNT(*) FROM TBLCOUNTRY WHERE POPULATION BETWEEN 5000 AND 20000;

--35. employees. ������ 'IT_PROG'�� ���� �߿��� �޿��� 5000�� �Ѵ� ���� ����Դϱ�?
SELECT COUNT(*) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG' AND SALARY > 5000;

--36. tblInsa. 010�� �ƴ� ��ȣ�� ����ϴ� ������ ����Դϱ�?(����ó�� ���� ��� ����)
SELECT COUNT(*) FROM TBLINSA WHERE TEL IS NOT NULL AND SUBSTR(TEL,1,3) <> '010';

--37. tblInsa. ���� ��� ���� �������� ��� ����Դϱ�?
SELECT COUNT(*) FROM TBLINSA WHERE CITY <> '����';

--38. tblInsa. ���� ������ ��� ����Դϱ�?
SELECT COUNT(*) FROM TBLINSA WHERE SUBSTR(SSN,8,1) = 1;

--39. tblCountry. ������ ������ī�� ���� ������ ��� �α��� ����?
SELECT SUM(POPULATION) FROM TBLCOUNTRY WHERE CONTINENT IN ('EU','AF');

--40. employees. �Ŵ���(108)�� �����ϰ� �ִ� �������� �޿� �� ����?
SELECT TO_CHAR(SUM(SALARY),'999,999') || '$' AS "�޿�����" FROM EMPLOYEES WHERE MANAGER_ID = '108';

--41. employees. ������ ST_CLERK, SH_CLERK�� �������� �޿� �� ����?
SELECT TO_CHAR(SUM(SALARY),'999,999') || '$' AS "�����޿�����" FROM EMPLOYEES WHERE JOB_ID IN ('ST_CLERK','SH_CLERK');

--42. tblInsa. ���￡ �ִ� �������� �޿� ����(�޿� + ����)?
SELECT TO_CHAR(SUM(BASICPAY + SUDANG),'999,999,999') || '��' AS "�޿� ��" FROM TBLINSA WHERE CITY = '����';

--43. tblInsa. ���(����+����)���� �� �޿� ����?
SELECT SUM(BASICPAY) FROM TBLINSA WHERE JIKWI IN ('����','����');

--44. tblCountry. �ƽþƿ� ���� ������ ��� �α�����?
SELECT AVG(POPULATION) FROM TBLCOUNTRY WHERE CONTINENT = 'AS';

--45. employees. �̸�(first_name)�� 'NI'�� ���Ե� �������� ��� �޿���?(��ҹ��� ���о���)
SELECT AVG(SALARY) FROM EMPLOYEES WHERE UPPER(FIRST_NAME) LIKE '%NI%';

--46. tblInsa. ���α�(����,����)���� ��� �޿���?
SELECT AVG(BASICPAY) FROM TBLINSA WHERE JIKWI IN ('����','����');

--47. tblInsa. �����(���,�븮)���� ��� �޿���?
SELECT AVG(BASICPAY) FROM TBLINSA WHERE JIKWI IN ('���','�븮');

--48. tblCountry. ������ ���� ���� ������ ������?
SELECT MAX(AREA) FROM TBLCOUNTRY;

--49. tblInsa. �޿�(�޿�+����)�� ���� ���� �޴� ������ �ݾ���?
SELECT MIN(BASICPAY+SUDANG) FROM TBLINSA;

--50. tblInsa. ������� �¾ �⵵�� �������� �¾ �⵵�� ������������ �������ÿ�.
SELECT * FROM TBLINSA;
SELECT NAME,'19' || SUBSTR(SSN,1,2) FROM TBLINSA ORDER BY SUBSTR(SSN,1,2) ASC;

--51. tblInsa. ���￡ ��� ������ �� 80���� �������?
SELECT COUNT(*) FROM TBLINSA WHERE SUBSTR(SSN,1,1) = '8' AND SUBSTR(SSN,8,1) = '2' AND CITY = '����';

--52. tblInsa. ���α�(����/����)���� � ��(��,��,��..)���� �ִ���?
SELECT DISTINCT SUBSTR(NAME,1,1) FROM TBLINSA WHERE JIKWI IN ('����','����');

--53. tblInsa. �������� �¾ �������� �����ؼ� �������ÿ�.(�������� �� ��, �̸�)
SELECT * FROM TBLINSA ORDER BY SUBSTR(SSN,3,2) ASC, NAME ASC;
SELECT * FROM TBLINSA;

--54. tblInsa. ��� ������ ���� �� ���� ������ �����ؼ� �������ÿ�. (���� ���������� �̸������� ����)
SELECT * FROM TBLINSA ORDER BY SUBSTR(SSN,8,1) ASC, NAME ASC;


--55. employees. �̸�(first_name + last_name)�� ���� �� ������� �������ÿ�.
SELECT * FROM EMPLOYEES ORDER BY LENGTH(FIRST_NAME || LAST_NAME) DESC;








