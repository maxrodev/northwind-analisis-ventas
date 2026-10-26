-- ¿Cómo evolucionan las ventas por mes?
SELECT
    YEAR(o.OrderDate)  AS anio,
    MONTH(o.OrderDate) AS mes,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS total_ventas_mensual
FROM Orders o
JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY anio, mes;