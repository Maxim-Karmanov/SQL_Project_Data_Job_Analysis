/*
Ответ: Какие навыки являются наиболее востребованными с точки зрения заработной платы?
- Посмотрите на среднюю заработную плату, связанную с каждым навыком для должностей аналитиков данных
- Основное внимание уделяется должностям с определенной заработной платой, независимо от местоположения
- почему? Для анализа данных он показывает, как различные навыки влияют на уровень заработной платы, и
помогает определить наиболее выгодные с финансовой точки зрения навыки, которые следует приобрести или усовершенствовать
*/

SELECT 
    skills,
    round(AVG(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    and salary_year_avg IS NOT NULL
    and job_work_from_home = true
GROUP BY
    skills
ORDER BY
    avg_salary DESC
limit 25

/*

Вот разбивка результатов по наиболее высокооплачиваемым навыкам анализа данных:
- Высокий спрос на навыки работы с большими данными и ML: Самые высокие зарплаты получают аналитики, владеющие технологиями больших данных (PySpark, Couchbase), инструментами машинного обучения (DataRobot, Jupyter) и библиотеками Python (Pandas, NumPy), что отражает высокую оценку отраслью возможностей обработки данных и прогнозного моделирования.
- Навыки разработки и развертывания программного обеспечения: Знание инструментов разработки и развертывания (GitLab, Kubernetes, Airflow) позволяет успешно совмещать анализ данных и инжиниринг, а также навыки, способствующие автоматизации и эффективному управлению конвейером данных.
- Опыт работы в облачных вычислениях: Знакомство с облачными технологиями и инструментами разработки данных (Elasticsearch, Databricks, GCP) подчеркивает растущую важность облачных аналитических сред, что позволяет предположить, что владение облачными технологиями значительно повышает потенциал получения прибыли в сфере анализа данных.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/