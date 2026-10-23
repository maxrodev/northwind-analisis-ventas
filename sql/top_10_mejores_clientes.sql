-- ¿Cuáles son los 10 clientes que más compran?
SELECT TOP 10
	c.CustomerID,
	c.CompanyName,
	SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_compras
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY total_compras DESC;