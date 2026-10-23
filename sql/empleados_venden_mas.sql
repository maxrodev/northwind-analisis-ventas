-- ¿Qué empleados venden más?
SELECT
	e.EmployeeID,
	CONCAT(e.FirstName, ' ', e.LastName) AS Nombre_Empleado,
	SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_ventas
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY total_ventas DESC;