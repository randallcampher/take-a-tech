-- DATA CLEANING & PREPROCESSING

-- a. Checking for Null Values in feedback_data table
-- This query checks the feedback_data table for any rows where essential fields have NULL values.
-- Specifically, it identifies rows missing feedbackid, productid, returndate, returnreason, or customerfeedback data.
SELECT * 
FROM feedback_data
WHERE feedbackid IS NULL
   OR productid IS NULL
   OR returndate IS NULL
   OR returnreason IS NULL
   OR customerfeedback IS NULL;

-- b. Checking for Null Values in product_data table
-- This query checks the product_data table for any rows missing values in critical columns:
-- productid, productcategory, or productattributes.
SELECT * 
FROM product_data
WHERE productid IS NULL
   OR productcategory IS NULL
   OR productattributes IS NULL;

-- c. Checking for Null Values in sales_data table
-- This query checks for rows in the sales_data table with NULL values in required columns:
-- saleid, productid, salesdate, salesvolume, or revenuegenerated.
SELECT * 
FROM sales_data
WHERE saleid IS NULL
   OR productid IS NULL
   OR salesdate IS NULL
   OR salesvolume IS NULL
   OR revenuegenerated IS NULL;

-- d. Changing the data type of returndate column to DATE
-- Alters the returndate column in the feedback_data table to enforce a DATE data type, 
-- ensuring that only date-formatted entries are allowed in this field.
ALTER TABLE feedback_data
MODIFY COLUMN returndate DATE;

-- e. Changing the data type of salesdate column to DATE
-- Alters the salesdate column in the sales_data table to the DATE data type for consistent date handling.
ALTER TABLE sales_data
MODIFY COLUMN salesdate DATE;

-- f. Checking for duplicate feedbackid in feedback_data table
-- This query identifies duplicate feedbackid entries in feedback_data by counting each unique feedbackid
-- and displaying those that appear more than once.
SELECT feedbackid,
       COUNT(*) AS duplicate_count
FROM feedback_data
GROUP BY feedbackid
HAVING COUNT(*) > 1;

-- g. Checking for duplicate productid in product_data table
-- Identifies duplicate productid entries in product_data by grouping by productid
-- and selecting those with a count greater than one.
SELECT productid,
       COUNT(*) AS duplicate_count
FROM product_data
GROUP BY productid
HAVING COUNT(*) > 1;

-- h. Checking for duplicate saleid in sales_data table
-- Identifies duplicate saleid entries in the sales_data table, as each sale should have a unique saleid.
SELECT saleid,
       COUNT(*) AS duplicate_count
FROM sales_data
GROUP BY saleid
HAVING COUNT(*) > 1;
