SELECT 
    s.status,
    c.first_name,
    c.last_name
FROM Shippings s
INNER JOIN Customers c ON s.customer = c.customer_id
ORDER BY s.status, c.last_name;