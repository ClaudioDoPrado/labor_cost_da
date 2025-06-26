-- Use the database named 'labor_da'
USE labor_da;

-- Select all data from 'hours_department' table
SELECT * FROM hours_department;

-- Change column names with datatype VARCHAR(50)
ALTER TABLE hours_department
CHANGE service service_hrs VARCHAR(50),
CHANGE kitchen kitchen_hrs VARCHAR(50),
CHANGE dishwasher dishwasher_hrs VARCHAR(50);
    
-- Show the structure (columns) of 'hours_department' table
SHOW COLUMNS FROM hours_department;   
    
-- Ensure working in the same database
USE labor_da;

-- Select all data from 'labor_percentage' table
SELECT * FROM labor_percentage;

-- Change column names with datatype VARCHAR(50)
ALTER TABLE labor_percentage
CHANGE service service_per VARCHAR(50),
CHANGE kitchen kitchen_per VARCHAR(50),
CHANGE dishwasher dishwasher_per VARCHAR(50);

-- Show the structure (columns) of 'labor_percentage' table
SHOW COLUMNS FROM labor_percentage; 

-- Create a new table 'labor_da_join' by joining 'hours_department' and 'labor_percentage' on 'date'
CREATE TABLE labor_da_join AS
SELECT 
    hours_department.date,
    hours_department.service_hrs,
	hours_department.kitchen_hrs,
    hours_department.dishwasher_hrs,
    labor_percentage.service_per,
    labor_percentage.kitchen_per,
    labor_percentage.dishwasher_per
FROM hours_department
JOIN labor_percentage ON hours_department.date = labor_percentage.date;

-- Select all data from the new aggregate table    
USE labor_da;
SELECT * FROM labor_da_join;

-- Add a new column 'total_hrs' as INTEGER
ALTER TABLE labor_da_join 
ADD total_hrs INT;

-- Add a new column 'total_per' as DECIMAL(5,2)
ALTER TABLE labor_da_join 
ADD total_per DECIMAL (5,2);

-- Modify 'total_per' column to be of type INT (drop decimal precision)
ALTER TABLE labor_da_join
MODIFY total_per INT;

-- Update 'total_hrs' and 'total_per' by summing corresponding columns
UPDATE labor_da_join
SET 
    total_hrs = service_hrs + kitchen_hrs + dishwasher_hrs,
    total_per = service_per + kitchen_per + dishwasher_per;
    
-- Select the sums to verify
SELECT total_hrs, total_per FROM labor_da_join;

-- Describe the structure of 'labor_da_join'
DESCRIBE labor_da_join;

-- Change the datatype of service, kitchen, dishwasher hours and percentages to INT
ALTER TABLE labor_da_join
MODIFY service_hrs INT,
MODIFY kitchen_hrs INT,
MODIFY dishwasher_hrs INT,
MODIFY service_per INT,
MODIFY kitchen_per INT,
MODIFY dishwasher_per INT;

-- Review structure after modification
DESCRIBE labor_da_join;

-- Show first 5 rows in 'labor_da_join'
SELECT * FROM labor_da_join LIMIT 5;

-- Commit all changes (if in a transactional environment)
COMMIT;

-- Check how many rows were affected by the last statement
SELECT ROW_COUNT();

-- Fetch rows where total_hrs or total_per are NULL (to verify if updates saved correctly)
SELECT date, service_hrs, kitchen_hrs, dishwasher_hrs, total_hrs, total_per
FROM labor_da_join
WHERE total_hrs IS NULL OR total_per IS NULL;
    
-- Disable safe update mode to allow updates without a WHERE clause    
SET SQL_SAFE_UPDATES = 0;

