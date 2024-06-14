CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDelivery`(
    IN p_IDLoc INT,
    IN p_TieneDelivery BOOLEAN
)
BEGIN
    UPDATE Local
    SET Delivery = p_TieneDelivery
    WHERE ID = p_IDLoc;
END