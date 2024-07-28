--�1 ������� ������ �����������, ���������� ���������� ����� ������� ��� � ����������������� ������������
SELECT E2.ID, D.NAME AS '�����������', E1.NAME AS '��� ������������', E1.SALARY AS '�������� ������������', 
E2.NAME AS '��� ����������', E2.SALARY  AS '�������� ����������'
FROM Employee as E1
INNER JOIN Employee as E2
ON E1.ID = E2.CHIEF_ID AND E2.SALARY > E1.SALARY
INNER JOIN Department as D
ON E1.DEPARTMENT_ID = D.ID

--�2 ������� ������ �����������, ���������� ������������ ���������� ����� � ����� ������
WITH MAX_SALARIES AS (
    SELECT DEPARTMENT_ID, MAX(SALARY) AS MaxSalary
    FROM Employee
    GROUP BY DEPARTMENT_ID
)
SELECT E.ID, E.NAME AS '��� ����������', E.SALARY AS '��������',  D.NAME AS '�����������'
FROM Employee AS E
INNER JOIN MAX_SALARIES AS MS
ON E.DEPARTMENT_ID = MS.DEPARTMENT_ID AND E.SALARY = MS.MaxSalary
INNER JOIN Department as D
ON E.DEPARTMENT_ID = D.ID

--�3 ������� ������ ID �������, ���������� ����������� � ������� �� ��������� 3 �������
SELECT E.DEPARTMENT_ID, COUNT(E.NAME) AS '���������� �������'
FROM Employee AS E
GROUP BY E.DEPARTMENT_ID
HAVING COUNT(E.NAME) <= 3

--�4 ������� ������ �����������, �� ������� ������������ ������������, ����������� � ���-�� ������
SELECT *
FROM Employee as E
WHERE E.DEPARTMENT_ID NOT IN (
	SELECT E.DEPARTMENT_ID
	FROM Employee as E
	WHERE E.CHIEF_ID IS NOT NULL
	GROUP BY E.DEPARTMENT_ID
)

--�5 ����� ������ ID ������� � ������������ ��������� ��������� �����������
WITH DEPARTAMENT_SUM_SALARIES AS (
	SELECT E.DEPARTMENT_ID, SUM(E.SALARY) AS SUM_SALARY
	FROM Employee as E
	GROUP BY E.DEPARTMENT_ID

)
SELECT DS.DEPARTMENT_ID
FROM DEPARTAMENT_SUM_SALARIES AS DS
WHERE DS.SUM_SALARY IN (
	SELECT MAX(DS.SUM_SALARY)
	FROM DEPARTAMENT_SUM_SALARIES AS DS
)




