-- Mostrar cada empleado con el número total de ventas realizadas, litros vendidos y
-- monto total generado.
CREATE OR REPLACE VIEW view_resumen_ventas_empleado AS
SELECT 
    e.idEmp,
    e.pilaEmp || ' ' || e.apPatEmp || NVL(' ' || e.apMatEmp, '') AS nombreEmpleado,
    COUNT(v.idVenta) AS totalVentas,
    SUM(v.litros) AS litrosVendidos,
    SUM(v.monto) AS montoGenerado
FROM 
    EMPLEADO e
JOIN 
    VENTA v ON e.idEmp = v.idEmp
GROUP BY 
    e.idEmp, e.pilaEmp, e.apPatEmp, e.apMatEmp;

SELECT * FROM VIEW_RESUMEN_VENTAS_EMPLEADO;

-- Vista útil para monitorear el estado de las bombas, su última falla y su
-- empleado asignado.
CREATE OR REPLACE VIEW view_monitoreo_bombas AS
SELECT
    b.idBomba,
    b.estado,
    e.idEmp,
    e.pilaEmp || ' ' || e.apPatEmp || NVL(' ' || e.apMatEmp, '') AS nombreEmpleado,
    f.fechaFalla,
    f.descFalla,
    f.fechaReparacion
FROM
    BOMBA_SURTIDORA b
LEFT JOIN EMP_ASIGN_BOM ab ON b.idBomba = ab.idBomba
LEFT JOIN EMPLEADO e ON ab.idEmp = e.idEmp
LEFT JOIN (
    SELECT f1.*
    FROM FALLA f1
    WHERE (f1.idBomba, f1.fechaFalla) IN (
        SELECT idBomba, MAX(fechaFalla)
        FROM FALLA
        GROUP BY idBomba
    )
) f ON b.idBomba = f.idBomba;

SELECT * FROM VIEW_MONITOREO_BOMBAS;