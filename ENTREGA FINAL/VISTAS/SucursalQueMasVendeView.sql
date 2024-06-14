CREATE VIEW SucursalMasVende AS
SELECT 
    L.ID AS IDLocal,
    L.Nombre AS NombreSucursal,
    COUNT(V.IDLoc) AS TotalVentas
FROM 
    Local L
JOIN 
    Vende V ON L.ID = V.IDLoc
GROUP BY 
    L.ID, L.Nombre
ORDER BY 
    TotalVentas DESC
LIMIT 1;
