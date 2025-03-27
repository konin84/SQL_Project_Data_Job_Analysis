-- CREATE DATABASE
CREATE DATABASE job_applied;
-- SELECT ALL DATA
SELECT *
FROM job_applied;
-- ADD NEW COLUMN
ALTER TABLE job_applied
add contact varchar(50);
-- CHANGE COLUMN NAME
ALTER TABLE job_applied
  RENAME COLUMN contact to contact_name;
-- CHANGE COLUMN DATA TYPE
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;
-- DROP COLUMN
ALTER TABLE job_applied DROP COLUMN other_contact;
-- DROP TABLE
DROP TABLE job_applied;
-- DROP DATABASE
DROP DATABASE IF EXISTS sql_course;
