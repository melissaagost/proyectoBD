
--estos son algunos de los queries que podemos implementar al manejar permisos en nuestra base de datos

--creamos usarios y roles
--creamos usuarios: primero debemos crear un login y luego utilizar nuestra base de datos

--creamos un user para el servidor
create login usuario_lectura with password = 'contraseña'
create login usuario_admin with password = 'contraseña'

--ahora para nuestro sistema
use SistemaCitas;
create user usuario_lectura for login usuario_lectura
create user usuario_admin for login usuario_admin

--verificamos listando los logins del server
select name, type_desc, is_disabled 
from sys.server_principals
where type IN ('S', 'U');  -- 'S' para SQL logins, 'U' para Windows logins

--ahora verificamos los usuarios de nuestra base de datos
use SistemaCitas;
select name, type_desc, authentication_type_desc
from sys.database_principals
where type IN ('S', 'U');  -- 'S' para SQL usuarios, 'U' para Windows usuarios





--creamos roles y asignamos
create role rol_lectura;
create role rol_admin;

alter role rol_lectura add member usuario_lectura;
alter role rol_admin add member usuario_admin;

--cargamos permisos especificos en estos roles
grant select on schema::dbo to rol_lectura;
grant control on schema::dbo to rol_admin;

---verificamos nuestras creaciones
--permisos
use SistemaCitas

select
    princ.name as Usuario, --nombre
    perm.permission_name as Permiso, --tipo de permiso q otorgamos
    perm.state_desc as Estado, --estado: otorgado / denegado
    obj.name as Objeto --funcion sobre la cual trabajamos el permiso
from
    sys.database_permissions AS perm
join
    sys.database_principals AS princ ON perm.grantee_principal_id = princ.principal_id
left join
    sys.objects AS obj ON perm.major_id = obj.object_id
where
    princ.name = 'usuario_admin';

--roles
select
    dp.name AS Usuario,
    r.name AS Rol
from
    sys.database_role_members AS drm
join
    sys.database_principals AS dp ON drm.member_principal_id = dp.principal_id
join
    sys.database_principals AS r ON drm.role_principal_id = r.principal_id
where 
    dp.name = 'usuario_admin';




--otorgamos procedimiento al usuario admin
grant execute on object::CargarPaciente to usuario_admin;

--ahora probamos ejecutar CargarPaciente con ambos usuarios
-- Ejemplo: nos conectamos con el rol del usuario admin e intentamos cargar un paciente
ALTER LOGIN usuario_admin ENABLE;

-- verificar que el usuario tiene acceso a la base de datos de nuestro sistema d ecitas
USE master;
select dp.name AS Usuario, dp.type_desc, dp.authentication_type_desc
from sys.database_principals dp
where dp.name = 'usuario_admin';

select dp.name AS Usuario, dp.type_desc, dp.authentication_type_desc
from sys.database_principals dp
where dp.name = 'usuario_lectura';

--insertar un registro en la tabla Persona
use SistemaCitas
INSERT INTO Persona (NroDocumento, Nombre, Apellido, FechaNacimiento, Correo, Telefono, Edad, IdDireccion)
VALUES (12355678, 'Juan', 'Pérez', '1990-01-01', 'juan.perez@example.com', '23636789', 34, 1);

-- ejecutar el procedimiento almacenado CargarPaciente para insertar al paciente
exec CargarPaciente @dni = 12355678, @obraSocial = 101;

select * from paciente








