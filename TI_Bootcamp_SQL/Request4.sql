USE companydb;
SELECT 
	CONCAT(emp.first_name, ' ', emp.last_name) AS 'employee full name', 
    pr.name AS 'project name',
    (pr.max_sum_rate - emp_pos.sum_rate - emp_eq.sum_price/12) AS difference
FROM employee emp
	JOIN project pr ON emp.project_id = pr.id
    LEFT JOIN (
        SELECT emp.project_id, SUM(pos.rate) AS sum_rate
        FROM employee emp
        LEFT JOIN position pos ON pos.id = emp.position_id
        GROUP BY emp.project_id
    ) emp_pos ON emp.project_id = emp_pos.project_id
    LEFT JOIN (
        SELECT emp.project_id, ISNULL(SUM(eq.price),0) AS sum_price
        FROM employee emp
        LEFT JOIN equipment eq ON eq.user_id = emp.id
        GROUP BY emp.project_id
    ) emp_eq ON emp.project_id = emp_eq.project_id
WHERE (pr.max_sum_rate - emp_pos.sum_rate - emp_eq.sum_price/12) < 0