-- PROBANDO LOS DOS CASOS DEL TRIGGER trg_nivel_bajo

SELECT * FROM CISTERNA WHERE idCisternaSub = 1 OR idCisternaSub = 4;

UPDATE CISTERNA
SET litrosDisponibles = 5000
WHERE idCisternaSub = 4;

UPDATE CISTERNA
SET litrosDisponibles = 65000
WHERE idCisternaSub = 1;

SELECT * FROM CISTERNA WHERE idCisternaSub = 1 OR idCisternaSub = 4;

-- PROBAR PROCEDIMIENTO registrar_venta

SELECT idBomba, estado, idSucursalSub, tipoComb, litrosDisponibles FROM
BOMBA_SURTIDORA
JOIN CIS_BOMB USING (idBomba)
JOIN CISTERNA USING (idCisternaSub)
WHERE idBomba=123451;

SELECT * FROM CLIENTE WHERE idCte = 000011112220;

SELECT * FROM VENTA;

BEGIN
  registrar_venta(
    p_idVenta   => 10000011,
    p_idCte     => 000011112220,
    p_idEmp     => 001231,
    p_idBomba   => 123451,
    p_tipoComb  => 'Magna',
    p_fecha     => SYSDATE,
    p_litros    => 30,
    p_monto     => 703.50
  );
END;
/

SELECT idBomba, estado, idSucursalSub, tipoComb, litrosDisponibles FROM
BOMBA_SURTIDORA
JOIN CIS_BOMB USING (idBomba)
JOIN CISTERNA USING (idCisternaSub)
WHERE idBomba=123451;

SELECT * FROM VENTA;

SELECT * FROM BOMBA_SURTIDORA WHERE idBomba = 123456;

DELETE FROM VENTA WHERE idVenta = 10000011;

-- Probando bomba con falla

BEGIN
  registrar_venta(
    p_idVenta   => 10000012,
    p_idCte     => 000011112220,
    p_idEmp     => 001236,
    p_idBomba   => 123456,
    p_tipoComb  => 'Magna',
    p_fecha     => SYSDATE,
    p_litros    => 30,
    p_monto     => 703.50
  );
END;
/

-- Probar dinámica VIP
SELECT * FROM CLIENTE_VIP WHERE idCte = 000011112221;

BEGIN
  registrar_venta(
    p_idVenta   => 10000012,
    p_idCte     => 000011112221,
    p_idEmp     => 001232,
    p_idBomba   => 123452,
    p_tipoComb  => 'Magna',
    p_fecha     => SYSDATE,
    p_litros    => 30,
    p_monto     => 703.5
  );
END;

BEGIN
  registrar_venta(
    p_idVenta   => 10000013,
    p_idCte     => 000011112221,
    p_idEmp     => 001232,
    p_idBomba   => 123452,
    p_tipoComb  => 'Magna',
    p_fecha     => SYSDATE,
    p_litros    => 30,
    p_monto     => 703.5
  );
END;

DELETE FROM VENTA WHERE idVenta = 10000011;
DELETE FROM VENTA WHERE idVenta = 10000012;
DELETE FROM VENTA WHERE idVenta = 10000013;

SELECT * FROM VENTA;