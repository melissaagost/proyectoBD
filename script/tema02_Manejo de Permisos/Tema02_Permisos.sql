USE SistemaCitas;

--estos son algunos de los queries que podemos implementar al manejar permisos en nuestra base de datos
select * from Usuario
select * from Paciente
select * from persona
---Asignar roles a usuarios 
---cambiamos de "id_perfil = 2 (médico) a id_perfil = 1 (admin)"
UPDATE Usuario
SET id_perfil = 1
WHERE id_usuario = 2;  

---Verificacion de permisos de acceso
select id_usuario, p.Nombre, Id_Perfil from usuario u
join Persona p on p.NroDocumento = u.NroDocumento
where Id_Perfil in (2 , 3);


--Revocacion de permisos
update Usuario
set Id_Perfil = null where Id_Usuario = 2

---creamos  un perfil sin permisos
insert into Perfil(Descripcion)
values ('Visitante')

select * from Perfil
update Usuario
set Id_Perfil = 4  where Id_Usuario = 2


---manejo de permisos para actualizar datos del paciente
--accedemos al usuario logueado al moemnto
DECLARE @UserID INT;
SET @UserID = (SELECT Id_Usuario FROM Usuario WHERE Usuario = SYSTEM_USER);


update Persona
set Telefono = '123456559'
where NroDocumento = (
    select p.NroDocumento from Paciente pa
    join Persona p on pa.NroDocumento = p.NroDocumento
    where pa.NroPaciente = 4
  )
and exists (
    select 1 from Usuario u
    join Perfil pf ON u.Id_Perfil = pf.Id_Perfil
    WHERE u.Id_Usuario = @UserID
      AND pf.Id_Perfil IN (2, 3)  -- Solo medico o recepcionista pueden actualizar
  );


---otorgamos permisos especificos a diferentes usuarios de forma automática usando GRANT
---medico
grant select on Cita to [miguel.san];
grant select on Paciente to [miguel.san];
grant select on Ficha_Medica to [miguel.san];

--recep
select * from Usuario

--permisos para gestionar citas
grant select, insert, update, delete on Cita to [recepcion1];
grant select, insert, update, delete on Cita to [ana.rod];
grant select, insert, update, delete on Cita to [laura.fer];


--permiso solo de lectura para ver información de pacientes
grant select ON Paciente TO [recepcion1];
grant select ON Paciente TO [ana.rod];
grant select ON Paciente TO [laura.fer];


-- permiso solo de lectura sobre las fichas médicas 
--(si es necesario para ver antecedentes antes de crear o modificar una cita)
grant select Ficha_Medica TO [recepcion1];
grant select Ficha_Medica TO [ana.rod];
grant select Ficha_Medica TO [laura.fer];


---admin
grant all privileges on Medico to [admin1];
grant all privileges on Paciente to [admin1];
grant all privileges on Cita to [admin1];
grant all privileges on Ficha_medica to [admin1];
grant all privileges on Especialidad to [admin1];

