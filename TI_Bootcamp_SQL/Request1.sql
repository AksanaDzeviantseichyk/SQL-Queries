USE companydb;
SELECT 
    employee.id, first_name + ' ' + last_name AS 'full name',
    name AS 'position name', rate
FROM employee
INNER JOIN position
ON project_id = position.id;