CREATE DEFINER=`root`@`localhost` FUNCTION `TotalEmpresasYClientes`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE totalEmpresas INT;
    DECLARE totalClientes INT;
    DECLARE result VARCHAR(100);

    -- cuenta los numeros de empresas y clientes
    SELECT COUNT(*) INTO totalEmpresas FROM Empresa;
    SELECT COUNT(*) INTO totalClientes FROM Cliente;

    -- muestra el dato todo junto
    SET result = CONCAT('Total de Empresas: ', totalEmpresas, ', Total de Clientes: ', totalClientes);

    RETURN result;
END