Aplicacion de lo investigado - Optimización de Consultas con Índices

Para demostrar las ventajas de la optimización empezaremos por insertar un lote de datos masivos de 500 mil de citas médicas en la tabla Cita, utilizando un script que genera datos aleatorios dentro de un rango. Por ejemplo, para las fechas lo manejamos con un rango de 10 años desde 2015.  

DECLARE @i INT = 1;

WHILE @i <= 500000
BEGIN
    INSERT INTO Cita (Fecha, Motivo, NroMatricula, NroPaciente, NroDocumento)
    VALUES (
        DATEADD(DAY, RAND() * 3650, '2015-01-01'),  
        'Motivo de la cita ' + CAST(@i AS VARCHAR),  
        (SELECT TOP 1 NroMatricula FROM Medico ORDER BY NEWID()),
        (SELECT TOP 1 NroPaciente FROM Paciente ORDER BY NEWID()),
        (SELECT TOP 1 NroDocumento 
         FROM Paciente 
         WHERE NroPaciente = (SELECT TOP 1 NroPaciente FROM Paciente ORDER BY NEWID()))
    );
    SET @i = @i + 1;
END;
