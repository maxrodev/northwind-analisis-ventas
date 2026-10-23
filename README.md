# Northwind: análisis de ventas

Proyecto de análisis de datos sobre la base de ejemplo **Northwind** con MySQL, Python y Power BI.

> **Estado: en desarrollo.** Las consultas, el notebook y el dashboard se irán añadiendo en las carpetas indicadas más abajo.

## Objetivo

Responder preguntas de negocio sobre ventas, clientes, productos y envíos a partir de la base de datos Northwind, usando SQL para consultar, Python para validar y graficar, y Power BI para presentar los resultados.

## Fuente de datos

Base de datos de ejemplo **Northwind**. Son datos ficticios con fines de aprendizaje, no datos reales de una empresa.

## Diagrama de la base de datos

![Diagrama entidad-relación de Northwind](assets/northwind_db.png)

La misma estructura, simplificada, con las columnas más relevantes y los tipos aproximados:

```mermaid
erDiagram
    Region ||--o{ Territories : "contiene"
    Territories ||--o{ EmployeeTerritories : "se asigna"
    Employees ||--o{ EmployeeTerritories : "cubre"
    Employees ||--o{ Employees : "reporta a"
    Employees ||--o{ Orders : "registra"
    Customers ||--o{ Orders : "realiza"
    Shippers ||--o{ Orders : "envía"
    Orders ||--|{ Order_Details : "incluye"
    Products ||--o{ Order_Details : "aparece en"
    Categories ||--o{ Products : "clasifica"
    Suppliers ||--o{ Products : "provee"
    Customers ||--o{ CustomerCustomerDemo : "tiene"
    CustomerDemographics ||--o{ CustomerCustomerDemo : "describe"

    Orders {
        int OrderID PK
        string CustomerID FK
        int EmployeeID FK
        date OrderDate
        date RequiredDate
        date ShippedDate
        int ShipVia FK
        decimal Freight
        string ShipCountry
    }
    Order_Details {
        int OrderID PK, FK
        int ProductID PK, FK
        decimal UnitPrice
        int Quantity
        float Discount
    }
    Products {
        int ProductID PK
        string ProductName
        int SupplierID FK
        int CategoryID FK
        decimal UnitPrice
        int UnitsInStock
        boolean Discontinued
    }
    Categories {
        int CategoryID PK
        string CategoryName
        string Description
    }
    Customers {
        string CustomerID PK
        string CompanyName
        string City
        string Country
    }
    Employees {
        int EmployeeID PK
        string LastName
        string FirstName
        string Title
        date HireDate
        int ReportsTo FK
    }
    Suppliers {
        int SupplierID PK
        string CompanyName
        string Country
    }
    Shippers {
        int ShipperID PK
        string CompanyName
    }
    Region {
        int RegionID PK
        string RegionDescription
    }
    Territories {
        string TerritoryID PK
        string TerritoryDescription
        int RegionID FK
    }
    EmployeeTerritories {
        int EmployeeID PK, FK
        string TerritoryID PK, FK
    }
    CustomerCustomerDemo {
        string CustomerID PK, FK
        string CustomerTypeID PK, FK
    }
    CustomerDemographics {
        string CustomerTypeID PK
        string CustomerDesc
    }
```

## Tablas que uso en el análisis

| Tabla | Para qué la uso |
|---|---|
| `Orders` | Fecha del pedido, fecha de envío, cliente, empleado y país de destino |
| `Order_Details` | Precio, cantidad y descuento de cada producto vendido |
| `Products` y `Categories` | Producto vendido y su categoría |
| `Customers` | Cliente y país |
| `Employees` | Empleado que registró el pedido |
| `Shippers` | Empresa de transporte |

El importe de cada línea de venta se calcula como:

```
UnitPrice * Quantity * (1 - Discount)
```

## Preguntas de negocio

1. ¿Cómo evolucionan las ventas por mes?
2. ¿Cuáles son los 10 clientes que más compran?
3. ¿Qué categorías y productos generan más ingresos?
4. ¿Cuántos pedidos se envían después de la fecha requerida?
5. ¿Qué empleados venden más?
6. ¿Qué países concentran las ventas?

## Herramientas

- **MySQL** y MySQL Workbench: consultas y modelo de datos
- **Python** (pandas, matplotlib): validación de datos y gráficos
- **Power BI**: dashboard

## Estructura del repositorio

```
northwind-analisis-ventas/
├── sql/          consultas, una por pregunta de negocio
├── notebooks/    análisis en Python
├── dashboard/    archivo de Power BI
├── assets/       diagrama y capturas
└── README.md
```

## Autor

Miler Alexander Rodríguez Rojas | [LinkedIn](https://www.linkedin.com/in/miler-alexander-rodriguez-rojas-b1b9a3323/)