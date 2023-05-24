USE companydb;

DECLARE @emp_pos TABLE (project_id INT,  sum_rate money)
INSERT INTO @emp_pos
SELECT emp.project_id, SUM(pos.rate)
FROM employee emp
	LEFT JOIN position pos ON pos.id = emp.position_id
GROUP BY emp.project_id

DECLARE @emp_eq TABLE (project_id INT,  sum_price money)
INSERT INTO @emp_eq
SELECT emp.project_id, ISNULL(SUM(eq.price),0)
FROM employee emp
	LEFT JOIN equipment eq ON eq.user_id = emp.id
GROUP BY emp.project_id

SELECT
	CONCAT(emp.first_name, ' ', emp.last_name) AS 'employee full name', 
    pr.name AS 'project name',
    (pr.max_sum_rate - pos.sum_rate - eq.sum_price/12) AS difference
FROM employee emp
	JOIN project pr ON emp.project_id = pr.id
    LEFT JOIN @emp_pos pos ON emp.project_id = pos.project_id
    LEFT JOIN @emp_eq  eq ON emp.project_id = eq.project_id
WHERE (pr.max_sum_rate - pos.sum_rate - eq.sum_price/12) < 0