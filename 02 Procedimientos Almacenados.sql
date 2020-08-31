USE RHHBD_2020;
GO

--Pais
--SelectAllPais selecciona todos los países dentro de la tabla Pais
ALTER PROCEDURE SelectAllPais
AS
    BEGIN
        SELECT p.Pais_ID, 
               p.NombrePais
        FROM Pais p;
    END;
GO
CREATE PROCEDURE SelectAllPaisPorNombre(@NombrePais NVARCHAR(25))
AS
    BEGIN
        SELECT p.Pais_ID, 
               p.NombrePais
        FROM Pais p
        WHERE p.NombrePais = @NombrePais;
    END;
	GO
EXEC SelectAllPais;
GO
EXEC SelectAllPaisPorNombre 
     'Costa Rica';
GO
CREATE PROCEDURE InsertarPais(@PI_NombrePais NVARCHAR(25))
AS
    BEGIN
        INSERT INTO Pais(NombrePais)
    VALUES(@PI_NombrePais);
    END;
	GO

	EXECUTE InsertarPais 'Panamá'