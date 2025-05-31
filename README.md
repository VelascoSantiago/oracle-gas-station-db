# Sistema de Gestión de Gasolineras en Oracle SQL

## Introducción  
Este proyecto implementa un **sistema de base de datos relacional en Oracle SQL** para modelar las operaciones de una red de empresas gasolineras. Incluye definición de esquema, inserción de datos base y de prueba, lógica de negocio mediante triggers y procedimientos, vistas y consultas analíticas.

El sistema simula reglas y procesos reales como:
- Ventas solo a través de bombas activas
- Control de inventario en cisternas (una por tipo de combustible)
- Relación distribuidores–cisternas para el reabastecimiento
- Beneficios a clientes VIP cada 5 compras
- Asignación de empleados a surtidores
- Registro de fallas por descalibración de bombas

## Tecnologías  
- **Base de datos**: Oracle SQL  
- **Entorno de desarrollo**: SQL*Plus, Oracle SQL Developer  
- **Formato de trabajo**: Archivos `.sql`  

## Estructura del repositorio  
- `01_create_tables.sql`: definición de todas las tablas  
- `02_insert_base_data.sql`: datos fijos como precios y estados  
- `03_insert_test_data.sql`: datos de prueba representativos  
- `04_create_views.sql`: vistas para consultas analíticas  
- `05_ad_hoc_queries.sql`: consultas específicas de negocio  
- `06_create_triggers.sql`: lógica automática e integridad  
- `07_create_procedures.sql`: procedimientos almacenados  
- `08_test_cases.sql`: casos de prueba funcionales  

## Reglas de negocio principales  
- Cada empresa gestiona varias sucursales, cada una con exactamente tres cisternas (Magna, Premium, Diesel).  
- Las bombas pueden estar *activas*, *en mantenimiento* o en *falla*. Solo se permiten ventas con bombas activas.  
- Cada venta reduce el volumen en la cisterna correspondiente.  
- Los distribuidores abastecen cisternas y se registra cada despacho.  
- Empleados están asignados a una bomba y supervisados por otros empleados.  
- Los clientes VIP reciben 3 litros gratis cada 5 compras.  
- Las fallas de bomba se registran con fecha, descripción y litros perdidos.

## Instrucciones de uso  
1. Abrir un cliente compatible con Oracle SQL.  
2. Ejecutar los scripts en el siguiente orden:
   - `01_create_tables.sql`  
   - `02_insert_base_data.sql`  
   - `03_insert_test_data.sql`  
   - Continuar con los scripts restantes según se requiera  

## Diagramas y documentación adicional  
Este repositorio también incluye:
- `diagrama_MER.png`: Modelo Entidad-Relación  
- `modelo_relacional.png`: Modelo Relacional  
- `esquema_relacional.pdf`: Descripción textual del esquema  

## Autor  
Santiago Velasco García – *Mayo 2025*  

## Licencia  
Este proyecto está bajo la [Licencia MIT](https://opensource.org/licenses/MIT).

---

## English Version

# Oracle SQL Gas Station Management System

## Introduction  
This project implements a **relational database system in Oracle SQL** to simulate the operations of a gas station network. It includes schema creation, data insertion, business logic (via triggers and stored procedures), views, and analytical queries.

The system models real-world business rules such as:
- Fuel sales only through active pumps  
- Real-time inventory control for cisterns (one per fuel type)  
- Distributor-cistern relationships for fuel delivery  
- VIP customer benefits after every 5 purchases  
- Employee assignment to pumps and hierarchical supervision  
- Pump malfunction tracking due to calibration issues  

## Technologies  
- **Database**: Oracle SQL  
- **Development tools**: SQL*Plus, Oracle SQL Developer  
- **File format**: `.sql` scripts  

## Repository Structure  
- `01_create_tables.sql`: schema definition  
- `02_insert_base_data.sql`: fixed values (prices, states)  
- `03_insert_test_data.sql`: test data for simulation  
- `04_create_views.sql`: reusable views for analysis  
- `05_ad_hoc_queries.sql`: specific business queries  
- `06_create_triggers.sql`: automatic logic and constraints  
- `07_create_procedures.sql`: stored procedures  
- `08_test_cases.sql`: test cases for validation  

## Main Business Rules  
- Each company manages several branches, each with exactly three cisterns (Magna, Premium, Diesel).  
- Pumps can be *active*, *under maintenance*, or *failing*. Only active pumps can be used for sales.  
- Sales reduce the volume of the corresponding cistern.  
- Distributors supply fuel to cisterns and each delivery is logged.  
- Employees are assigned to pumps and supervised by other employees.  
- VIP customers receive 3 free liters of fuel every 5 purchases.  
- Pump failures are logged with dates, description, and lost liters.

## How to Use  
1. Open Oracle SQL-compatible client.  
2. Run scripts in this order:
   - `01_create_tables.sql`  
   - `02_insert_base_data.sql`  
   - `03_insert_test_data.sql`  
   - Optionally continue with remaining scripts  

## Diagrams and Documentation  
Included in this repo:
- `diagrama_MER.png`: Entity-Relationship Diagram  
- `modelo_relacional.png`: Relational Model  
- `esquema_relacional.pdf`: Full relational schema description  

## Author  
Santiago Velasco García – *May 2025*  

## License  
This project is released under the [MIT License](https://opensource.org/licenses/MIT).
