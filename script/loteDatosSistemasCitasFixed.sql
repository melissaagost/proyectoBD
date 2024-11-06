use SistemaCitas
--LOTE DE DATOS
USE SistemaCitas
-- PERFIL
INSERT INTO Perfil (Id_Perfil, Descripcion) VALUES
(1, 'sistemas'), 
(2, 'gestor'), 
(3, 'medico'), 
(4, 'recepcionista'); --Listo

INSERT INTO Provincia (Id_Provincia, Nombre) VALUES
(1, 'Buenos Aires'), 
(2, 'Córdoba'), 
(3, 'Santa Fe'), 
(4, 'Mendoza'), 
(5, 'Salta'),
(6, 'San Juan'), 
(7, 'La Rioja'), 
(8, 'Chaco'), 
(9, 'Tucumán'), 
(10, 'Misiones'), 
(11, 'Entre Ríos'), 
(12, 'San Luis'), 
(13, 'Catamarca'), 
(14, 'Jujuy'), 
(15, 'Corrientes'); -- listo

INSERT INTO Ciudad (CodigoPostal, Nombre, Id_Provincia) VALUES
(1000, 'La Plata', 1), 
(5000, 'Córdoba Capital', 2), 
(2000, 'Rosario', 3), 
(5500, 'Mendoza Capital', 4), 
(4400, 'Salta Capital', 5), 
('5400', 'San Juan Capital', 6), 
('5300', 'La Rioja Capital', 7), 
('3500', 'Resistencia', 8), 
('4000', 'San Miguel de Tucumán', 9), 
('3300', 'Posadas', 10), 
('3100', 'Paraná', 11), 
('5700', 'San Luis Capital', 12), 
('4700', 'San Fernando del Valle de Catamarca', 13), 
('4600', 'San Salvador de Jujuy', 14), 
('3400', 'Corrientes Capital', 15); --listo

INSERT INTO Direccion (Calle, Numero, IdDireccion, CodigoPostal) VALUES
('Calle Falsa', '123', 1, '1000'), 
('Avenida Siempreviva', '742', 2, '5000'), 
('San Martín', '456', 3, '2000'), 
('Rivadavia', '789', 4, '5500'), 
('Belgrano', '101', 5, '4400'), 
('Calle 1', '111', 6, '5400'), 
('Calle 2', '222', 7, '5300'), 
('Calle 3', '333', 8, '3500'), 
('Calle 4', '444', 9, '4000'), 
('Calle 5', '555', 10, '3300'), 
('Calle 6', '666', 11, '3100'), 
('Calle 7', '777', 12, '5700'), 
('Calle 8', '888', 13, '4700'), 
('Calle 9', '999', 14, '4600'), 
('Calle 10', '1010', 15, '3400');-- Listo

INSERT INTO Persona (NroDocumento, Nombre, Apellido, FechaNacimiento, Correo, Telefono, Edad, CodigoPostal, IdDireccion) VALUES
('12345678', 'Juan', 'Pérez', '1980-05-15', 'juan.perez@example.com', '341-1234567', 44, '1000', 1),
('87654321', 'Ana', 'Gómez', '1992-08-22', 'ana.gomez@example.com', '351-2345678', 32, '5000', 2),
('11223344', 'Carlos', 'Lopez', '1985-07-10', 'carlos.lopez@example.com', '261-1122334', 39, '5400', 6),
('33445566', 'María', 'Diaz', '1975-09-21', 'maria.diaz@example.com', '387-3344556', 49, '5300', 7),
('55667788', 'Pedro', 'Ramirez', '1991-03-12', 'pedro.ramirez@example.com', '362-5566778', 33, '3500', 8),
('77889900', 'Laura', 'Torres', '1989-01-15', 'laura.torres@example.com', '381-7788990', 35, '4000', 9),
('99887766', 'Miguel', 'Sanchez', '1994-04-10', 'miguel.sanchez@example.com', '376-9988776', 30, '3300', 10); --Listo

INSERT INTO Especialidad (Id_Especialidad, Nombre) VALUES
(1, 'Cardiología'), 
(2, 'Neurología'), 
(3, 'Pediatría'), 
(4, 'Dermatología'), 
(5, 'Ginecología'), 
(6, 'Oncología'), 
(7, 'Endocrinología'), 
(8, 'Reumatología'), 
(9, 'Psiquiatría'), 
(10, 'Gastroenterología');-- Listo

INSERT INTO HistorialMedico (Id_Historial, Descripcion, Fecha) VALUES
(1, 'Chequeo inicial', '2024-11-01'), 
(2, 'Control periódico', '2024-11-05'), 
(3, 'Revisión postoperatoria', '2024-11-08'), 
(4, 'Consulta urgente', '2024-11-10'), 
(5, 'Análisis de sangre', '2024-11-12'), 
(6, 'Examen de rutina', '2024-11-14'), 
(7, 'Diagnóstico de alergias', '2024-11-15'), 
(8, 'Pruebas de función hepática', '2024-11-16'), 
(9, 'Examen neurológico', '2024-11-17'), 
(10, 'Chequeo pulmonar', '2024-11-18'), (11, 'Evaluación ortopédica', '2024-11-19'); --Listo

INSERT INTO Droga (Id_Droga, Nombre) VALUES
(1, 'Aspirina'), 
(2, 'Paracetamol'), 
(3, 'Ibuprofeno'), 
(4, 'Amoxicilina'), 
(5, 'Metformina'), 
(6, 'Clonazepam'), 
(7, 'Omeprazol'), 
(8, 'Prednisona'), 
(9, 'Ciprofloxacina'), 
(10, 'Diclofenac'), 
(11, 'Loratadina'), 
(12, 'Alprazolam'), 
(13, 'Enalapril');-- Listo

-- Insertar datos en tablas dependientes

INSERT INTO Usuario (Id_Usuario, Usuario, Clave, Estado, Id_Perfil, NroDocumento) VALUES
(1, 'sistemas_user', 'password123', 'activo', 1, 12345678),
(2, 'gestor_user', 'password123', 'activo', 2, 87654321), 
(3, 'medico_1', 'clave123', 'activo', 3, 11223344),
(4, 'recepcionista', 'clave123', 'activo', 4, 33445566),
(5, 'medico_2', 'clave123', 'activo', 3, 55667788),
(6, 'medico_3', 'clave123', 'activo', 3, 77889900),
(7, 'medico_4', 'clave123', 'activo', 3, 99887766);--Listo

INSERT INTO Paciente (NroPaciente, NroDocumento, ObraSocial) VALUES
(1, '12345678', 'PAMI'), 
(2, '87654321', 'IOSCOR'),
(3, 11223344, 'OSDE'), 
(4, 33445566, 'Swiss Medical'), 
(5, 55667788, 'IOMA'), 
(6, 77889900, 'Accord Salud'), 
(7, 99887766, 'Galeno'); --Listo Select * from Paciente


INSERT INTO Medico (NroMatricula, Id_Usuario, Id_Especialidad) VALUES
(3, 3, 5), 
(5, 5, 7), 
(6, 6, 8), 
(7, 7, 9); --Listo select * from Medico


INSERT INTO Tratamiento (Id_Tratamiento, Nombre, Descripcion, Id_Droga) VALUES
(1, 'Tratamiento para hipertensión', 'Control de presión arterial', 1), 
(2, 'Tratamiento para diabetes', 'Control de azúcar en sangre', 2),
(3, 'Terapia antialérgica', 'Tratamiento para alergias', 11), 
(4, 'Terapia hormonal', 'Regulación de hormonas', 5),
(5, 'Tratamiento de ansiedad', 'Control de ansiedad', 12), 
(6, 'Terapia analgésica', 'Alivio de dolor crónico', 10); --Listo

INSERT INTO Cita (Id_Cita, Fecha, Motivo, NroMatricula, NroPaciente, NroDocumento) VALUES
(1, '2024-11-10', 'Chequeo general', 3, 1, '12345678'), 
(2, '2024-11-11', 'Control de presión', 5, 2, '87654321'),
(3, '2024-11-12', 'Consulta endocrinológica', 5, 3, 11223344), 
(4, '2024-11-13', 'Consulta oncológica', 7, 4, 33445566),
(5, '2024-11-14', 'Evaluación psiquiátrica', 7, 5, 55667788), 
(6, '2024-11-15', 'Revisión ortopédica', 6, 6, 77889900);

INSERT INTO Ficha_Medica (Id_Ficha, Diagnostico, Observaciones, Id_Historial, Id_Tratamiento, Id_Cita, NroPaciente, NroDocumento) VALUES
(1, 'Hipertensión', 'Paciente necesita control mensual', 1, 1, 1, 1, '12345678'),
(2, 'Hipotiroidismo', 'Requiere seguimiento cada seis meses', 3, 3, 3, 3, '11223344'),
(3, 'Anemia leve', 'Suplementación recomendada', 4, 4, 4, 4, '33445566'),
(4, 'Depresión leve', 'Control con terapia y medicamentos', 5, 5, 5, 5, '55667788'),
(5, 'Lumbalgia crónica', 'Sesiones de fisioterapia', 6, 6, 6, 6, '77889900');



