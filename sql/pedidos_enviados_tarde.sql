-- ¿Cuántos pedidos se envían después de la fecha requerida?
SELECT
	COUNT(*) AS pedidos_enviados_tarde
FROM Orders
WHERE ShippedDate > RequiredDate;