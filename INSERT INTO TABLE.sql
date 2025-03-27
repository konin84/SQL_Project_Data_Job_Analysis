INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_file_sent,
    cover_letter_file_name,
    status
  )
VALUES (
    4,
    '2025-03-26',
    true,
    'resume_04.pdf',
    false,
    NULL,
    'submited'
  ),
  (
    5,
    '2025-03-26',
    false,
    NULL,
    true,
    'cover_letter_02.pdf',
    'pending'
  ),
  (
    6,
    '2025-03-26',
    false,
    NULL,
    false,
    NULL,
    'rejeted'
  )
UPDATE job_applied
SET contact = 'Erlich Bachman'
WHERE job_id = 1;
UPDATE job_applied
SET contact = 'Dinesh Chugtai'
WHERE job_id = 2;
UPDATE job_applied
SET contact = 'Bertram Gilfoyle'
WHERE job_id = 3;
UPDATE job_applied
SET contact = 'Jian Yang'
WHERE job_id = 4;
UPDATE job_applied
SET contact = 'Big Head'
WHERE job_id = 5;
UPDATE job_applied
SET contact = 'Drink Water'
WHERE job_id = 6;