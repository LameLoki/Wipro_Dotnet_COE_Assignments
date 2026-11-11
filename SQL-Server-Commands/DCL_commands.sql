
-- 1. Create Student Table
CREATE TABLE Student
(
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    Marks INT
);

-- Insert Sample Records
INSERT INTO Student
VALUES
(1, 'Rahul', 'Bhopal', 85),
(2, 'Amit', 'Indore', 75),
(3, 'Priya', 'Bhopal', 90);

-- 2. GRANT SELECT Permission
GRANT SELECT ON Student TO user1;

-- 3. REVOKE INSERT Permission
REVOKE INSERT ON Student FROM user1;

-- 4 & 5. Create Log Table
CREATE TABLE StudentLog
(
    Message VARCHAR(100),
    LogDate DATETIME
);

-- Create AFTER INSERT Trigger
CREATE TRIGGER trg_Student_Insert
ON Student
AFTER INSERT
AS
BEGIN
    INSERT INTO StudentLog
    SELECT 'New Student Added', GETDATE()
    FROM inserted;
END;

-- Test Trigger
INSERT INTO Student
VALUES (4, 'Neha', 'Delhi', 88);

-- Check Log
SELECT * FROM StudentLog;

-- 6. Clustered Index
-- Run only if Student does not already have one
CREATE CLUSTERED INDEX IX_Student_Id
ON Student(Id);

-- 7. Non-Clustered Index
CREATE NONCLUSTERED INDEX IX_Student_Name
ON Student(Name);

-- Search Using Index
SELECT *
FROM Student
WHERE Name = 'Rahul';

-- 8. Create View
CREATE VIEW StudentView
AS
SELECT Name, Marks
FROM Student;

-- Display View
SELECT * FROM StudentView;

-- 9. Alter View
ALTER VIEW StudentView
AS
SELECT Name, City, Marks
FROM Student;

-- Display Updated View
SELECT * FROM StudentView;

-- 10. Delete View
DROP VIEW StudentView;
