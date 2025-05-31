-- CONSULTAS CON DISTINTOS TIPOS DE JOINS

-- INNER JOIN
-- Mostrar el nombre del cliente (pilaCte, apPatCte) y su montoTotalGastado, solo si han
-- realizado al menos una venta.

SELECT c.pilaCte, c.apPatCte, c.montoTotalGastado
FROM CLIENTE c
INNER JOIN VENTA v ON c.idCte = v.idCte
GROUP BY c.idCte, c.pilaCte, c.apPatCte, c.montoTotalGastado;

-- LEFT JOIN
-- Mostrar todas las bombas (idBomba, estado) e incluir los detalles de fallas si las hay.
-- Las bombas sin fallas también deben aparecer.
SELECT b.idBomba, b.estado, f.fechaFalla, f.descFalla, f.perdidas, f.fechaReparacion
FROM BOMBA_SURTIDORA b
LEFT JOIN FALLA f ON b.idBomba = f.idBomba
ORDER BY b.idBomba;

-- CONSULTAS CON ÁLGEBRA RELACIONAL
-- 1. Obtener los nombres de los clientes que han comprado más de 30 litros
SELECT pilaCte, apPatCte
FROM CLIENTE
WHERE litrosComprados > 30;

-- 2. Clientes que no son VIP
SELECT idCte
FROM CLIENTE
MINUS
SELECT idCte
FROM CLIENTE_VIP;

-- 3. Total de pérdidas por bomba ordenado de mayor a menor
SELECT idBomba, SUM(perdidas) AS total_perdidas
FROM FALLA
GROUP BY idBomba
ORDER BY total_perdidas DESC;

-- 4. Mostrar el nombre del cliente, el empleado y el tipo de combustible de cada venta
SELECT 
    c.pilaCte, 
    c.apPatCte, 
    e.pilaEmp, 
    e.apPatEmp, 
    v.tipoComb
FROM 
    VENTA v
JOIN CLIENTE c ON v.idCte = c.idCte
JOIN EMPLEADO e ON v.idEmp = e.idEmp;

-- 5. Bombas activas que no aparecen en la tabla FALLA (bombas que no tienen ni han tenido fallas)
SELECT idBomba
FROM BOMBA_SURTIDORA
WHERE estado = 'Activa'
MINUS
SELECT idBomba
FROM FALLA;

-- CONSULTAS CON FUNCIONES DE AGREGACIÓN
-- 1. Sucursal con mayor y menor cantidad de combustible
WITH total_combustible_por_sucursal AS (
    SELECT 
        s.idSucursalSub,
        s.noSucursal,
        s.direccion,
        SUM(c.litrosDisponibles) AS total_combustible
    FROM 
        SUCURSAL s
    JOIN 
        CISTERNA c ON s.idSucursalSub = c.idSucursalSub
    GROUP BY 
        s.idSucursalSub, s.noSucursal, s.direccion
)
SELECT *
FROM total_combustible_por_sucursal
WHERE total_combustible = (
    SELECT MAX(total_combustible) FROM total_combustible_por_sucursal
)
OR total_combustible = (
    SELECT MIN(total_combustible) FROM total_combustible_por_sucursal
);

-- 2. Promedio de litros vendidos por sucursal
SELECT 
    s.idSucursalSub,
    s.noSucursal,
    ROUND(AVG(v.litros), 2) AS promedio_litros_vendidos
FROM 
    VENTA v
JOIN 
    EMPLEADO e ON v.idEmp = e.idEmp
JOIN 
    EMP_SUC es ON e.idEmp = es.idEmp
JOIN 
    SUCURSAL s ON es.idSucursalSub = s.idSucursalSub
GROUP BY 
    s.idSucursalSub, s.noSucursal, s.direccion;

