
CREATE DATABASE EmpresaProductosDB;
GO

USE EmpresaProductosDB;
GO


CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    Codigo VARCHAR(20) NOT NULL UNIQUE,
    Nombre NVARCHAR(50) NOT NULL,
    Existencia INT NOT NULL CHECK (Existencia >= 0),
    Estado BIT NOT NULL,  -- 1 = 
    Proveedor NVARCHAR(50)
);
Go

CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    NombreUsuario VARCHAR(50) NOT NULL UNIQUE,
    Contrasenia VARBINARY(60) NOT NULL,    
	Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Telefono VARCHAR(9) CHECK (Telefono LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
    FechaCreacion DATETIME DEFAULT GETDATE()
);
Go

CREATE TABLE Opciones (
    OpcionID INT PRIMARY KEY IDENTITY(1,1),
    NombreOpcion NVARCHAR(50) NOT NULL,
    ProductoID INT FOREIGN KEY REFERENCES Productos(ProductoID),
    Estado BIT NOT NULL  -- 
);
Go
