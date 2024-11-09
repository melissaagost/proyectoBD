use SistemaCitas

go
CREATE FUNCTION dbo.ContarCitasPorMedico
(
    @NroMatricula INT
)
RETURNS INT
AS
BEGIN
    DECLARE @CitasCount INT;

    -- Contamos cuántas citas están asociadas a este NroMatricula
    SELECT @CitasCount = COUNT(*)
    FROM Cita
    WHERE NroMatricula = @NroMatricula;

    RETURN @CitasCount;
END;
GO

-- Llamada a la función para obtener el número de citas de un médico con NroMatricula 1010
SELECT dbo.ContarCitasPorMedico(3030) AS NumeroDeCitas;

--prueba en extraccion de datos
SELECT 
    M.NroMatricula as 'Matricula',
	pe.Descripcion,
	P.NroDocumento 'Documento',
	P.Nombre,
	P.Apellido,
    dbo.ContarCitasPorMedico(M.NroMatricula) AS NumeroDeCitas
FROM 
    Medico M
INNER JOIN USUARIO U ON U.Id_Usuario = M.Id_Usuario
INNER JOIN Perfil Pe ON Pe.Id_Perfil = u.Id_Perfil
INNER JOIN Persona P ON P.NroDocumento = U.NroDocumento
where M.NroMatricula = 3030

go
CREATE FUNCTION fnCalcularEdad(@FechaNacimiento DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @FechaNacimiento, GETDATE());
END;
GO

-- Ejemplo de uso
SELECT dbo.fnCalcularEdad('1990-05-15') AS Edad;

select * from Paciente
go
CREATE FUNCTION fnObtenerObraSocial(@NroPaciente INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @ObraSocial VARCHAR(100);
    
    SELECT @ObraSocial = ObraSocial
    FROM Paciente
    WHERE NroPaciente = @NroPaciente;

    RETURN ISNULL(@ObraSocial, 'No registrada');
END;
GO
--Ejemplo de uso satisfactorio
SELECT dbo.fnObtenerObraSocial(1) AS ObraSocial;

--ejemplo con errror
SELECT dbo.fnObtenerObraSocial(5) AS ObraSocial;

