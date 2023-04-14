USE companydb;
SELECT 
				pr.name 
FROM 
				project pr
INNER JOIN 
				employee emp ON pr.id = emp.project_id
INNER JOIN 
				position pos ON emp.position_id = pos.id 
GROUP BY 
				pr.name, pr.max_sum_rate
HAVING  
				SUM(pos.rate) > pr.max_sum_rate