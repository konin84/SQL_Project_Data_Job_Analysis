-- CASE EXPRESSION IN SQL
/*
 Label new column as following:
 - 'Anywhere' jobs as 'Remote'
 - 'New York, NY' as 'Local'
 - Otherwise 'Onsite'
 */
SELECT job_title_short,
  job_location,
  CASE
    WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
  END AS location_category
FROM job_postings_fact
LIMIT 10;
-- NUMBER OF JOB PER location category where job_title_short = 'Data Analyst'
SELECT count(job_id) AS number_of_jobs,
  CASE
    WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
  END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;