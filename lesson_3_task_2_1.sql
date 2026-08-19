SELECT 
    c.first_name,
    c.last_name,
    o.item,
    o.amount
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
ORDER BY c.last_name, o.order_id;