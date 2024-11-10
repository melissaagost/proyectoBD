Aplicación de lo investigado - Gestión de Permisos

En este readme, haré una breve explicación de lo que se desarrolló en el .sql contando el procedimiento que seguí. Hice uso de comandos que permite el ABM de los usuarios que tienen acceso a nuestra base de datos en el contexto de un sistema de citas para una clínica médica.

Primeramente, experimentamos con la creación de usuarios a nivel servidor ejecutando el siguiente query

--foto

Luego, usamos esos logins para crearlos a nivel base de datos

--foto

Podemos verificar que han sido creado exitosamente con el siguiente query:

--foto


Ahora bien, debemos asignar roles a estos usuarios para que puedan desempeñar sus funciones con lo cual lo primero que debemos hacer es crear roles y asignar permisos a los mismos. Por permisos, nos referimos a las sentencias SELECT, INSERT, UPDATE, etc. Cabe destacar que existen formas de asignar todos los permisos de forma automática con sentencias como CONTROL.

--foto

Y ahora, verificamos su existencia:

--foto

Para ejemplificar el uso de procedimientos, utilizaremos uno ya almacenado, que será el de cargar un paciente a la base de datos.

Antes, queremos verificar que nuestros usuarios tengan acceso a la base de datos del sistema de citas:
 --foto

Ahora que ya quedó claro eso, procedemos a hacer un insert en la tabla Persona de la cual heredará nuestro Paciente

--foto

Ahora hacemos uso del procedimiento:
  --

Verificamos la salida:

--foto

Concluido este breve experimento,

a nivel técnico, me demostró  la importancia de respetar las restricciones de claves foráneas al manipular datos en una base de datos relacional, y la necesidad de seguir un flujo lógico de inserciones para evitar conflictos y mantener la consistencia de los datos.


Como estudiante, puedo destacar la importancia de saber y, mas importante, entender el uso de estas funciones. No solo nos garantizan una gestión organizada de la información que deseamos manipular, sino que detrás de ello, existe la intención de brindar un servicio de calidad que protege nuestro sistema de la alteración incorrecta y la perdida de integridad de nuestros datos. Comprender temas de este indole nos encamina para poder desempeñarnos de forma profesional en nuestro futuro trabajo, entendiendo que no solamente estamos cumpliendo con nuestra tarea, sino que también estamos cuidando de lo que el cliente nos confía.
