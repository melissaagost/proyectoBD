USE SistemaCitas;

-- Insertar Provincias
INSERT INTO Provincia (Nombre) VALUES
('Buenos Aires'),
('Córdoba'),
('Santa Fe');

-- Insertar Ciudades
INSERT INTO Ciudad (CodigoPostal, Nombre, Id_Provincia) VALUES
('1407', 'Ciudad Autónoma de Buenos Aires', 1),
('5000', 'Córdoba', 2),
('2000', 'Rosario', 3);

-- Insertar Direcciones
INSERT INTO Direccion (Calle, Numero, CodigoPostal) VALUES
('Av. Corrientes', '1234', '1407'),
('Calle San Martín', '5678', '5000'),
('Bv. Oroño', '9101', '2000');

-- Insertar Perfiles
INSERT INTO Perfil (Descripcion) VALUES
('Administrador'),
('Medico'),
('Recepcionista');

-- Insertar Especialidades
INSERT INTO Especialidad (Nombre) VALUES
('Cardiología'),
('Dermatología'),
('Pediatría');

-- Insertar Drogas
INSERT INTO Droga (Nombre) VALUES
('Ibuprofeno'),
('Amoxicilina'),
('Paracetamol');

-- Insertar Historial Médico
INSERT INTO HistorialMedico (Descripcion, Fecha) VALUES
('Hipertensión controlada', '2024-01-15'),
('Alergia estacional', '2023-05-20'),
('Control de crecimiento infantil', '2024-06-10');

-- Insertar Personas
INSERT INTO Persona (NroDocumento, Nombre, Apellido, FechaNacimiento, Correo, Telefono, Edad, IdDireccion) VALUES
(12345678, 'Juan', 'Pérez', '1985-02-15', 'juan.perez@gmail.com', '123456789', 39, 1),
(87654321, 'María', 'Gómez', '1990-07-10', 'maria.gomez@gmail.com', '987654321', 34, 2),
(56789012, 'Carlos', 'López', '1978-11-22', 'carlos.lopez@gmail.com', '456789123', 45, 3);

-- Insertar Pacientes
INSERT INTO Paciente (ObraSocial, NroDocumento) VALUES
('OSDE', 12345678),
('Swiss Medical', 87654321),
('Galeno', 56789012);

-- Insertar Usuarios
INSERT INTO Usuario (Usuario, Clave, Estado, Id_Perfil, NroDocumento) VALUES
('admin1', 'admin123', 'activo', 1, 12345678),
('drmartinez', 'medico456', 'activo', 2, 87654321),
('recepcion1', 'recepcion789', 'activo', 3, 56789012);

-- Insertar Médicos (NroMatricula ya asignado manualmente)
INSERT INTO Medico (NroMatricula, Id_Usuario, Id_Especialidad) VALUES
(1010, 2, 1),
(2020, 2, 2),
(3030, 2, 3);

-- Insertar Tratamientos
INSERT INTO Tratamiento (Nombre, Descripcion, Id_Droga) VALUES
('Tratamiento de hipertensión', 'Controlar presión arterial', 1),
('Antibióticos para infección', 'Tratar infección bacteriana', 2),
('Antipirético para fiebre', 'Reducir fiebre', 3);

-- Insertar Citas
INSERT INTO Cita (Fecha, Motivo, NroMatricula, NroPaciente) VALUES
('2024-11-05 09:00:00', 'Chequeo de presión', 1010, 1),
('2024-11-06 11:30:00', 'Revisión dermatológica', 2020, 2),
('2024-11-07 14:00:00', 'Consulta pediátrica', 3030, 3);

-- Insertar Fichas Médicas
INSERT INTO Ficha_Medica (Diagnostico, Observaciones, Id_Historial, Id_Tratamiento, Id_Cita, NroPaciente) VALUES
('Hipertensión controlada', 'Paciente estable', 1, 1, 1, 1),
('Alergia leve tratada', 'Mejoría en el paciente', 2, 2, 2, 2),
('Desarrollo normal', 'Seguimiento adecuado', 3, 3, 3, 3);
