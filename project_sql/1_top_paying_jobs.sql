/*
Вопрос: Какие самые высокооплачиваемые вакансии для аналитиков данных?
- Определить 10 самых высокооплачиваемых ролей Аналитика данных (Data Analyst), которые доступны для удаленной работы.
- Сфокусироваться на вакансиях с указанными зарплатами (исключить записи, где зарплата не указана).
- Зачем? Выявить самые высокооплачиваемые возможности для Аналитиков данных, предоставив информацию о перспективах трудоустройства.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' and salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10