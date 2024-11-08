Aplicación de lo investigado – Manejo de Permisos a Nivel Usuario

En nuestro sistema, contamos con 3 roles: 1.admin, 2.medico 3.recepcionista. Esto lo haremos mediante la asignación de roles. Ahora bien, este es nuestro escenario actual:

![imagen](https://github.com/user-attachments/assets/6fb259b9-f0ef-4b9f-8538-01d6824251c9)

Supongamos que, en nuestra clínica, necesitamos más de un administrador, con lo cual, quien posea acceso a la base de datos, podrá realizar la siguiente consulta:

![imagen](https://github.com/user-attachments/assets/c36cb2c3-6996-4eff-84d6-76d87ad53f6d)

Verificamos nuestro resultado:

![imagen](https://github.com/user-attachments/assets/ff3001cf-b17a-4a0b-bca9-66345390f689)

Vemos que user de id = 2 ahora tiene un rol de administrador.




2. Pasamos al siguiente escenario, supongamos que nuestro gestor de la base de datos necesita saber quienes tienen permisos sobre la modificación de una cita programada. Esto se logra mediante la verificación de permisos.

![imagen](https://github.com/user-attachments/assets/b7bf653c-2ed4-4b4c-8fab-5aac931b751e)

Estos serán los usuarios que puedan modificar una cita:

![imagen](https://github.com/user-attachments/assets/8381b8fb-6337-49a7-b74a-f422a03cf386)

O bien, si queremos saber que usuarios tienen permiso para acceder a información de pacientes:
Obtenemos el paciente que queremos modificar

![imagen](https://github.com/user-attachments/assets/7f41d200-dab8-4094-b397-9b7130a45d6e)

Solo se podrá ejecutar el siguiente query si se tiene permisos concedidos:

![imagen](https://github.com/user-attachments/assets/43cd0aa1-76bd-4990-b3d8-04b9be4eb401)



3. Supongamos que queremos quitar permisos que hacen posible el acceso a información sensible a alguno de los usuarios, esto lo logramos revocando el permiso de uno de ellos
![imagen](https://github.com/user-attachments/assets/5a9a945e-d7e0-4f04-bd9d-d0b8a1cde580)

Esto no sería posible ya que nuestro sistema no admite campos nulos en Id_Perfil, con lo cual, deberemos crear un nuevo id_perfil, como ser “Visitante” (un perfil sin permisos de modificación) y asignarlo a este usuario en cuestión:
![imagen](https://github.com/user-attachments/assets/9ff980e1-3f0f-47ce-bd3a-b720e502e71a)


Y obtendremos lo siguiente:
![imagen](https://github.com/user-attachments/assets/57194273-bf26-41e9-811c-8dfbf3c8213e)




4. Ahora, si necesitamos manejar permisos a nivel base de datos, es decir, no hacerlo manualmente, una buena opción sería trabajar con GRANT

Vemos que usuarios tenemos en la base:
![imagen](https://github.com/user-attachments/assets/08429b4d-1416-4636-8d9e-26c4fe447912)


Vemos que tenemos un usuario médico
![imagen](https://github.com/user-attachments/assets/c079621d-4790-4627-a6f0-f1509cb0373a)


El médico solo necesita ver información sobre citas y pacientes, por lo que otorgaremos permisos de SELECT en las tablas relevantes

![imagen](https://github.com/user-attachments/assets/e3c8ebba-1696-4ba6-804d-64a92736be97)

Vemos que tenemos 3 recepcionistas:
![imagen](https://github.com/user-attachments/assets/fa1ba25e-8a1a-4843-a819-8f2768b8930f)
![imagen](https://github.com/user-attachments/assets/a95168f9-280e-4327-9527-d6d1752b6f32)

El recepcionista necesita gestionar citas, pero solo tiene permisos de lectura para pacientes.
![imagen](https://github.com/user-attachments/assets/ac86a12a-502a-41cf-b0e3-4194811d08ee)
![imagen](https://github.com/user-attachments/assets/e8498c85-eafa-4a2c-8de3-e31841df1654)
![imagen](https://github.com/user-attachments/assets/7d5405bb-9689-47b7-a4f9-a20d502e646a)

Vemos que tenemos 1 Admin:
![imagen](https://github.com/user-attachments/assets/e9352e49-625b-413d-a49f-a870b44bd14c)

El admin necesita acceso completo a la base de datos para poder gestionar médicos, pacientes y citas.
![imagen](https://github.com/user-attachments/assets/fcfcb3de-c218-4525-a725-70d6290b0d1b)























