-- Create a new database called testdb
CREATE DATABASE MyNewDatabase;
GO

-- Switch to the new database context
USE MyNewDatabase;
GO

-- Create a new table called Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),  -- Primary key with auto-increment
    FirstName NVARCHAR(50) NOT NULL,           -- First name, not nullable
    LastName NVARCHAR(50) NOT NULL,            -- Last name, not nullable
    BirthDate DATE,                            -- Birth date
    HireDate DATE NOT NULL,                    -- Hire date, not nullable
    Email NVARCHAR(100) UNIQUE,                -- Email, must be unique
    Salary DECIMAL(18, 2) CHECK (Salary > 0),  -- Salary, must be greater than 0
    DepartmentID INT,                          -- Foreign key to Departments table
    CONSTRAINT FK_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
