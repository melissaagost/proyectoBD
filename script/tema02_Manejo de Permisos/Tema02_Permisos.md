Aplicación de lo investigado - Gestión de Permisos

En este readme, haré una breve explicación de lo que se desarrolló en el .sql contando el procedimiento que seguí. Hice uso de comandos que permite el ABM de los usuarios que tienen acceso a nuestra base de datos en el contexto de un sistema de citas para una clínica médica.

Primeramente, experimentamos con la creación de usuarios a nivel servidor ejecutando el siguiente query

![imagen](https://github.com/user-attachments/assets/d50e9382-cee4-418c-af0b-d1b6643e978e)


Luego, usamos esos logins para crearlos a nivel base de datos

![imagen](https://github.com/user-attachments/assets/767a973d-65d8-4da1-8b23-2c892cd27509)


Podemos verificar que han sido creado exitosamente con el siguiente query:
![imagen](https://github.com/user-attachments/assets/1ddc1f4b-e76e-47da-a987-34e08e34ce2d)


![imagen](https://github.com/user-attachments/assets/61368ced-1c9a-441e-a6ac-2c4a06503d9a)



Ahora bien, debemos asignar roles a estos usuarios para que puedan desempeñar sus funciones con lo cual lo primero que debemos hacer es crear roles y asignar permisos a los mismos. Por permisos, nos referimos a las sentencias SELECT, INSERT, UPDATE, etc. Cabe destacar que existen formas de asignar todos los permisos de forma automática con sentencias como CONTROL.

![imagen](https://github.com/user-attachments/assets/135d0f05-0acd-4332-80d5-16bf6365b680)


Y ahora, verificamos su existencia:

![imagen](https://github.com/user-attachments/assets/ec901552-04f8-4d42-8cee-b2106d76c61c)


![imagen](https://github.com/user-attachments/assets/4b4fc820-0934-4e9a-af57-e9b547129c30)


![imagen](https://github.com/user-attachments/assets/bc812d10-a13c-470d-b1fe-90ff2f3e8db9)


![imagen](https://github.com/user-attachments/assets/16ba2ac0-e7fd-494c-9817-3bbda8eec793)


Lo siguiente es conceder el uso del procedimiento al usuario admin

![imagen](https://github.com/user-attachments/assets/f0669170-f373-4775-b25a-25e5ae75ceca)


Para ejemplificar el uso de procedimientos, utilizaremos uno ya almacenado, que será el de cargar un paciente a la base de datos.

Antes, queremos verificar que nuestros usuarios tengan acceso a la base de datos del sistema de citas:

 ![imagen](https://github.com/user-attachments/assets/195cb7cf-f6d5-4397-8c1c-9c13dbd42efe)

![imagen](https://github.com/user-attachments/assets/d7f4ddcd-b8cb-4b0a-a986-f97ecde4803d)


Ahora que ya quedó claro eso, procedemos a hacer un insert en la tabla Persona de la cual heredará nuestro Paciente

![imagen](https://github.com/user-attachments/assets/6e429ef3-cb61-4902-8282-c8765768653e)


Ahora hacemos uso del procedimiento:

 ![imagen](https://github.com/user-attachments/assets/dfa04978-99e4-4171-9727-6831f3aeacfb)


Verificamos la salida, observando que el paciente se agregó con exito a la tabla paciente

![imagen](https://github.com/user-attachments/assets/e8bb793a-eb92-4369-af26-9485ffd74468)


Concluido este breve experimento,

a nivel técnico, me demostró  la importancia de respetar las restricciones de claves foráneas al manipular datos en una base de datos relacional, y la necesidad de seguir un flujo lógico de inserciones para evitar conflictos y mantener la consistencia de los datos.


Como estudiante, puedo destacar la importancia de saber y, mas importante, entender el uso de estas funciones. No solo nos garantizan una gestión organizada de la información que deseamos manipular, sino que detrás de ello, existe la intención de brindar un servicio de calidad que protege nuestro sistema de la alteración incorrecta y la perdida de integridad de nuestros datos. Comprender temas de este indole nos encamina para poder desempeñarnos de forma profesional en nuestro futuro trabajo, entendiendo que no solamente estamos cumpliendo con nuestra tarea, sino que también estamos cuidando de lo que el cliente nos confía.
