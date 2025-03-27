-- HANDLING DATES AND TIMES
-- SELECTING DATE WITH TIMESTAMP
SELECT job_title_short AS title,
  job_location AS location,
  job_posted_date AS date
FROM job_postings_fact
LIMIT 10;
-- SELECTING ONLY DATE
SELECT job_title_short AS title,
  job_location AS location,
  job_posted_date::DATE AS date
FROM job_postings_fact
LIMIT 10;
-- WORKING WITH TIME ZONE
SELECT job_title_short AS title,
  job_location AS location,
  job_posted_date AS date_time_utc,
  job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time_est
FROM job_postings_fact
LIMIT 5;
-- EXTRACT - get field (e.g. year, month, day) from a date/time value
SELECT job_title_short AS title,
  job_location AS location,
  job_posted_date AS date_time,
  EXTRACT(
    MONTH
    FROM job_posted_date
  ) AS date_month,
  EXTRACT(
    YEAR
    FROM job_posted_date
  ) AS date_year
FROM job_postings_fact
LIMIT 10;
-- Get number of job posted by month
SELECT COUNT(job_id),
  EXTRACT(
    MONTH
    FROM job_posted_date
  ) AS job_posted_by_month
FROM job_postings_fact
GROUP BY job_posted_by_month;

-- Get number of job posted by year
SELECT COUNT(job_id),
  EXTRACT(
    YEAR
    FROM job_posted_date
  ) AS job_posted_by_year
FROM job_postings_fact
GROUP BY job_posted_by_year;

-- Get number of job posted by month per particular field
SELECT COUNT(job_id) AS job_count_by_job_id,
  EXTRACT(
    MONTH
    FROM job_posted_date
  ) AS job_posted_by_month

FROM job_postings_fact
WHERE 
job_title_short = 'Data Analyst'
GROUP BY job_posted_by_month
ORDER BY job_count_by_job_id DESC;
