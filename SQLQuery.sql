create database bd
use bd
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);



INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(1, 'John', 'Doe', 'HR', 50000.00, '2020-01-15'),
(2, 'Jane', 'Smith', 'Finance', 60000.00, '2019-03-23'),
(3, 'Alice', 'Johnson', 'IT', 75000.00, '2021-07-10'),
(4, 'Bob', 'Brown', 'Marketing', 55000.00, '2018-09-30'),
(5, 'Charlie', 'Davis', 'IT', 70000.00, '2022-02-20');


CREATE TABLE Departments (
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments (DepartmentName, Location)
VALUES
('HR', 'Building A'),
('Finance', 'Building B'),
('IT', 'Building C'),
('Marketing', 'Building D');




-- Select employees from IT department, ordered by salary
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Department = 'IT'
ORDER BY Salary DESC;


-- INNER JOIN example: show employee names and their department locations
SELECT e.FirstName, e.LastName, d.Location
FROM Employees e
INNER JOIN Departments d ON e.Department = d.DepartmentName;

-- Employees earning more than the average salary
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Average salary per department
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;


-- View to list high-earning employees
CREATE VIEW HighEarners AS
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 60000;

SELECT * FROM HighEarners;


-- Add index on Department to speed up filtering
CREATE INDEX idx_department ON Employees(Department);


