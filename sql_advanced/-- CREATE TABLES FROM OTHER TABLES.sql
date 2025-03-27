-- CREATE TABLES FROM OTHER TABLES
-- january jobs
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
    MONTH
    FROM job_posted_date
  ) = 1;
-- february jobs
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
    MONTH
    FROM job_posted_date
  ) = 2;
-- march jobs
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
    MONTH
    FROM job_posted_date
  ) = 3;