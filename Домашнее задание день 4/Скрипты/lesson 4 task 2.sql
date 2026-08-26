CREATE TABLE IF NOT EXISTS departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE NOT NULL,
    location VARCHAR(50)
);

ALTER TABLE employees ADD COLUMN IF NOT EXISTS email VARCHAR(100);

UPDATE employees SET email = LOWER(first_name || '.' || last_name || '@company.com');

ALTER TABLE employees ADD CONSTRAINT IF NOT EXISTS unique_email UNIQUE (email);

ALTER TABLE departments RENAME COLUMN location TO office_location;