-- Insertamos un lote grande de citas
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

-- Búsqueda inicial sin índices adicionales
SELECT * FROM Cita
WHERE Fecha BETWEEN '2022-01-01' AND '2022-12-31';

-- Creamos un índice no agrupado en la columna Fecha
CREATE NONCLUSTERED INDEX idx_fecha ON Cita (Fecha);

-- Repetimos la búsqueda para medir la mejora
SELECT * FROM Cita WITH (INDEX(idx_fecha)) 
WHERE Fecha BETWEEN '2022-01-01' AND '2022-12-31';

-- Eliminamos el índice no agrupado
DROP INDEX idx_fecha ON Cita;

-- Creamos un índice no agrupado en Fecha e incluyendo NroMatricula
CREATE NONCLUSTERED INDEX idx_fecha_doctor ON Cita (Fecha) INCLUDE (NroMatricula);

-- Repetimos la búsqueda para medir el impacto
SELECT * FROM Cita WITH (INDEX(idx_fecha_doctor)) 
WHERE Fecha BETWEEN '2022-01-01' AND '2022-12-31' AND NroMatricula = 3;