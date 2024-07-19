CREATE VIEW ArticulosMasVendidos AS
SELECT 
    A.Nombre AS NombreArticulo,
    COUNT(V.CodigoArt) AS CantidadVendida
FROM 
    Vende V
JOIN 
    Articulos A ON V.CodigoArt = A.Codigo
GROUP BY 
    A.Nombre
ORDER BY 
    CantidadVendida DESC;