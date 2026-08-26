SELECT 
    f.booking_status,
    COUNT(*) AS bookings_count
FROM "FactBooking" f
JOIN "DimDate" d ON f.date_key = d.date_key
WHERE d.year = 2025 AND d.month = 1
GROUP BY f.booking_status
ORDER BY bookings_count DESC;

SELECT 
    t.zone,
    AVG(f.total_bill) AS avg_bill,
    COUNT(*) AS visits_count
FROM "FactBooking" f
JOIN "DimTable" t ON f.table_key = t.table_key
WHERE f.booking_status = 'seated'
GROUP BY t.zone
ORDER BY avg_bill DESC;

SELECT 
    ti.hour,
    COUNT(*) AS total_bookings,
    AVG(f.party_size) AS avg_party_size
FROM "FactBooking" f
JOIN "DimTime" ti ON f.time_key = ti.time_key
WHERE f.booking_status IN ('confirmed', 'seated')
GROUP BY ti.hour
ORDER BY total_bookings DESC;

SELECT 
    g.full_name,
    COUNT(*) AS visit_count,
    SUM(f.total_bill) AS total_spent
FROM "FactBooking" f
JOIN "DimGuest" g ON f.guest_key = g.guest_key
WHERE f.booking_status = 'seated'
GROUP BY g.full_name
ORDER BY visit_count DESC
LIMIT 5;

SELECT 
    d.day_of_week,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN f.booking_status = 'no_show' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(SUM(CASE WHEN f.booking_status = 'no_show' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_percent
FROM "FactBooking" f
JOIN "DimDate" d ON f.date_key = d.date_key
GROUP BY d.day_of_week
ORDER BY no_show_percent DESC;