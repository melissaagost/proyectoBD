Los procedimientos almacenados son ideales para operaciones que involucran múltiples pasos, manipulación de datos, y transacciones complejas.Se opta por hacer un procedimiento almacendado para automatizar la insercion de citas medicas en la tabla de Cita, a modo de evitar errores en el ingreso de datos de forma manual, garantizando la integridad de datos al momento del registro. Basicamente, la eleccion se justifica en la complejidad de la operacion ya que involucra multiples pasos.
Este procedimiento recibe los parámetros necesarios para crear una nueva cita: fecha, motivo, número de matrícula del médico, número de paciente y número de documento.
Inicia una transacción para garantizar que la inserción sea atómica, es decir, que ocurra completamente o no ocurra en absoluto.
Valida la existencia de medico y paciente antes de realizar la insercion.
Si las validaciones son exitosas, se inserta una nueva cita en la tabla Cita.
Si ocurre un error durante el proceso, se hace un ROLLBACK de la transacción.Se captura y lanza un mensaje de error si falla.

La eleccion de una funcion almacenada se opta porque estas son más adecuadas para operaciones que devuelven un valor o un conjunto de datos, y que no modifican el estado de la base de datos.En este caso se usa para consultar la cantidad de citas de un medico espeficico.
Acepta el número de matrícula del médico, la fecha de inicio y la fecha de fin para definir el rango. Busca en la tabla Cita todas las citas asociadas al número de matrícula del médico proporcionado y devuelve una tabla con las citas encontradas.
