--  Remove trailing spaces from the "Employee Name";
-- Update table with the correct value;

SELECT RTRIM(LTRIM(Name)) AS Name
FROM Employee
UPDATE Employee
SET Name = RTRIM(LTRIM(Name))



-- Remove dash from the "Name";

SELECT REPLACE(Name, '-', '')
FROM Employee
UPDATE Employee
SET Name = REPLACE(Name, '-', '')



-- Create new text column for the "Job Type";
-- Get the "Job Type";

ALTER TABLE Employee
ADD JobType varchar(50)
UPDATE Employee
SET JobType = IIF(FTE=1,'Full Time','Part Time')



-- Get the "Cost Centre" from the "ID";

ALTER TABLE Employee
ADD CostCentre varchar(50)
SELECT LEFT(ID,2) AS CostCentre
FROM Employee
UPDATE Employee
SET CostCentre = LEFT(ID,2)



-- Extract 5 characters from the "ID" column, starting in position 3;

SELECT SUBSTRING(ID, 3, 5)
FROM Employee
UPDATE Employee
SET ID = SUBSTRING(ID, 3, 5)



-- 	Convert datetime to date type 105;

UPDATE Employee
SET Date = CONVERT(NVARCHAR(255),CONVERT(SMALLDATETIME, Date,105))
ALTER TABLE Employee
ALTER COLUMN Date SMALLDATETIME

UPDATE Employee
SET Date = CONVERT(NVARCHAR(255),CONVERT(DATE, Date,105))
ALTER TABLE Employee
ALTER COLUMN Date DATE



-- Get the City from the column "Work location";

ALTER TABLE Employee
ADD City nvarchar(255)
UPDATE Employee
SET City = LTRIM(SUBSTRING([Work location], CHARINDEX(',', [Work location]) +1, LEN([Work location])))



-- Remove "Remote" from the City column and replace with '-';

UPDATE Employee
SET City = IIF(City = 'Remote', '-', City)

--OR

SELECT REPLACE(City, 'Remote', '-')
FROM Employee











