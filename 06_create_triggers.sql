-- TRIGGER 
CREATE OR REPLACE TRIGGER trg_nivel_bajo
BEFORE INSERT OR UPDATE ON CISTERNA
FOR EACH ROW
BEGIN
  IF :NEW.litrosDisponibles <= 6000 THEN
    :NEW.nivelBajo := 1;
  ELSE
    :NEW.nivelBajo := 0;
  END IF;
END;
/
