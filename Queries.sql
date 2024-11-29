-- SQL JOINs
-- This query demonstrates a JOIN between the Employee and Company tables to show which employee works for which company.
SELECT Employee.name AS EmployeeName, Company.name AS CompanyName
FROM Employee
JOIN Company ON Employee.company_id = Company.id;

-- Inner Join
-- This query returns only employees who are assigned to a company (an inner join between Employee and Company).
SELECT Employee.name AS EmployeeName, Company.name AS CompanyName
FROM Employee
INNER JOIN Company ON Employee.company_id = Company.id;

-- Left Join
-- This query returns all employees and their company names. If no company is assigned, it will show NULL.
SELECT Employee.name AS EmployeeName, Company.name AS CompanyName
FROM Employee
LEFT JOIN Company ON Employee.company_id = Company.id;

-- Right Join
-- This query returns all companies and the employees working for them. If a company has no employees, it will show NULL.
SELECT Employee.name AS EmployeeName, Company.name AS CompanyName
FROM Employee
RIGHT JOIN Company ON Employee.company_id = Company.id;

-- Full Join
-- This query returns all employees and all companies. If an employee is not assigned to a company, or a company has no employees, it will show NULL.
SELECT Employee.name AS EmployeeName, Company.name AS CompanyName
FROM Employee
FULL JOIN Company ON Employee.company_id = Company.id;

-- Self Join
-- This query finds employees who work for the same company.
SELECT E1.name AS Employee1, E2.name AS Employee2, Company.name AS CompanyName
FROM Employee E1
JOIN Employee E2 ON E1.company_id = E2.company_id
JOIN Company ON E1.company_id = Company.id
WHERE E1.id <> E2.id;

-- Union
-- This query combines the names of all teachers and employees into a single list.
SELECT name FROM Teacher
UNION
SELECT name FROM Employee;

-- Group By
-- This query counts how many employees each company has.
SELECT Company.name, COUNT(Employee.id) AS EmployeeCount
FROM Company
LEFT JOIN Employee ON Company.id = Employee.company_id
GROUP BY Company.name;

-- Having
-- This query shows companies with more than 2 employees.
SELECT Company.name, COUNT(Employee.id) AS EmployeeCount
FROM Company
LEFT JOIN Employee ON Company.id = Employee.company_id
GROUP BY Company.name
HAVING COUNT(Employee.id) > 2;

-- Exists
-- This query checks if there are any students who are assigned to a teacher with a specific email.
SELECT name
FROM Student
WHERE EXISTS (
    SELECT 1
    FROM Teacher
    WHERE Teacher.email = 'antonia@cifpfbmoll.eu' AND Teacher.id = Student.teacher_id
);

-- Any
-- This query returns students who have a teacher assigned, and the teacher's id matches any of the provided teacher ids.
SELECT name
FROM Student
WHERE teacher_id = ANY (SELECT id FROM Teacher WHERE email LIKE '%@cifpfbmoll.eu');

-- All
-- This query returns students who have a teacher assigned, and the teacher's id matches all of the provided teacher ids.
SELECT name
FROM Student
WHERE teacher_id = ALL (SELECT id FROM Teacher WHERE email LIKE '%@cifpfbmoll.eu');

-- Select Into
-- This query creates a new table with the names and emails of all teachers.
SELECT name, email
INTO TeacherDetails
FROM Teacher;

-- Insert Into Select
-- This query inserts data from the Employee table into a new table called EmployeeBackup.
CREATE TABLE EmployeeBackup (id INT, name VARCHAR(250), email VARCHAR(250), company_id INT);
INSERT INTO EmployeeBackup (id, name, email, company_id)
SELECT id, name, email, company_id
FROM Employee;

-- Case
-- This query uses a CASE statement to categorize students based on the number of students they are assigned to.
SELECT name, 
       CASE
           WHEN id <= 5 THEN 'First Group'
           WHEN id <= 10 THEN 'Second Group'
           ELSE 'Third Group'
       END AS GroupCategory
FROM Student;

-- Null Functions
-- This query demonstrates the use of COALESCE to replace NULL values in the phone_number column with a default value.
SELECT name, COALESCE(phone_number, 'No phone number available') AS PhoneNumber
FROM Student;
