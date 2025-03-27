-- UNION 
/*
 -- Notes: 
 . UNION -combines results from two or more SELECT statements
 . They need to have the same amount of columns, and the data type must match
 SELECT column_name FROM table_one
 UNION -- combines the two tables
 SELECT column_name FROM table_two
 . Gets rid of duplicate rows(unlike UNION ALL)
 . All rows are unique
 . UNION ALL does not get ride of duplicate rows
 */
-- Get january jobs
SELECT job_title_short,
  company_id,
  job_location
FROM january_jobs
UNION
-- Get february jobs
SELECT job_title_short,
  company_id,
  job_location
FROM february_jobs
UNION
-- Get march jobs
SELECT job_title_short,
  company_id,
  job_location
FROM march_jobs;
/*
 Find job postings from the first quarter that have a salary greater than $70K
 - Combine job posting tables from first quarter of 2023(Jan-Mar)
 - Get job posting with an average yearly salary > $70K
 */


SELECT 
job_title_short,
job_location,
job_posted_date::DATE,
salary_year_avg
FROM (
    -- Get january jobs
    SELECT *
    FROM january_jobs
    UNION ALL
    -- Get february jobs
    SELECT *
    FROM february_jobs
    UNION ALL
    -- Get march jobs
    SELECT *
    FROM march_jobs
  ) AS quarter_one_job_postings
  WHERE salary_year_avg > 70000 AND
  job_title_short = 'Data Analyst'
  ORDER BY salary_year_avg DESC
  ;


