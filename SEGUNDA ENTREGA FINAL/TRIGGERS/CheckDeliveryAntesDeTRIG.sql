DELIMITER //

CREATE TRIGGER CheckDeliveryAntesDe
BEFORE INSERT ON Compra
FOR EACH ROW
BEGIN
    DECLARE delivery BOOLEAN;
    SELECT Delivery INTO delivery
    FROM Local
    WHERE ID = NEW.IDLoc;

    IF delivery = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Esta sucursal no ofrece servicio de delivery.';
    END IF;
END //

DELIMITER ;