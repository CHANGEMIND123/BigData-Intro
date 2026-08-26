INSERT INTO employees (first_name, last_name, department, salary, email) 
VALUES 
    ('John', 'Smith', 'HR', 55000.00, 'john.smith@company.com'),
    ('Emma', 'Wilson', 'Finance', 63000.00, 'emma.wilson@company.com');

SELECT * FROM employees;

SELECT first_name, last_name FROM employees WHERE department = 'IT';

UPDATE employees 
SET salary = 65000.00 
WHERE first_name = 'Alice' AND last_name = 'Smith';

DELETE FROM employees 
WHERE first_name = 'Eve' AND last_name = 'Davis';

SELECT * FROM employees ORDER BY employee_id;