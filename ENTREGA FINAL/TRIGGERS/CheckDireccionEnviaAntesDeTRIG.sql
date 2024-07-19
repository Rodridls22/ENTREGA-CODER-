DELIMITER //
CREATE TRIGGER CheckDireccionEnviaAntesDe
BEFORE INSERT ON Envia
FOR EACH ROW
BEGIN
    -- Verificar si la dirección está vacía o nula
    IF NEW.Direccion IS NULL OR NEW.Direccion = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede enviar sin una dirección especificada.';
    END IF;
END //
DELIMITER ;