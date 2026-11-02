SELECT o.OrderID, o.OrderDate,
    YEAR(o.OrderDate) AS Anio, MONTH(o.OrderDate) AS Mes,
    c.CompanyName AS Cliente, c.Country AS Pais,
    e.FirstName + ' ' + e.LastName AS Empleado,
    cat.CategoryName AS Categoria, p.ProductName AS Producto,
    od.UnitPrice, od.Quantity, od.Discount
FROM Orders o
JOIN Order_Details od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID
ORDER BY o.OrderID;