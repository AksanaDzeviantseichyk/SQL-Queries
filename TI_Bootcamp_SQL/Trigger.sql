USE companydb
GO
CREATE TRIGGER project_INSERT
ON project
AFTER INSERT
AS
INSERT INTO vacancies(position_id)
SELECT id
FROM position
WHERE name LIKE 'project manager'