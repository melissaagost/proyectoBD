CREATE DATABASE SistemaCitas;
USE SistemaCitas;

--Provincia
CREATE TABLE Provincia (
  Id_Provincia INT NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  CONSTRAINT PK_P_IDPROVINCIA PRIMARY KEY (Id_Provincia)
);

-- Ciudad
CREATE TABLE Ciudad (
  CodigoPostal VARCHAR(10) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Id_Provincia INT NOT NULL,
  CONSTRAINT PK_C_CODIGOPOSTAL PRIMARY KEY (CodigoPostal),
  CONSTRAINT FK_C_IDPROVINCIA FOREIGN KEY (Id_Provincia) REFERENCES Provincia(Id_Provincia)
);

-- Direccion
CREATE TABLE Direccion (
  Calle VARCHAR(50) NOT NULL,
  Numero VARCHAR(50) NOT NULL,
  IdDireccion INT NOT NULL,
  CodigoPostal VARCHAR(10) NOT NULL,
  CONSTRAINT PK_D_ID_CODIGOPOSTAL PRIMARY KEY (CodigoPostal, IdDireccion),
  CONSTRAINT FK_D_CODIGOPOSTAL FOREIGN KEY (CodigoPostal) REFERENCES Ciudad(CodigoPostal)
);

-- Perfil
CREATE TABLE Perfil (
  Id_Perfil INT NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  CONSTRAINT PK_PERFIL_IDPERFIL PRIMARY KEY (Id_Perfil)
);

-- Especialidad
CREATE TABLE Especialidad (
  Id_Especialidad INT NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  CONSTRAINT PK_ESP_IDESPECIALIDAD PRIMARY KEY (Id_Especialidad)
);

-- HistorialMedico
CREATE TABLE HistorialMedico (
  Id_Historial INT NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  Fecha DATE NOT NULL,
  CONSTRAINT PK_HM_IDHISTORIAL PRIMARY KEY (Id_Historial)
);

-- Droga
CREATE TABLE Droga (
  Id_Droga INT NOT NULL,
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
  CodigoPostal VARCHAR(10) NOT NULL,
  IdDireccion INT NOT NULL,
  CONSTRAINT PK_PERSONA_NRODOCUMENTO PRIMARY KEY (NroDocumento),
  CONSTRAINT FK_PERSONA_CPID FOREIGN KEY (CodigoPostal, IdDireccion) REFERENCES Direccion(CodigoPostal, IdDireccion)
);

-- Paciente
CREATE TABLE Paciente (
  NroPaciente INT NOT NULL,
  ObraSocial VARCHAR(50),
  NroDocumento INT NOT NULL,
  CONSTRAINT PK_PACIENTE_NROPACNRODOC PRIMARY KEY (NroPaciente, NroDocumento),
  CONSTRAINT FK_PACIENTE_NRODOC FOREIGN KEY (NroDocumento) REFERENCES Persona(NroDocumento)
);

--Usuario
CREATE TABLE Usuario (
  Usuario VARCHAR(50) NOT NULL,
  Clave VARCHAR(50) NOT NULL,
  Estado VARCHAR(50) NOT NULL,
  Id_Usuario INT NOT NULL,
  Id_Perfil INT NOT NULL,
  NroDocumento INT NOT NULL,
  CONSTRAINT PK_USUARIO_IDUSUARIO PRIMARY KEY (Id_Usuario),
  CONSTRAINT FK_USUARIO_IDPERFIL FOREIGN KEY (Id_Perfil) REFERENCES Perfil(Id_Perfil),
  CONSTRAINT FK_USUARIO_NRODOCUMENTO FOREIGN KEY (NroDocumento) REFERENCES Persona(NroDocumento),
  CONSTRAINT CHK_ESTADO CHECK(Estado IN ('activo','inactivo')),
  CONSTRAINT U_USUARIO UNIQUE (Usuario)
);

-- Medico
CREATE TABLE Medico (
  NroMatricula INT NOT NULL,
  Id_Usuario INT NOT NULL,
  Id_Especialidad INT NOT NULL,
  CONSTRAINT PK_MEDICO_NROMAT PRIMARY KEY (NroMatricula),
  CONSTRAINT FK_MEDICO_IDUSUARIO FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario),
  CONSTRAINT FK_MEDICO_IDESPECIALIDAD FOREIGN KEY (Id_Especialidad) REFERENCES Especialidad(Id_Especialidad)
);

-- Tratamiento
CREATE TABLE Tratamiento (
  Id_Tratamiento INT NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Descripcion VARCHAR(255) NOT NULL,
  Id_Droga INT NOT NULL,
  CONSTRAINT PK_TRATAMIENTO_IDTRAT PRIMARY KEY (Id_Tratamiento),
  CONSTRAINT FK_TRATAMIENTO_IDDROGA FOREIGN KEY (Id_Droga) REFERENCES Droga(Id_Droga)
);

--Cita
CREATE TABLE Cita (
  Id_Cita INT NOT NULL,
  Fecha DATETIME CONSTRAINT DF_FECHACITA DEFAULT GETDATE(),
  Motivo VARCHAR(255) NOT NULL,
  NroMatricula INT NOT NULL,
  NroPaciente INT NOT NULL,
  NroDocumento INT NOT NULL,
  CONSTRAINT PK_CITA_IDCITA PRIMARY KEY (Id_Cita),
  CONSTRAINT FK_CITA_NROMAT FOREIGN KEY (NroMatricula) REFERENCES Medico(NroMatricula),
  CONSTRAINT FK_CITA_NROPAC_NRODOC FOREIGN KEY (NroPaciente, NroDocumento) REFERENCES Paciente(NroPaciente, NroDocumento)
);

--Ficha_Medica
CREATE TABLE Ficha_Medica (
  Id_Ficha INT NOT NULL,
  Diagnostico VARCHAR(50) NOT NULL,
  Observaciones VARCHAR(255) NOT NULL,
  Id_Historial INT NOT NULL,
  Id_Tratamiento INT NOT NULL,
  Id_Cita INT,
  NroPaciente INT NOT NULL,
  NroDocumento INT NOT NULL,
  CONSTRAINT PK_FICHA_IDFICHA PRIMARY KEY (Id_Ficha),
  CONSTRAINT FK_FICHA_IDHIST FOREIGN KEY (Id_Historial) REFERENCES HistorialMedico(Id_Historial),
  CONSTRAINT FK_FICHA_IDTRAT FOREIGN KEY (Id_Tratamiento) REFERENCES Tratamiento(Id_Tratamiento),
  CONSTRAINT FK_FICHA_IDCITA FOREIGN KEY (Id_Cita) REFERENCES Cita(Id_Cita),
  CONSTRAINT FK_FICHA_NROPAC_NRODOC FOREIGN KEY (NroPaciente, NroDocumento) REFERENCES Paciente(NroPaciente, NroDocumento)
);



