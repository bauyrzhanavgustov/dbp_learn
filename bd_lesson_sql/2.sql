#Показать работников, у которых нет почты или почта не в корпоративном домене (dualbootpartners.com):
SELECT *
FROM Employees
WHERE Email IS NULL OR Email NOT LIKE '%@dualbootpartners.com';

#Получить список работников, нанятых в последние 30 дней:
SELECT *
FROM Employees
WHERE Hire_date >= DATE('now', '-30 days');

#Найти максимальную и минимальную зарплату по каждому департаменту:
SELECT Department_id,
       MAX(Salary) AS Max_Salary,
       MIN(Salary) AS Min_Salary
FROM Employees
GROUP BY Department_id;

#Посчитать количество работников в каждом регионе:
SELECT r.Name AS Region_Name,
       COUNT(e.id) AS Employee_Count
FROM Employees e
JOIN Departments d ON e.Department_id = d.id
JOIN Locations l ON d.Location_id = l.id
JOIN Regions r ON l.Region_id = r.id
GROUP BY r.Name;

#Показать сотрудников, у которых фамилия длиннее 10 символов:
SELECT *
FROM Employees
WHERE LENGTH(Last_name) > 10;

#Показать сотрудников с зарплатой выше средней по всей компании:
WITH Avg_Salary AS (
    SELECT AVG(Salary) AS Average_Salary
    FROM Employees
)
SELECT *
FROM Employees
WHERE Salary > (SELECT Average_Salary FROM Avg_Salary);
