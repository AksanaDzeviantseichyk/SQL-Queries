USE companydb;
SELECT 
		CONCAT(emp.first_name, ' ', emp.last_name) AS 'employee full name', 
		pr.name AS 'project name',
		pr.max_sum_rate -(pos.rate + ISNULL(SUM(eq.price),0)) AS difference
FROM employee emp
JOIN project pr ON emp.project_id = pr.id
JOIN position pos ON pos.id = emp.position_id
LEFT JOIN equipment eq ON eq.user_id = emp.id
GROUP BY 
    emp.first_name, emp.last_name, pr.name, pr.max_sum_rate, pos.rate
HAVING 
    (pos.rate + ISNULL(SUM(eq.price),0)/12) > pr.max_sum_rate
