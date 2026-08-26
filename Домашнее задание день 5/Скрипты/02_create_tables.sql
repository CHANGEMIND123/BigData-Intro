DROP TABLE IF EXISTS "FactBooking" CASCADE;
DROP TABLE IF EXISTS "DimTable" CASCADE;
DROP TABLE IF EXISTS "DimRestaurant" CASCADE;
DROP TABLE IF EXISTS "DimGuest" CASCADE;
DROP TABLE IF EXISTS "DimTime" CASCADE;
DROP TABLE IF EXISTS "DimDate" CASCADE;

CREATE TABLE "DimDate" (
    date_key INTEGER PRIMARY KEY,
    full_date DATE NOT NULL,
    year INTEGER NOT NULL,
    quarter INTEGER NOT NULL,
    month INTEGER NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    day_of_week VARCHAR(20) NOT NULL,
    is_weekend BOOLEAN NOT NULL
);

CREATE TABLE "DimTime" (
    time_key INTEGER PRIMARY KEY,
    hour INTEGER NOT NULL,
    minute INTEGER NOT NULL,
    time_slot VARCHAR(20) NOT NULL
);

CREATE TABLE "DimGuest" (
    guest_key INTEGER PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    registration_date DATE NOT NULL
);

CREATE TABLE "DimRestaurant" (
    restaurant_key INTEGER PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    city VARCHAR(50),
    total_capacity INTEGER NOT NULL
);

CREATE TABLE "DimTable" (
    table_key INTEGER PRIMARY KEY,
    table_number VARCHAR(10) NOT NULL,
    seating_capacity INTEGER NOT NULL,
    zone VARCHAR(50) NOT NULL
);

CREATE TABLE "FactBooking" (
    booking_key INTEGER PRIMARY KEY,
    date_key INTEGER NOT NULL REFERENCES "DimDate"(date_key),
    time_key INTEGER NOT NULL REFERENCES "DimTime"(time_key),
    guest_key INTEGER NOT NULL REFERENCES "DimGuest"(guest_key),
    restaurant_key INTEGER NOT NULL REFERENCES "DimRestaurant"(restaurant_key),
    table_key INTEGER NOT NULL REFERENCES "DimTable"(table_key),
    party_size INTEGER NOT NULL,
    booking_status VARCHAR(20) NOT NULL,
    duration_minutes INTEGER,
    total_bill DECIMAL(10, 2)
);