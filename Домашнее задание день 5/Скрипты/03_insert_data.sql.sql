INSERT INTO "DimDate" (date_key, full_date, year, quarter, month, month_name, day_of_week, is_weekend) VALUES
(20250101, '2025-01-01', 2025, 1, 1, 'January', 'Wednesday', FALSE),
(20250102, '2025-01-02', 2025, 1, 1, 'January', 'Thursday', FALSE),
(20250103, '2025-01-03', 2025, 1, 1, 'January', 'Friday', FALSE),
(20250104, '2025-01-04', 2025, 1, 1, 'January', 'Saturday', TRUE),
(20250105, '2025-01-05', 2025, 1, 1, 'January', 'Sunday', TRUE),
(20250106, '2025-01-06', 2025, 1, 1, 'January', 'Monday', FALSE),
(20250107, '2025-01-07', 2025, 1, 1, 'January', 'Tuesday', FALSE),
(20250108, '2025-01-08', 2025, 1, 1, 'January', 'Wednesday', FALSE),
(20250109, '2025-01-09', 2025, 1, 1, 'January', 'Thursday', FALSE),
(20250110, '2025-01-10', 2025, 1, 1, 'January', 'Friday', FALSE);

INSERT INTO "DimTime" (time_key, hour, minute, time_slot) VALUES
(1, 10, 0, 'morning'),
(2, 11, 0, 'morning'),
(3, 12, 0, 'afternoon'),
(4, 13, 0, 'afternoon'),
(5, 14, 0, 'afternoon'),
(6, 18, 0, 'evening'),
(7, 19, 0, 'evening'),
(8, 20, 0, 'evening'),
(9, 21, 0, 'night'),
(10, 22, 0, 'night');

INSERT INTO "DimGuest" (guest_key, full_name, phone, email, registration_date) VALUES
(1, 'Ivan Petrov', '+375291234567', 'ivan@email.com', '2024-01-15'),
(2, 'Maria Sidorova', '+375292345678', 'maria@email.com', '2024-03-20'),
(3, 'Alexey Smirnov', '+375293456789', 'alex@email.com', '2024-06-10'),
(4, 'Elena Kozlova', '+375294567890', 'elena@email.com', '2024-09-05'),
(5, 'Dmitry Ivanov', '+375295678901', 'dmitry@email.com', '2024-11-01');

INSERT INTO "DimRestaurant" (restaurant_key, restaurant_name, address, city, total_capacity) VALUES
(1, 'La Piazza', 'ul. Lenina 15, Minsk', 'Minsk', 50),
(2, 'Sakura', 'pr. Nezavisimosti 23, Minsk', 'Minsk', 40),
(3, 'Steak House', 'ul. Surganova 8, Minsk', 'Minsk', 30);

INSERT INTO "DimTable" (table_key, table_number, seating_capacity, zone) VALUES
(1, 'T1', 2, 'hall'),
(2, 'T2', 2, 'hall'),
(3, 'T3', 4, 'hall'),
(4, 'T4', 4, 'hall'),
(5, 'T5', 6, 'terrace'),
(6, 'T6', 6, 'terrace'),
(7, 'V1', 8, 'vip'),
(8, 'V2', 10, 'vip');

INSERT INTO "FactBooking" (booking_key, date_key, time_key, guest_key, restaurant_key, table_key, party_size, booking_status, duration_minutes, total_bill) VALUES
(1, 20250101, 7, 1, 1, 1, 2, 'seated', 90, 45.50),
(2, 20250101, 8, 2, 2, 3, 3, 'seated', 75, 67.20),
(3, 20250102, 6, 3, 1, 5, 2, 'confirmed', NULL, NULL),
(4, 20250102, 9, 4, 3, 7, 4, 'seated', 120, 120.00),
(5, 20250103, 7, 5, 2, 6, 4, 'cancelled', NULL, NULL),
(6, 20250103, 8, 1, 1, 2, 2, 'no_show', NULL, NULL),
(7, 20250104, 7, 2, 3, 8, 6, 'seated', 110, 85.30),
(8, 20250104, 8, 3, 2, 4, 2, 'seated', 60, 34.90),
(9, 20250105, 6, 4, 1, 5, 4, 'confirmed', NULL, NULL),
(10, 20250105, 9, 5, 2, 7, 6, 'seated', 130, 150.00),
(11, 20250106, 7, 1, 3, 1, 2, 'seated', 85, 42.00),
(12, 20250106, 8, 2, 1, 6, 4, 'no_show', NULL, NULL),
(13, 20250107, 6, 3, 2, 3, 2, 'seated', 70, 55.80),
(14, 20250107, 7, 4, 2, 4, 2, 'confirmed', NULL, NULL),
(15, 20250108, 8, 5, 3, 8, 8, 'seated', 145, 210.00),
(16, 20250108, 9, 1, 1, 7, 6, 'seated', 100, 95.50),
(17, 20250109, 7, 2, 1, 2, 2, 'cancelled', NULL, NULL),
(18, 20250109, 8, 3, 2, 5, 4, 'seated', 80, 72.30),
(19, 20250110, 7, 4, 3, 1, 2, 'seated', 65, 38.60),
(20, 20250110, 8, 5, 1, 3, 4, 'seated', 90, 68.90);