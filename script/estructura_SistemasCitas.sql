CREATE DATABASE SistemaCitas;
USE SistemaCitas;

-- Provincia
CREATE TABLE Provincia (
  Id_Provincia INT IDENTITY(1,1) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  CONSTRAINT PK_PROVINCIA PRIMARY KEY (Id_Provincia)
);

-- Ciudad
CREATE TABLE Ciudad (
  CodigoPostal VARCHAR(10) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Id_Provincia INT NOT NULL,
  CONSTRAINT PK_CIUDAD PRIMARY KEY (CodigoPostal),
  CONSTRAINT FK_CIUDAD_PROVINCIA FOREIGN KEY (Id_Provincia) REFERENCES Provincia(Id_Provincia)
);

-- Direccion
CREATE TABLE Direccion (
  IdDireccion INT IDENTITY(1,1) NOT NULL,
  Calle VARCHAR(50) NOT NULL,
  Numero VARCHAR(50) NOT NULL,
  CodigoPostal VARCHAR(10) NOT NULL,
  CONSTRAINT PK_DIRECCION PRIMARY KEY (IdDireccion),
  CONSTRAINT FK_DIRECCION_CIUDAD FOREIGN KEY (CodigoPostal) REFERENCES Ciudad(CodigoPostal)
);

-- Perfil
CREATE TABLE Perfil (
  Id_Perfil INT IDENTITY(1,1) NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  CONSTRAINT PK_PERFIL_IDPERFIL PRIMARY KEY (Id_Perfil)
);

-- Especialidad
CREATE TABLE Especialidad (
  Id_Especialidad INT IDENTITY(1,1) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  CONSTRAINT PK_ESP_IDESPECIALIDAD PRIMARY KEY (Id_Especialidad)
);

-- HistorialMedico
CREATE TABLE HistorialMedico (
  Id_Historial INT IDENTITY(1,1) NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  Fecha DATE NOT NULL,
  CONSTRAINT PK_HM_IDHISTORIAL PRIMARY KEY (Id_Historial)
);

-- Droga
CREATE TABLE Droga (
  Id_Droga INT IDENTITY(1,1) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  CONSTRAINT PK_D_IDDROGA PRIMARY KEY (Id_Droga)
);

-- Persona
CREATE TABLE Persona (
  NroDocumento INT NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Apellido VARCHAR(50) NOT NULL,
  FechaNacimiento DATE NOT NULL,
  Correo VARCHAR(50),
  Telefono VARCHAR(50),
  Edad INT NOT NULL,
  IdDireccion INT NOT NULL,
  CONSTRAINT PK_PERSONA PRIMARY KEY (NroDocumento),
  CONSTRAINT FK_PERSONA_DIRECCION FOREIGN KEY (IdDireccion) REFERENCES Direccion(IdDireccion)
);

-- Paciente
CREATE TABLE Paciente (
  NroPaciente INT IDENTITY(1,1) NOT NULL,
  ObraSocial VARCHAR(50),
  NroDocumento INT NOT NULL,
  CONSTRAINT PK_PACIENTE PRIMARY KEY (NroPaciente),
  CONSTRAINT FK_PACIENTE_PERSONA FOREIGN KEY (NroDocumento) REFERENCES Persona(NroDocumento)
);

-- Usuario
CREATE TABLE Usuario (
  Id_Usuario INT IDENTITY(1,1) NOT NULL,
  Usuario VARCHAR(50) NOT NULL UNIQUE,
  Clave VARCHAR(50) NOT NULL,
  Estado VARCHAR(50) NOT NULL CHECK (Estado IN ('activo', 'inactivo')),
  Id_Perfil INT NOT NULL,
  NroDocumento INT NOT NULL,
  CONSTRAINT PK_USUARIO PRIMARY KEY (Id_Usuario),
  CONSTRAINT FK_USUARIO_PERFIL FOREIGN KEY (Id_Perfil) REFERENCES Perfil(Id_Perfil),
  CONSTRAINT FK_USUARIO_PERSONA FOREIGN KEY (NroDocumento) REFERENCES Persona(NroDocumento)
);

-- Medico
CREATE TABLE Medico (
  NroMatricula INT NOT NULL,
  Id_Usuario INT NOT NULL,
  Id_Especialidad INT NOT NULL,
  CONSTRAINT PK_MEDICO PRIMARY KEY (NroMatricula),
  CONSTRAINT FK_MEDICO_USUARIO FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario),
  CONSTRAINT FK_MEDICO_ESPECIALIDAD FOREIGN KEY (Id_Especialidad) REFERENCES Especialidad(Id_Especialidad)
);

-- Tratamiento
CREATE TABLE Tratamiento (
  Id_Tratamiento INT IDENTITY(1,1) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Descripcion VARCHAR(255) NOT NULL,
  Id_Droga INT NOT NULL,
  CONSTRAINT PK_TRATAMIENTO PRIMARY KEY (Id_Tratamiento),
  CONSTRAINT FK_TRATAMIENTO_DROGA FOREIGN KEY (Id_Droga) REFERENCES Droga(Id_Droga)
);

-- Cita
CREATE TABLE Cita (
  Id_Cita INT IDENTITY(1,1) NOT NULL,
  Fecha DATETIME DEFAULT GETDATE(),
  Motivo VARCHAR(255) NOT NULL,
  NroMatricula INT NOT NULL,
  NroPaciente INT NOT NULL,
  CONSTRAINT PK_CITA PRIMARY KEY (Id_Cita),
  CONSTRAINT FK_CITA_MEDICO FOREIGN KEY (NroMatricula) REFERENCES Medico(NroMatricula),
  CONSTRAINT FK_CITA_PACIENTE FOREIGN KEY (NroPaciente) REFERENCES Paciente(NroPaciente)
);

-- Ficha_Medica
CREATE TABLE Ficha_Medica (
  Id_Ficha INT IDENTITY(1,1) NOT NULL,
  Diagnostico VARCHAR(50) NOT NULL,
  Observaciones VARCHAR(255) NOT NULL,
  Id_Historial INT NOT NULL,
  Id_Tratamiento INT NOT NULL,
  Id_Cita INT,
  NroPaciente INT NOT NULL,
  CONSTRAINT PK_FICHA PRIMARY KEY (Id_Ficha),
  CONSTRAINT FK_FICHA_HISTORIAL FOREIGN KEY (Id_Historial) REFERENCES HistorialMedico(Id_Historial),
  CONSTRAINT FK_FICHA_TRATAMIENTO FOREIGN KEY (Id_Tratamiento) REFERENCES Tratamiento(Id_Tratamiento),
  CONSTRAINT FK_FICHA_CITA FOREIGN KEY (Id_Cita) REFERENCES Cita(Id_Cita),
  CONSTRAINT FK_FICHA_PACIENTE FOREIGN KEY (NroPaciente) REFERENCES Paciente(NroPaciente)
);
