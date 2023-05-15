USE companydb;
SELECT 
    employee.id, first_name, last_name, position_id, project_id
FROM employee
WHERE project_id IS NULL;