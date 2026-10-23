-- ¿Qué categorías y productos generan más ingresos?
SELECT
	c.CategoryName,
	p.ProductName,
	SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_ingresos
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
JOIN Order_Details od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName, p.ProductName
ORDER BY total_ingresos DESC;