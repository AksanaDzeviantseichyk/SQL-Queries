CREATE DATABASE companydb;
GO
USE companydb;

CREATE TABLE project
(
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(20) NOT NULL,
    max_sum_rate MONEY    
);

CREATE TABLE position
(
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(20) NOT NULL,
    rate MONEY    
);

CREATE TABLE employee
(
    id INT PRIMARY KEY IDENTITY,
    first_name NVARCHAR(20) NOT NULL,
    last_name NVARCHAR(20) NOT NULL,
    position_id INT,
    project_id INT,
	FOREIGN KEY (project_id)  REFERENCES project (id) ON DELETE CASCADE,
	FOREIGN KEY (position_id)  REFERENCES position (id) ON DELETE CASCADE
);

CREATE TABLE equipment
(
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(20) NOT NULL,
    price MONEY,
	user_id INT,
	FOREIGN KEY (user_id)  REFERENCES employee (id) ON DELETE CASCADE
);

CREATE TABLE vacancies
(
    id INT PRIMARY KEY IDENTITY,
    position_id INT,
	FOREIGN KEY (position_id)  REFERENCES position (id) ON DELETE CASCADE 
);

INSERT INTO project 
VALUES
('usa medical', 2000),
('erp kyiv', 1000),
('poland social', 900),
('mexico transport', 480),
('spain goverment', 2000);

INSERT INTO position 
VALUES
('dev', 500),
('qa auto', 510),
('qa manual', 520),
('project manager', 530),
('ba', 490);

INSERT INTO employee 
VALUES
('ivan', 'ivanov', 2, 1),
('mari', 'krasnova', 3, 2),
('petr', 'petrov', 4, 5),
('yana', 'sukharieva', 5, 4),
('anna', 'sergienko', 1, 3),
('olga', 'tor', 4, 3),
('sergei', 'sergeev', 1, 2);

INSERT INTO equipment 
VALUES
('laptop hp', 1000, 1),
('laptop hp', 1000, 3),
('laptop lenovo', 800, 2),
('pc', 300, NULL),
('laptop dell', 150, 5),
('monitor', 80, 2),
('monitor', 85, 3),
('pc', 450, 2);

INSERT INTO vacancies
VALUES
(1),
(2),
(5),
(3),
(2);
