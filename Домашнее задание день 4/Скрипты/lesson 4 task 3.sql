GRANT SELECT ON employees TO hr_user;
GRANT INSERT, UPDATE ON employees TO hr_user;
GRANT USAGE ON SEQUENCE employees_employee_id_seq TO hr_user;
SELECT * FROM employees;