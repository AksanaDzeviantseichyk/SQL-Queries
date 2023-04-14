USE companydb;
SELECT CONCAT(emp.first_name, ' ', emp.last_name) AS 'employee full name', pr.name AS 'project name'
FROM employee emp
JOIN project pr ON emp.project_id = pr.id
JOIN (
  SELECT project_id, SUM(rate) AS total_salary
  FROM employee
  JOIN position ON employee.position_id = position.id
  GROUP BY project_id
) sr ON emp.project_id = sr.project_id
WHERE sr.total_salary > pr.max_sum_rate
ORDER BY pr.name;