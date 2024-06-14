CREATE DEFINER=`root`@`localhost` FUNCTION `FormasDePagosCuenta`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE tarjeta_count INT;
    DECLARE efectivo_count INT;
    DECLARE result VARCHAR(100);
    
    SELECT COUNT(*) INTO tarjeta_count
    FROM Cliente
    WHERE FormaDePago = 'Tarjeta';
    
    SELECT COUNT(*) INTO efectivo_count
    FROM Cliente
    WHERE FormaDePago = 'Efectivo';
    
    SET result = CONCAT('Clientes que pagan con tarjeta: ', tarjeta_count, '. Clientes que pagan con efectivo: ', efectivo_count);
    
    RETURN result;
END