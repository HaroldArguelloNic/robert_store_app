--Productos
CREATE PROCEDURE SP_RegistrarProducto
    @Codigo VARCHAR(20), 
    @Nombre NVARCHAR(50),
    @Existencia INT,
    @Estado BIT,
    @Proveedor NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Productos (Codigo, Nombre, Existencia, Estado, Proveedor)
    VALUES (@Codigo, @Nombre, @Existencia, @Estado, @Proveedor);
END
Go

CREATE PROCEDURE SP_EditarProducto
    @Id INT, 
    @Nombre NVARCHAR(50),
	@Codigo VARCHAR(20),
    @Existencia INT,
    @Estado BIT,
    @Proveedor NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Productos
    SET 
        Nombre = @Nombre,
		Codigo= @Codigo,
        Existencia = @Existencia,
        Estado = @Estado,
        Proveedor = @Proveedor
    WHERE 
        ProductoID = @Id; 
END
Go
CREATE PROCEDURE SP_BorrarProductoLogico
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Productos
    SET Estado = 0 
    WHERE ProductoID = @Id; 
END
Go

--Listado Productos activos
CREATE PROCEDURE SP_ListarProductosActivos
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
		ProductoID,
        Codigo,
        Nombre,
        Proveedor,
        Existencia,
        Estado
    FROM 
        Productos
    WHERE 
        Estado = 1; 
END
Go

--ListarProductos
CREATE PROCEDURE SP_ListarProductos
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
		ProductoID,
        Codigo,
        Nombre,
        Proveedor,
        Existencia,
        Estado
    FROM 
        Productos
END
Go

--Listado Productos Inactivos
CREATE PROCEDURE SP_ListarProductosInactivos
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
		ProductoID,
        Codigo,
        Nombre,
        Proveedor,
        Existencia,
        Estado
    FROM 
        Productos
    WHERE 
        Estado = 0;
END
Go

--Busqueda codigo o nombre
CREATE PROCEDURE SP_BuscarProducto
    @Busqueda NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Productos
    WHERE 
        Codigo LIKE '%' + @Busqueda + '%'
        OR Nombre LIKE '%' + @Busqueda + '%';
END;
Go

--Usuarios
CREATE PROCEDURE SP_RegistrarUsuario
    @NombreUsuario VARCHAR(50),
    @Contrasenia VARBINARY(60),
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50),
    @Correo VARCHAR(30),
    @Telefono VARCHAR(9)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Usuarios (NombreUsuario, Contrasenia, Nombre, Apellido, Correo, Telefono)
    VALUES (
        @NombreUsuario, 
        HASHBYTES('SHA2_256', @Contrasenia), -- Genera el hash de la contraseña
        @Nombre,
        @Apellido,
        @Correo,
        @Telefono
    );
END
Go

--validacion de usuario
CREATE PROCEDURE SP_ValidarUsuario
    @NombreUsuario VARCHAR(50),
    @Contrasenia VARBINARY(60)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM Usuarios
        WHERE Lower(NombreUsuario) = Lower(@NombreUsuario) 
        AND Contrasenia = HASHBYTES('SHA2_256', @Contrasenia) -- Genera el hash y lo compara
    )
    BEGIN
        SELECT 1 AS Resultado; -- Usuario y contraseña válidos
    END
    ELSE
    BEGIN
        SELECT 0 AS Resultado; -- Usuario o contraseña incorrectos
    END
END
 Go

 CREATE PROCEDURE SP_VerificarUsuarioExiste
    @NombreUsuario NVARCHAR(50)
AS
BEGIN
    DECLARE @ExisteUsuario BIT;
    
    IF EXISTS (SELECT 1 FROM Usuarios WHERE Lower(NombreUsuario) = Lower(@NombreUsuario))
    BEGIN
        SET @ExisteUsuario = 1; 
    END
    ELSE
    BEGIN
        SET @ExisteUsuario = 0;
    END

    
    SELECT @ExisteUsuario AS UsuarioExiste;
END;


--Opciones

CREATE PROCEDURE SP_RegistrarOpcion
    @NombreOpcion VARCHAR(50),
    @ProductoID INT,
	@Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Opciones (NombreOpcion,ProductoID,Estado)
    VALUES (
        @NombreOpcion, 
		@ProductoID,
		@Estado
    );
END
Go

CREATE PROCEDURE SP_ListarOpcionesProducto
 @ProductoId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
	Producto.ProductoID,
	Producto.Nombre,
	Opcion.OpcionID,
	Opcion.NombreOpcion,
	Opcion.Estado
    FROM 
       Productos As Producto
Inner Join Opciones As Opcion
on Producto.ProductoID = Opcion.ProductoID
    WHERE Producto.ProductoID = @ProductoId;
END

Go

CREATE PROCEDURE SP_ListarOpciones
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
	Opcion.OpcionID,
	Opcion.NombreOpcion,
	Opcion.Estado
    FROM 
      Opciones as Opcion
END

Go

CREATE PROCEDURE SP_EditarOpcion
    @OpcionID INT,
    @NombreOpcion VARCHAR(50),
    @Estado BIT
AS
BEGIN
    UPDATE Opciones
    SET NombreOpcion = @NombreOpcion,
        Estado = @Estado
    WHERE OpcionID = @OpcionID;
END
Go


select * from Usuarios