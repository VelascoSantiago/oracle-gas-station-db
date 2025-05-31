
-- PROCEDIMIENTO ALMACENADO

CREATE OR REPLACE PROCEDURE registrar_venta (
    p_idVenta      IN VENTA.idVenta%TYPE,
    p_idCte        IN VENTA.idCte%TYPE,
    p_idEmp        IN VENTA.idEmp%TYPE,
    p_idBomba      IN VENTA.idBomba%TYPE,
    p_tipoComb     IN VENTA.tipoComb%TYPE,
    p_fecha        IN VENTA.fecha%TYPE,
    p_litros       IN VENTA.litros%TYPE,
    p_monto        IN VENTA.monto%TYPE
) AS
    v_estadoBomba   BOMBA_SURTIDORA.estado%TYPE;
    v_es_vip        NUMBER := 0;
    v_noCompras     CLIENTE_VIP.noCompras%TYPE;
    v_litrosVIP     CLIENTE_VIP.litrosComprados%TYPE;
    v_litrosRegalados CLIENTE_VIP.litrosRegalados%TYPE;

    v_idCisterna    CISTERNA.idCisternaSub%TYPE;
    v_litrosDisp    CISTERNA.litrosDisponibles%TYPE;

BEGIN
    -- 1. Validar que la bomba esté activa
    SELECT estado INTO v_estadoBomba
    FROM BOMBA_SURTIDORA
    WHERE idBomba = p_idBomba;

    IF v_estadoBomba <> 'Activa' THEN
        RAISE_APPLICATION_ERROR(-20001, 'La bomba no está activa.');
    END IF;

    -- 2. Obtener cisterna relacionada con la bomba y tipo de combustible
    SELECT CB.idCisternaSub
    INTO v_idCisterna
    FROM CIS_BOMB CB
    JOIN CISTERNA C ON C.idCisternaSub = CB.idCisternaSub
    WHERE CB.idBomba = p_idBomba
      AND C.tipoComb = p_tipoComb;

    -- 3. Validar que haya suficiente combustible
    SELECT litrosDisponibles INTO v_litrosDisp
    FROM CISTERNA
    WHERE idCisternaSub = v_idCisterna;

    IF v_litrosDisp < p_litros THEN
        RAISE_APPLICATION_ERROR(-20002, 'No hay suficientes litros en la cisterna.');
    END IF;

    -- 4. Insertar la venta
    INSERT INTO VENTA (
        idVenta, idCte, idEmp, idBomba, tipoComb,
        fecha, litros, monto
    ) VALUES (
        p_idVenta, p_idCte, p_idEmp, p_idBomba, p_tipoComb,
        p_fecha, p_litros, p_monto
    );

    -- 5. Actualizar CLIENTE
    UPDATE CLIENTE
    SET litrosComprados = litrosComprados + p_litros,
        montoTotalGastado = NVL(montoTotalGastado, 0) + p_monto
    WHERE idCte = p_idCte;

    -- 6. Si es VIP, actualizar sus datos
    SELECT COUNT(*) INTO v_es_vip
    FROM CLIENTE_VIP
    WHERE idCte = p_idCte;

    IF v_es_vip = 1 THEN
        SELECT noCompras, litrosComprados, litrosRegalados
        INTO v_noCompras, v_litrosVIP, v_litrosRegalados
        FROM CLIENTE_VIP
        WHERE idCte = p_idCte;

        v_noCompras := v_noCompras + 1;
        v_litrosVIP := v_litrosVIP + p_litros;

        IF MOD(v_noCompras, 5) = 0 THEN
            v_litrosRegalados := 3;
        ELSE
            v_litrosRegalados := 0;
        END IF;

        UPDATE CLIENTE_VIP
        SET noCompras = v_noCompras,
            litrosComprados = v_litrosVIP,
            litrosRegalados = v_litrosRegalados
        WHERE idCte = p_idCte;
    END IF;

    -- 7. Descontar litros de la cisterna
    UPDATE CISTERNA
    SET litrosDisponibles = litrosDisponibles - p_litros,
        nivelBajo = CASE WHEN (litrosDisponibles - p_litros) <= 6000 THEN 1 ELSE 0 END
    WHERE idCisternaSub = v_idCisterna;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003, 'Datos inválidos: bomba o cisterna no encontrada.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'Error inesperado: ' || SQLERRM);
END;
/