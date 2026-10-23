-- ¿Qué países concentran las ventas?
SELECT
	c.Country,
	SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_ventas
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY c.Country
ORDER BY total_ventas DESC;