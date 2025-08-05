USE library;
-- Drop table if it already exists
DROP TABLE IF EXISTS Students;

-- Step 1: Create Table
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100) DEFAULT NULL
);

-- Step 2: Insert Data
INSERT INTO Students (id, name, age, email)
VALUES (1, 'John Doe', 21, 'john@example.com');

-- Insert with missing email (will be NULL due to DEFAULT)
INSERT INTO Students (id, name, age)
VALUES (2, 'Jane Smith', 22);

-- Insert NULL explicitly
INSERT INTO Students (id, name, age, email)
VALUES (3, 'Amit Kumar', 20, NULL);

-- Step 3: Update Data
-- Update email for Jane
UPDATE Students
SET email = 'jane@example.com'
WHERE id = 2;

-- Update multiple rows: increase age by 1 for all
UPDATE Students
SET age = age + 1
WHERE age is not null ;

-- Step 4: Delete Data
-- Delete one student
DELETE FROM Students
WHERE id = 1;

-- Step 5: Insert using SELECT (requires another table - sample given below)
-- Create temporary table
DROP TABLE IF EXISTS Temp_Students;
CREATE TABLE Temp_Students (
    temp_id INT,
    temp_name VARCHAR(100),
    temp_age INT
);

INSERT INTO Temp_Students VALUES (4, 'Ravi Kumar', 23);
INSERT INTO Temp_Students VALUES (5, 'Sita Devi', 24);

-- Insert using SELECT
INSERT INTO Students (id, name, age)
SELECT temp_id, temp_name, temp_age FROM Temp_Students;

-- Step 6: ON DELETE CASCADE example
-- Parent Table
DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

-- Child Table with ON DELETE CASCADE
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE CASCADE
);

-- Insert into parent and child
INSERT INTO Departments VALUES (1, 'HR'), (2, 'IT');
INSERT INTO Employees VALUES (101, 'Anjali', 1), (102, 'Rahul', 2);

-- Delete from parent to test CASCADE
DELETE FROM Departments WHERE dept_id = 1;
-- This will automatically delete employee with dept_id = 1 (Anjali)
-- SET SQL_SAFE_UPDATES = 0;
select * from students;

