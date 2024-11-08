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
        -- Si ocurre algún error, revertir la transacción
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END;

        -- Capturar y mostrar el error
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
