UPDATE employees 
SET salary = salary * 1.10 
WHERE department = 'HR';

UPDATE employees 
SET department = 'Senior IT' 
WHERE salary > 70000.00;

DELETE FROM employees 
WHERE NOT EXISTS (
    SELECT 1 
    FROM employee_projects 
    WHERE employee_projects.employee_id = employees.employee_id
);

BEGIN;

INSERT INTO projects (project_name, budget, start_date, end_date) 
VALUES ('Data Analytics Platform', 120000.00, '2026-01-01', '2026-12-31');

WITH new_project AS (
    SELECT project_id FROM projects WHERE project_name = 'Data Analytics Platform'
)
INSERT INTO employee_projects (employee_id, project_id, hours_worked)
SELECT 
    e.employee_id,
    (SELECT project_id FROM new_project),
    CASE 
        WHEN e.first_name = 'Alice' AND e.last_name = 'Smith' THEN 100
        ELSE 80
    END
FROM employees e
WHERE (e.first_name = 'Alice' AND e.last_name = 'Smith')
   OR (e.first_name = 'Bob' AND e.last_name = 'Johnson');

COMMIT;

SELECT * FROM employees ORDER BY employee_id;
SELECT * FROM projects;
SELECT * FROM employee_projects;