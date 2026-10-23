-- ¿Cómo evolucionan las ventas por mes?
SELECT
    MONTH(o.orderDate) AS mes,
	SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_ventas_mensual
FROM Orders o
JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY MONTH(o.orderDate)
ORDER BY mes ASC;