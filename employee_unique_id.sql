-- Problem: Show each employee's unique ID if available, otherwise NULL.

-- Create table Employees
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create table EmployeeUNI
CREATE TABLE EmployeeUNI (
    id INT,
    unique_id INT,
    PRIMARY KEY (id, unique_id)
);

-- Query: Retrieve unique_id for each employee (NULL if not available)
SELECT 
    EmployeeUNI.unique_id,
    Employees.name
FROM 
    Employees
LEFT JOIN 
    EmployeeUNI
ON 
    Employees.id = EmployeeUNI.id;
