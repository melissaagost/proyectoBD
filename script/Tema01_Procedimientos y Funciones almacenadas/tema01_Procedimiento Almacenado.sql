CREATE PROCEDURE spRegistrarCita
    @Fecha DATETIME = NULL,
    @Motivo VARCHAR(255),
    @NroMatricula INT,
    @NroPaciente INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Verificar si el médico con la matrícula especificada existe
        IF NOT EXISTS (SELECT 1 FROM Medico WHERE NroMatricula = @NroMatricula)
        BEGIN
            RAISERROR ('Error: El médico con la matrícula especificada no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Verificar si el paciente con el NroPaciente existe
        IF NOT EXISTS (SELECT 1 FROM Paciente WHERE NroPaciente = @NroPaciente)
        BEGIN
            RAISERROR ('Error: El paciente con el número de paciente especificado no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Insertar la cita en la tabla Cita
        INSERT INTO Cita (Fecha, Motivo, NroMatricula, NroPaciente)
        VALUES (ISNULL(@Fecha, GETDATE()), @Motivo, @NroMatricula, @NroPaciente);

        COMMIT TRANSACTION;

        PRINT 'Cita registrada exitosamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END;

        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO

--Prueba codigo con error. Paciente No existe
EXEC spRegistrarCita 
    @Fecha = '2024-11-09 15:00:00', 
    @Motivo = 'Control', 
    @NroMatricula = 1010, 
    @NroPaciente = 9999;  

--Prueba codigo exitosa
EXEC spRegistrarCita 
    @Fecha = '2024-11-07 14:00:00', 
    @Motivo = 'Consulta general', 
    @NroMatricula = 3030, 
    @NroPaciente = 2;

--Selecciono la tabla para corroborar datos cargados
select * from Cita


--Procedimiento para agregar un paciente
go
CREATE PROCEDURE spRegistrarPaciente
    @NroDocumento VARCHAR(20),
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @FechaNacimiento DATE,
    @Correo VARCHAR(100),
    @Telefono VARCHAR(20),
    @IdDireccion INT,
    @ObraSocial VARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Calcular la edad a partir de la fecha de nacimiento
        DECLARE @Edad INT;
        SET @Edad = DATEDIFF(YEAR, @FechaNacimiento, GETDATE());

        -- Ajustar la edad si el cumpleaños aún no ha ocurrido este año
        IF (DATEADD(YEAR, @Edad, @FechaNacimiento) > GETDATE())
        BEGIN
            SET @Edad = @Edad - 1;
        END;

        -- Verifica si existe persona con el mismo Documento
        IF EXISTS (SELECT 1 FROM Persona WHERE NroDocumento = @NroDocumento)
        BEGIN
            RAISERROR ('Error: Ya existe una persona con el mismo número de documento.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Insertar Persona
        INSERT INTO Persona (NroDocumento, Nombre, Apellido, FechaNacimiento, Correo, Telefono, IdDireccion, Edad)
        VALUES (@NroDocumento, @Nombre, @Apellido, @FechaNacimiento, @Correo, @Telefono, @IdDireccion, @Edad);

        -- Verificar si se insertó correctamente
        IF @@ROWCOUNT = 0
        BEGIN
            RAISERROR ('Error: No se pudo insertar la persona.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Insertar Paciente
        INSERT INTO Paciente (NroDocumento, ObraSocial)
        VALUES (@NroDocumento, @ObraSocial);

        COMMIT TRANSACTION;

        PRINT 'Paciente registrado exitosamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END;

        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO

--ejemplo de insertar paciente con dni existente
EXEC spRegistrarPaciente 
    @NroDocumento = '87654321',
    @Nombre = 'Carlos',
    @Apellido = 'Perez',
    @FechaNacimiento = '1985-05-10',
    @Correo = 'carlos.perez@example.com',
    @Telefono = '123456789',
    @IdDireccion = 1,
    @ObraSocial = 'Swiss Medical';

--ejemplo de insertar paciente nuevo 
EXEC spRegistrarPaciente 
    @NroDocumento = '43532954',
    @Nombre = 'Carlos',
    @Apellido = 'Perez',
    @FechaNacimiento = '1985-05-10',
    @Correo = 'carlos.perez@example.com',
    @Telefono = '123456789',
    @IdDireccion = 1,
    @ObraSocial = 'Swiss Medical';

--Registrar un tratamiento
go
CREATE PROCEDURE spRegistrarTratamiento
    @Nombre VARCHAR(100),
    @Descripcion VARCHAR(255) = NULL,
    @Id_Droga INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Verificar si la droga con el Id_Droga especificado existe
        IF NOT EXISTS (SELECT 1 FROM Droga WHERE Id_Droga = @Id_Droga)
        BEGIN
            RAISERROR ('Error: La droga especificada no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Insertar tratamiento
        INSERT INTO Tratamiento (Nombre, Descripcion, Id_Droga)
        VALUES (@Nombre, @Descripcion, @Id_Droga);

        -- Confirmar la transacción si la inserción fue exitosa
        COMMIT TRANSACTION;

        PRINT 'Tratamiento registrado exitosamente.';
    END TRY
    BEGIN CATCH
        
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END;

        
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO

-- Registrar un nuevo tratamiento para una droga inexistente
EXEC spRegistrarTratamiento 
    @Nombre = 'Tratamiento de Hipertensión',
    @Descripcion = 'Tratamiento basado en el uso de bloqueadores de canales de calcio',
    @Id_Droga = 15;

--Registrar con droga existente
EXEC spRegistrarTratamiento 
    @Nombre = 'Tratamiento de alergia',
    @Descripcion = 'Tratamiento basado en el uso de antialergico',
    @Id_Droga = 7;

	
	INSERT INTO Droga (Nombre)
	VALUES
	('Sertal'),
	('Dexalergin');

	select * from Droga
	-- Insertar Tratamientos 
	INSERT INTO Tratamiento ( Nombre, Descripcion, Id_Droga)
	VALUES
	( 'Tratamiento de dolor', 'Tratamiento para aliviar el dolor de cabeza', 1)


--Procedimiento almacenado para modificar tratamiento
--Modificar un tratamiento
GO
CREATE PROCEDURE spModificarTratamiento
    @Id_Tratamiento INT,
    @Nombre VARCHAR(100),
    @Descripcion VARCHAR(255) = NULL,
    @Id_Droga INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Verificar si el tratamiento con el Id_Tratamiento especificado existe
        IF NOT EXISTS (SELECT 1 FROM Tratamiento WHERE Id_Tratamiento = @Id_Tratamiento)
        BEGIN
            RAISERROR ('Error: El tratamiento especificado no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Verificar si la droga con el Id_Droga especificado existe
        IF NOT EXISTS (SELECT 1 FROM Droga WHERE Id_Droga = @Id_Droga)
        BEGIN
            RAISERROR ('Error: La droga especificada no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Actualizar tratamiento
        UPDATE Tratamiento
        SET Nombre = @Nombre,
            Descripcion = @Descripcion,
            Id_Droga = @Id_Droga
        WHERE Id_Tratamiento = @Id_Tratamiento;

        -- Confirmar la transacción si la actualización fue exitosa
        COMMIT TRANSACTION;

        PRINT 'Tratamiento modificado exitosamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END;

        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO
-- Modificar un tratamiento existente (Id_Tratamiento = 1)
EXEC spModificarTratamiento 
    @Id_Tratamiento = 1, 
    @Nombre = 'Tratamiento de Dolor Modificado', 
    @Descripcion = 'Nuevo tratamiento para dolor de cabeza', 
    @Id_Droga = 1;

