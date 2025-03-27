-- SUBQUERIES and CTEs
/*
 Subqueries and Common Table Expressions (CTEs): Used for organizing and simplifying complex queries.
 . Helps break down the query into smaller, more manageable parts
 . When to use one over the other?
 . Subqueries are for simpler queries
 . CTEs are for more complex queries
 */
-- Subqueries: query nested inside a larger queri=y
-- It can be used in SELECT, FROM and WHERE clauses.
SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (
        MONTH
        FROM job_posted_date
      ) = 1
  ) AS january_jobs;
SELECT company_id,
  name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
  );
-- CTEs
WITH february_jobs AS(
  SELECT *
  FROM job_postings_fact
  WHERE EXTRACT(
      MONTH
      FROM job_posted_date
    ) = 2
);
/*
 Find the companies that have the most job openings.
 - Get the total number of job postings per company id(job_postings_fact)
 - Return the total number of jobs with the company name (company_dim)
 */
WITH company_job_count AS(
  SELECT company_id,
    count(*) AS total_jobs
  FROM job_postings_fact
  GROUP BY company_id
)
SELECT company_dim.name AS company_name,
  company_job_count.total_jobs
FROM company_dim
  LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs desc;
/*
 Find the count of the number of remote job postings per skill
 - Display the top 5 skills by their demand in remote jobs
 - Include skill ID, name, and count of postings requiring the skill
 - job_title_short = 'Data Analyst from job_postings_fact table
 */
WITH remote_job_skills AS(
  SELECT skill_id,
    count(*) skill_count
  FROM skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
  WHERE job_postings.job_work_from_home = true
    AND job_postings.job_title_short = 'Data Analyst'
  GROUP BY skill_id
)
SELECT skills.skill_id,
  skills AS skill_name,
  skill_count
FROM remote_job_skills
  INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY skill_count desc
limit 5;