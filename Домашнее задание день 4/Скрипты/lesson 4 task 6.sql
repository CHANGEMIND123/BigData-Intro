SELECT DISTINCT p.project_name
FROM projects p
JOIN employee_projects ep ON p.project_id = ep.project_id
JOIN employees e ON ep.employee_id = e.employee_id
WHERE e.first_name = 'Bob' AND e.last_name = 'Johnson'
  AND ep.hours_worked > 150;

UPDATE projects
SET budget = budget * 1.10
WHERE project_id IN (
    SELECT DISTINCT ep.project_id
    FROM employee_projects ep
    JOIN employees e ON ep.employee_id = e.employee_id
    WHERE e.department = 'IT' OR e.department = 'Senior IT'
);

UPDATE projects
SET end_date = start_date + INTERVAL '1 year'
WHERE end_date IS NULL;

BEGIN;

WITH new_employee AS (
    INSERT INTO employees (first_name, last_name, department, salary, email)
    VALUES ('Michael', 'Scott', 'IT', 72000.00, 'michael.scott@company.com')
    RETURNING employee_id
),
project_id AS (
    SELECT project_id FROM projects WHERE project_name = 'Website Redesign'
)
INSERT INTO employee_projects (employee_id, project_id, hours_worked)
SELECT 
    (SELECT employee_id FROM new_employee),
    (SELECT project_id FROM project_id),
    80
RETURNING employee_id;

COMMIT;

SELECT * FROM employees ORDER BY employee_id;
SELECT * FROM projects;
SELECT * FROM employee_projects ORDER BY employee_id, project_id;