SELECT * FROM customers;

SELECT * FROM orders;

SELECT * 
FROM products
ORDER BY Price DESC;

SELECT 
    customerName,
    COUNT(*) AS 'number of orders'
FROM customers
INNER JOIN orders
	ON orders.customerID = customers.customerID
GROUP BY customers.customerID;