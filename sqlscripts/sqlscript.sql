-- Check if the database exists, and create it if it does not
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'sqldb')
BEGIN
    CREATE DATABASE sqldb;
END
GO

-- Switch to the new database context
USE sqldb;
GO

-- Create the Departments table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Departments')
BEGIN
    CREATE TABLE Departments (
        DepartmentID INT PRIMARY KEY IDENTITY(1,1),  -- Primary key with auto-increment
        DepartmentName NVARCHAR(100) NOT NULL        -- Department name, not nullable
    );
END
GO

-- Create the Employees table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Employees')
BEGIN
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
END
GO
