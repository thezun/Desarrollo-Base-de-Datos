CREATE DATABASE RRHHBD_2020;
GO
USE RRHHBD_2020;
GO
CREATE TABLE Pais
(Pais_ID    INT IDENTITY(1, 1), 
 NombrePais NVARCHAR(25) NOT NULL, 
 CONSTRAINT pk_Pais_ID PRIMARY KEY(Pais_ID)
);
GO
CREATE TABLE Ubicacion
(Ubicacion_ID INT IDENTITY(1, 1), 
 Direccion    NVARCHAR(500) NOT NULL, 
 CodigoPostal NVARCHAR(30) NOT NULL, 
 Ciudad       NVARCHAR(50) NOT NULL, 
 Pais_ID      INT, 
 CONSTRAINT pk_Ubicacion_ID PRIMARY KEY(Ubicacion_ID), 
 CONSTRAINT fk_Pais_ID FOREIGN KEY(Pais_ID) REFERENCES Pais(Pais_ID)
);
GO
CREATE TABLE Departamento
(Departamento_ID         INT IDENTITY(1, 1), 
 NombreDepartamento      NVARCHAR(100) NOT NULL, 
 DescripcionDepartamento NVARCHAR(200), 
 Ubicacion_ID            INT, 
 CONSTRAINT pk_Departamento_ID PRIMARY KEY(Departamento_ID), 
 CONSTRAINT fk_Ubicacion_ID FOREIGN KEY(Ubicacion_ID) REFERENCES Ubicacion(Ubicacion_ID)
);
GO
CREATE TABLE Puesto
(Puesto_ID     INT IDENTITY(1, 1), 
 NombrePuesto  NVARCHAR(50) NOT NULL, 
 SalarioMaximo NUMERIC(18, 2), 
 CONSTRAINT pk_Puesto_ID PRIMARY KEY(Puesto_ID)
);
GO
CREATE TABLE Colorabor
(Colaborador_ID    INT IDENTITY(1, 1), 
 PrimerNombre      NVARCHAR(25) NOT NULL, 
 SegundoNombre     NVARCHAR(25), 
 PrimerApellido    NVARCHAR(25) NOT NULL, 
 SegundoApellido   NVARCHAR(25), 
 Email             NVARCHAR(50), 
 Telefono          NVARCHAR(20), 
 FechaContratacion DATETIME NOT NULL,
 Salario           NUMERIC(18, 2),
 Puesto_ID         INT,  
 Departamento_ID   INT, 
--TABLA RECURSIVA ME DAN EJEMPLO, Y EXPLICAN PORQUE ESTA DEBE SERLO
 CONSTRAINT pk_Colaborador_ID PRIMARY KEY(Colaborador_ID), 
 CONSTRAINT fk_Puesto_ID FOREIGN KEY(Puesto_ID) REFERENCES Puesto(Puesto_ID),
 CONSTRAINT fk_Departamento_ID FOREIGN KEY(Departamento_ID) REFERENCES Departamento(Departamento_ID)
);
GO
CREATE TABLE HistorialPuestos
(HistorialPuestos_ID INT IDENTITY(1, 1), 
 FechaInicio         DATETIME NOT NULL, 
 FechaFin            DATETIME, 
 Puesto_ID           INT, 
 Departamento_ID     INT, 
 CONSTRAINT pk_HistorialPuestos_ID PRIMARY KEY(HistorialPuestos_ID), 
 CONSTRAINT fk_Puesto_ID_2 FOREIGN KEY(Puesto_ID) REFERENCES Puesto(Puesto_ID), 
 CONSTRAINT fk_Departamento_ID2 FOREIGN KEY(Departamento_ID) REFERENCES Departamento(Departamento_ID)
);
SELECT *
FROM Pais p
ORDER BY p.NombrePais DESC;
GO
INSERT INTO Pais(NombrePais)
VALUES('Guatemala');
GO
INSERT INTO Pais(NombrePais)
VALUES('México'), ('Honduras'), ('Panamá');