CREATE OR REPLACE FUNCTION calculate_annual_bonus(
    p_employee_id INT,
    p_salary DECIMAL
)
RETURNS DECIMAL AS $$
BEGIN
    RETURN p_salary * 0.10;
END;
$$ LANGUAGE plpgsql;

SELECT 
    employee_id,
    first_name,
    last_name,
    salary,
    calculate_annual_bonus(employee_id, salary) AS annual_bonus
FROM employees;

CREATE OR REPLACE VIEW it_department_view AS
SELECT 
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE department = 'IT' OR department = 'Senior IT';

SELECT * FROM it_department_view;