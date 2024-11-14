--EJEMPLO 1
BEGIN TRANSACTION;

BEGIN TRY
    -- Insertar un nuevo registro en Persona antes de Paciente
    INSERT INTO Persona (NroDocumento, Nombre, Apellido, FechaNacimiento, Edad, IdDireccion)
    VALUES (12345678, 'Juan', 'P�rez', '1980-05-15', 43, 1);  -- Cambiar IdDireccion a un valor v�lido existente

    -- Insertar un registro en la tabla Paciente
    INSERT INTO Paciente (ObraSocial, NroDocumento)
    VALUES ('ObraSocialEjemplo', 12345678);

    -- Intentar insertar un registro en la tabla Cita relacionado con el paciente
    -- Provocar un error intencional en NroMatricula al pasar un valor NULL (asumiendo que NroMatricula es NOT NULL)
    INSERT INTO Cita (Fecha, Motivo, NroMatricula, NroPaciente)
    VALUES (GETDATE(), 'Consulta de prueba', NULL, SCOPE_IDENTITY());

    -- Actualizar la Ficha_Medica del paciente
    UPDATE Ficha_Medica
    SET Diagnostico = 'Diagn�stico actualizado en la transacci�n'
    WHERE NroPaciente = SCOPE_IDENTITY();

    -- Confirmar la transacci�n si todos los pasos anteriores son exitosos
    COMMIT;

    PRINT 'Transacci�n completada exitosamente';
END TRY

BEGIN CATCH
    -- Si ocurre un error, revertir toda la transacci�n
    PRINT 'Error detectado. Revirtiendo toda la transacci�n.';
    ROLLBACK;

    PRINT 'La transacci�n fue revertida completamente debido a un error.';
END CATCH;


--EJEMPLO 2

-- 1. Primera transacci�n: insertar Persona y Paciente
BEGIN TRANSACTION;

BEGIN TRY
    -- Insertar un nuevo registro en Persona
    INSERT INTO Persona (NroDocumento, Nombre, Apellido, FechaNacimiento, Edad, IdDireccion)
    VALUES (38985456, 'Juan', 'P�rez', '1980-05-15', 43, 2);  
	
    -- Insertar un registro en la tabla Paciente
    INSERT INTO Paciente (ObraSocial, NroDocumento)
    VALUES ('ObraSocialEjemplo', 38985456);

    -- Confirmar la primera transacci�n de inserci�n de Persona y Paciente
    COMMIT;

    PRINT 'Inserci�n de Persona y Paciente completada exitosamente.';
END TRY

BEGIN CATCH
    PRINT 'Error en la inserci�n de Persona o Paciente. Revirtiendo...';
    ROLLBACK;
    RETURN;  -- Detener el script si falla esta parte, ya que es crucial para los siguientes pasos
END CATCH;


-- 2. Segunda transacci�n: insertar Cita y actualizar Ficha_Medica
BEGIN TRANSACTION;

BEGIN TRY
    -- Intentar insertar un registro en la tabla Cita relacionado con el paciente
    -- Provocar un error intencional en NroMatricula al pasar un valor NULL (asumiendo que NroMatricula es NOT NULL)
    INSERT INTO Cita (Fecha, Motivo, NroMatricula, NroPaciente)
    VALUES (GETDATE(), 'Consulta de prueba', NULL, 38985456);

    -- Actualizar la Ficha_Medica del paciente
    UPDATE Ficha_Medica
    SET Diagnostico = 'Diagn�stico actualizado en la transacci�n'
    WHERE NroPaciente = 38985456;

    -- Confirmar la transacci�n si todos los pasos anteriores son exitosos
    COMMIT;

    PRINT 'Transacci�n de Cita y Ficha_Medica completada exitosamente.';
END TRY

BEGIN CATCH
    -- Si ocurre un error en esta segunda parte, revertir solo lo que se ha hecho en esta transacci�n
    PRINT 'Error detectado en la inserci�n de Cita o actualizaci�n de Ficha_Medica. Revirtiendo transacci�n.';
    ROLLBACK;
END CATCH;
