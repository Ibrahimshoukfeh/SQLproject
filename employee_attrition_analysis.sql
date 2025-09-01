-- Total number of employees
SELECT COUNT(*) AS total_employees
FROM employee_attrition;

-- Count of employees by department
SELECT d.department, COUNT(*) AS count
FROM employee_attrition e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department
ORDER BY count DESC;

-- Total employees and attrition rate per department
SELECT 
    d.department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM employee_attrition e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department
ORDER BY attrition_rate_percent DESC;

-- Total employees and attrition rate per job role
SELECT
    j.job_role,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM employee_attrition e
JOIN job_roles j ON e.job_role_id = j.job_role_id
GROUP BY j.job_role
ORDER BY attrition_rate_percent DESC;

-- Count of employees by job role
SELECT j.job_role, COUNT(*) AS count
FROM employee_attrition e
JOIN job_roles j ON e.job_role_id = j.job_role_id
GROUP BY j.job_role
ORDER BY count DESC;

-- Count of employees by education field
SELECT ed.education_field, COUNT(*) AS count
FROM employee_attrition e
JOIN education_fields ed ON e.education_field_id = ed.education_field_id
GROUP BY ed.education_field
ORDER BY count DESC;

-- Total attrition counts
SELECT Attrition, COUNT(*) AS count
FROM employee_attrition
GROUP BY Attrition;

SELECT d.department, e.Attrition, COUNT(*) AS count
FROM employee_attrition e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department, e.Attrition
ORDER BY d.department, e.Attrition;

-- Total employees and attrition rate per department
SELECT 
    d.department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM employee_attrition e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department
ORDER BY attrition_rate_percent DESC;

-- Total employees and attrition rate per job role
SELECT
    j.job_role,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM employee_attrition e
JOIN job_roles j ON e.job_role_id = j.job_role_id
GROUP BY j.job_role
ORDER BY attrition_rate_percent DESC;

-- Total employees and attrition rate per education field
SELECT
  ed.education_field AS education_field,
  COUNT(*) AS total_employees,
  SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
  ROUND(
    (SUM(CASE WHEN e.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
    2
  ) AS attrition_rate_percent
FROM employee_attrition e
JOIN education_fields ed ON e.education_field_id = ed.education_field_id
GROUP BY ed.education_field
ORDER BY attrition_rate_percent DESC;

-- Satisfaction Engagement by Department
SELECT 
    d.department,
    
    ROUND(AVG(CASE e.job_satisfaction
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END), 2) AS AvgJobSatisfaction,
    
    ROUND(AVG(CASE e.environment_satisfaction
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END), 2) AS AvgEnvironmentSatisfaction,
    
    ROUND(AVG(CASE e.relationship_satisfaction
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END), 2) AS AvgRelationshipSatisfaction,
    
    ROUND(AVG(CASE e.job_involvement
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END), 2) AS AvgJobInvolvement,
    
    ROUND(AVG(CASE e.work_life_balance
        WHEN 'Bad' THEN 1
        WHEN 'Good' THEN 2
        WHEN 'Better' THEN 3
        WHEN 'Best' THEN 4
    END), 2) AS AvgWorkLifeBalance

FROM employee_attrition e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department
ORDER BY AvgJobSatisfaction DESC;

-- Satisfaction Engagement by Job Role
SELECT 
    jr.job_role,
    
    ROUND(AVG(CASE e.job_satisfaction
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END), 2) AS AvgJobSatisfaction,
    
    ROUND(AVG(CASE e.environment_satisfaction
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END), 2) AS AvgEnvironmentSatisfaction,
    
    ROUND(AVG(CASE e.relationship_satisfaction
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END), 2) AS AvgRelationshipSatisfaction,
    
    ROUND(AVG(CASE e.job_involvement
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END), 2) AS AvgJobInvolvement,
    
    ROUND(AVG(CASE e.work_life_balance
        WHEN 'Bad' THEN 1
        WHEN 'Good' THEN 2
        WHEN 'Better' THEN 3
        WHEN 'Best' THEN 4
    END), 2) AS AvgWorkLifeBalance

FROM employee_attrition e
JOIN job_roles jr ON e.job_role_id = jr.job_role_id
GROUP BY jr.job_role
ORDER BY AvgJobSatisfaction DESC;

-- Work-Life Balance Attrition Relationship
SELECT 
    e.work_life_balance,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    ROUND(
        SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2) AS AttritionRate
FROM employee_attrition e
GROUP BY e.work_life_balance
ORDER BY 
    CASE e.work_life_balance
        WHEN 'Bad' THEN 1
        WHEN 'Good' THEN 2
        WHEN 'Better' THEN 3
        WHEN 'Best' THEN 4
    END;

-- Job Satisfaction vs Attrition
SELECT 
    e.job_satisfaction,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    ROUND(
        SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2) AS AttritionRate
FROM employee_attrition e
GROUP BY e.job_satisfaction
ORDER BY 
    CASE e.job_satisfaction
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END;

-- Tenure Promotion vs Attrition
SELECT 
    attrition,
    ROUND(AVG(years_sice_last_promotion), 1) AS avg_years_since_last_promotion,
    COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY attrition
ORDER BY avg_years_since_last_promotion DESC;

-- Average Tenure Promotion by Department
SELECT 
    d.department,
    ROUND(AVG(e.years_at_company), 1) AS avg_years_at_company,
    ROUND(AVG(e.years_sice_last_promotion), 1) AS avg_years_since_last_promotion,
    COUNT(*) AS employee_count
FROM employee_attrition e
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department
ORDER BY d.department;

-- Average Tenure Promotion by JOb Role
SELECT 
    j.job_role,
    ROUND(AVG(e.years_at_company), 1) AS avg_years_at_company,
    ROUND(AVG(e.years_sice_last_promotion), 1) AS avg_years_since_last_promotion,
    COUNT(*) AS employee_count
FROM employee_attrition e
JOIN job_roles j
    ON e.job_role_id = j.job_role_id
GROUP BY j.job_role
ORDER BY j.job_role;

-- Promotion Delay vs Attrition Rate
WITH b AS (
  SELECT
    CASE
      WHEN years_sice_last_promotion = 0 THEN '0 years'
      WHEN years_sice_last_promotion BETWEEN 1 AND 2 THEN '1–2 years'
      WHEN years_sice_last_promotion BETWEEN 3 AND 5 THEN '3–5 years'
      ELSE '6+ years'
    END AS promo_delay_bucket,
    attrition
  FROM employee_attrition
)
SELECT
  promo_delay_bucket,
  ROUND(AVG(CASE WHEN attrition = 'Yes' THEN 1.0 ELSE 0 END) * 100, 2) AS attrition_rate_pct,
  COUNT(*) AS employee_count
FROM b
GROUP BY promo_delay_bucket
ORDER BY promo_delay_bucket ASC;




