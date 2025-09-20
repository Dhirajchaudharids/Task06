-- Step 1: Create Database
CREATE DATABASE StudentDB;
USE StudentDB;

-- Step 2: Create Tables
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Class VARCHAR(50)
);

CREATE TABLE Subjects (
    SubjectID INT AUTO_INCREMENT PRIMARY KEY,
    SubjectName VARCHAR(100) NOT NULL
);

CREATE TABLE Marks (
    MarkID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    MarksObtained INT,
    MaxMarks INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID) ON DELETE CASCADE
);

CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    Date DATE,
    Status ENUM('Present','Absent') NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);

-- Step 3: Insert Sample Data
INSERT INTO Students (Name, Class) VALUES
('Ravi Kumar', '10-A'),
('Priya Sharma', '10-A'),
('Amit Verma', '10-B'),
('Sneha Patel', '10-B');

INSERT INTO Subjects (SubjectName) VALUES
('Mathematics'), ('Science'), ('English'), ('History');

INSERT INTO Marks (StudentID, SubjectID, MarksObtained, MaxMarks) VALUES
(1, 1, 78, 100), (1, 2, 85, 100), (1, 3, 65, 100), (1, 4, 72, 100),
(2, 1, 92, 100), (2, 2, 88, 100), (2, 3, 79, 100), (2, 4, 81, 100),
(3, 1, 60, 100), (3, 2, 55, 100), (3, 3, 70, 100), (3, 4, 66, 100),
(4, 1, 40, 100), (4, 2, 50, 100), (4, 3, 45, 100), (4, 4, 52, 100);

INSERT INTO Attendance (StudentID, Date, Status) VALUES
(1, '2025-09-01', 'Present'), (1, '2025-09-02', 'Absent'),
(2, '2025-09-01', 'Present'), (2, '2025-09-02', 'Present'),
(3, '2025-09-01', 'Absent'), (3, '2025-09-02', 'Present'),
(4, '2025-09-01', 'Present'), (4, '2025-09-02', 'Absent');

-- =========================================================
-- Step 4: Queries for Reports
-- =========================================================

-- 1️⃣ Show all inserted data
SELECT * FROM Students;
SELECT * FROM Subjects;
SELECT * FROM Marks;
SELECT * FROM Attendance;

-- 2️⃣ Average percentage of marks per student
SELECT s.Name, s.Class,
       ROUND(AVG(m.MarksObtained * 100.0 / m.MaxMarks), 2) AS AvgPercentage
FROM Students s
JOIN Marks m ON s.StudentID = m.StudentID
GROUP BY s.StudentID;

-- 3️⃣ Attendance percentage per student
SELECT s.Name, s.Class,
       ROUND(SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS AttendancePercentage
FROM Students s
JOIN Attendance a ON s.StudentID = a.StudentID
GROUP BY s.StudentID;

-- 4️⃣ Students with attendance lower than 70%
SELECT s.Name, s.Class,
       ROUND(SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS AttendancePercentage
FROM Students s
JOIN Attendance a ON s.StudentID = a.StudentID
GROUP BY s.StudentID
HAVING AttendancePercentage < 70;
