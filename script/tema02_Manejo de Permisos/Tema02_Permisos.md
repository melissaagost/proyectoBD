Aplicación de lo investigado - Manejo de Permisos a Nivel Usuario en una Base de Datos

En nuestro sistema, contamos con 3 roles: 1.admin, 2.medico 3.recepcionista. Podemos gestionar el accionar de cada rol mediante permisos. Ahora bien, abordaremos distintos escenarios que se nos pueden presentar:


1. Asignación de Roles: en situaciones donde se necesita asignar más de un administrador, se puede utilizar una consulta SQL para otorgar el rol necesario:


				UPDATE usuarios SET id_perfil = 'admin' WHERE id_usuario = 2;


Esta acción permite que el usuario con `id_usuario = 2` obtenga los permisos de administrador.




2. Verificación de Permiso: Para verificar quiénes tienen permisos para modificar una cita programada:

				SELECT id_usuario, nombre FROM permisos WHERE accion = 'modificar_cita';


Esto mostrará los usuarios que pueden realizar modificaciones en las citas.

3. Acceso a Información de Pacientes: Si se necesita revisar qué usuarios pueden acceder a información de pacientes:

				SELECT id_usuario, nombre FROM permisos WHERE accion = 'acceso_paciente';


4. Revocación de Permisos: Cuando es necesario restringir el acceso de un usuario, se puede revocar el permiso con:

				REVOKE SELECT ON tabla_pacientes FROM usuario_especifico;


En caso de que el sistema no admita campos nulos en `id_perfil`, se deberá asignar un nuevo perfil, como “Visitante”, que no tenga permisos de modificación:


				UPDATE usuarios SET id_perfil = 'visitante' WHERE id_usuario = 3;


5. Manejo de Permisos Automatizado: Para gestionar permisos de manera centralizada, se pueden utilizar comandos como `GRANT` y `REVOKE`.


Para un médico que solo necesita ver información sobre citas y pacientes:


				GRANT SELECT ON citas, pacientes TO medico;


Un recepcionista necesita gestionar citas, pero solo tiene permisos de lectura para pacientes:


				GRANT SELECT ON pacientes TO recepcionista;
				GRANT INSERT, UPDATE ON citas TO recepcionista;



El administrador debe tener acceso completo a la base de datos:

				GRANT ALL PRIVILEGES ON *.* TO admin;



La gestión adecuada de permisos es vital para mantener la seguridad y la eficiencia en el acceso a la información de la base de datos. Implementar estos comandos asegura un control amplio y adaptado a las necesidades de cada rol.

