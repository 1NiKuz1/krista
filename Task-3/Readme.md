### Задание 3 (На отчеты)

В любом онлайн редакторе SQL например (https://sqliteonline.com/) выполнить скрипт

```sql
--DROP TABLE Department;
--DROP TABLE Employee;

CREATE TABLE Department (
	ID NUMBER NOT NULL PRIMARY KEY,
  	NAME VARCHAR(255)
);

INSERT INTO Department (ID, NAME) VALUES (1, "Dep1");
INSERT INTO Department (ID, NAME) VALUES (2, "Dep2");
INSERT INTO Department (ID, NAME) VALUES (3, "Dep3");
INSERT INTO Department (ID, NAME) VALUES (4, "Dep4");

CREATE TABLE Employee (
	ID NUMBER NOT NULL PRIMARY KEY,
  	DEPARTMENT_ID NUMBER,
  	CHIEF_ID NUMBER,
  	NAME VARCHAR(255),
  	SALARY INTEGER,
  	FOREIGN KEY (DEPARTMENT_ID) REFERENCES Department(ID)
  	FOREIGN KEY (CHIEF_ID) REFERENCES Employee(ID)
);

INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (1, 1, null, "Bob", 1000);
INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (2, 1, 1, "Bob Jr", 100);
INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (3, 1, 1, "Bob Jr 1", 3000);
INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (4, 1, 1, "Bob Jr 2", 50);

INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (10, 2, null, "Robert", 10000);
INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (11, 2, 10, "Sean", 1000);
INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (12, 2, 10, "Olga", 8000);
INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (13, 2, 10, "Nataly", 15000);
INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (14, 2, 10, "Stan", 4000);

INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (22, 3,  null, "Maria", 100000);
INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (23, 3, 22, "Bob Jr 2", 20000);

INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (33, 4, null, "Rodrigo", 60000);
INSERT INTO Employee (ID, department_id, chief_id, name, salary)
VALUES (34, 4, null, "Dilan", 60000);
```

И написать запросы

1. Вывести список сотрудников, получающих заработную плату большую чем у непосредственного руководителя
2. Вывести список сотрудников, получающих максимальную заработную плату в своем отделе
3. Вывести список ID отделов, количество сотрудников в которых не превышает 3 человек
4. Вывести список сотрудников, не имеющих назначенного руководителя, работающего в том-же отделе
5. Найти список ID отделов с максимальной суммарной зарплатой сотрудников

## Решение

Вывести список сотрудников, получающих заработную плату большую чем у непосредственного руководителя

```sql
SELECT E2.ID, D.NAME AS 'Департамент', E1.NAME AS 'Имя руководителя', E1.SALARY AS 'Зарплата руководителя',
E2.NAME AS 'Имя сотрудника', E2.SALARY  AS 'Зарплата сотрудника'
FROM Employee as E1
INNER JOIN Employee as E2
ON E1.ID = E2.CHIEF_ID AND E2.SALARY > E1.SALARY
INNER JOIN Department as D
ON E1.DEPARTMENT_ID = D.ID
```

Вывести список сотрудников, получающих максимальную заработную плату в своем отделе

```sql
WITH MAX_SALARIES AS (
    SELECT DEPARTMENT_ID, MAX(SALARY) AS MaxSalary
    FROM Employee
    GROUP BY DEPARTMENT_ID
)
SELECT E.ID, E.NAME AS 'Имя сотрудника', E.SALARY AS 'Зарплата',  D.NAME AS 'Департамент'
FROM Employee AS E
INNER JOIN MAX_SALARIES AS MS
ON E.DEPARTMENT_ID = MS.DEPARTMENT_ID AND E.SALARY = MS.MaxSalary
INNER JOIN Department as D
ON E.DEPARTMENT_ID = D.ID
```

Вывести список ID отделов, количество сотрудников в которых не превышает 3 человек

```sql
SELECT E.DEPARTMENT_ID, COUNT(E.NAME) AS 'Количество человек'
FROM Employee AS E
GROUP BY E.DEPARTMENT_ID
HAVING COUNT(E.NAME) <= 3
```

Вывести список сотрудников, не имеющих назначенного руководителя, работающего в том-же отделе

```sql
SELECT *
FROM Employee as E
WHERE E.DEPARTMENT_ID NOT IN (
	SELECT E.DEPARTMENT_ID
	FROM Employee as E
	WHERE E.CHIEF_ID IS NOT NULL
	GROUP BY E.DEPARTMENT_ID
)
```

Найти список ID отделов с максимальной суммарной зарплатой сотрудников

```sql
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
```
