Aplicacion de lo investigado - Optimización de Consultas con Índices

Para demostrar las ventajas de la optimización con indices no agrupados empezaremos por insertar un lote de datos masivos de 500 mil de citas médicas en la tabla Cita, utilizando un script que genera datos aleatorios dentro de un rango. Por ejemplo, para las fechas lo manejamos con un rango de 10 años desde 2015.  

DECLARE @i INT = 1;

WHILE @i <= 500000
BEGIN
    INSERT INTO Cita (Fecha, Motivo, NroMatricula, NroPaciente, NroDocumento)
    VALUES (
        DATEADD(DAY, RAND() * 3650, '2015-01-01'),  
        'Motivo de la cita ' + CAST(@i AS VARCHAR),  
        (SELECT TOP 1 NroMatricula FROM Medico ORDER BY NEWID()),
        (SELECT TOP 1 NroPaciente FROM Paciente ORDER BY NEWID()),
        (SELECT TOP 1 NroDocumento 
         FROM Paciente 
         WHERE NroPaciente = (SELECT TOP 1 NroPaciente FROM Paciente ORDER BY NEWID()))
    );
    SET @i = @i + 1;
END;

Luego, realizamos una consulta de búsqueda sin índice de todas las citas del año 2022. Si nuestra tabla no tuviese ningún tipo de índice, el motor tendría que realizar un escaneo completo de la tabla para buscar las filas que cumplan con la condición, en este caso ya contamos con una FK en Id_Cita que actúa como índice agrupado y optimiza la consulta, pero de todas sigue siendo una operación costosa al no estar indexada directamente la columna Fecha.

SELECT * FROM Cita
WHERE Fecha BETWEEN '2022-01-01' AND '2022-12-31';

![1](https://github.com/user-attachments/assets/c9ee587e-9ebb-4ee0-bc33-7874d24481eb)

Analizando el Plan de Ejecución de la consulta podemos observar dos cosas:

Que se está usando un Clustered Index Scan sobre el índice agrupado en IdCita. Esto implica que SQL Server está recorriendo todo el índice agrupado para buscar las filas que coinciden con el rango de fechas.
Y por otro lado los costos, observamos un Estimated I/O Cost de 2.76609, representa la carga estimada en términos de operaciones de entrada y salida (I/O) en disco y es relativamente alto. Un Estimated Operator Cost de 3.31624 (100%), costo total estimado de la operación en relación con otras operaciones en la consulta. Un Estimated CPU Cost de 0.550157, que estima la carga en la CPU requerida para procesar la consulta. 

![rrr](https://github.com/user-attachments/assets/e8a2b99e-89a8-47fd-80de-5e220c5b72c5)

Tambien podemos observar que la operacion llevo un Wait Time on Server Replies: 48 ms, tiempo de espera del motor para recibir la respuesta del servidor. Client Processing Time: 123 ms, tiempo que el motor tomó para procesar la información recibida del servidor. Total Execution Time: 171 ms, incluye la ejecución en el servidor, la transferencia de datos, y el procesamiento en el cliente, Es el tiempo que le lleva al usuario recibir la informacion. 

Ahora, para optimizar el rendimiento de las consultas, creamos un índice no agrupado sobre la columna Fecha.

CREATE NONCLUSTERED INDEX idx_fecha ON Cita (Fecha);

Este índice creará una estructura de datos separada que contendrá los valores de la columna Fecha y punteros a las filas correspondientes en la tabla Cita. Esto nos permitirá realizar búsquedas más eficientes en la columna Fecha, sin importar que ya tengamos un indice agrupado en otra columna.

SELECT * FROM Cita WITH (INDEX(idx_fecha)) 
WHERE Fecha BETWEEN '2022-01-01' AND '2022-12-31';

Al repetir la consulta forzando al motor que utilice nuestro indice no agrupado obtenemos: 

![2](https://github.com/user-attachments/assets/cd3e8c76-af4d-4761-a72e-104db9253b98)

Nuestro plan de ejecucion indica claramente que se está utilizando un Index Seek (NonClustered) sobre el índice no agrupado idx_fecha. Esto significa que SQL Server está realizando una búsqueda específica dentro del índice para encontrar rápidamente las filas que cumplen con el criterio de la cláusula WHERE.
Y por otro lado los costos se vieron disminuidos, observamos un Estimated I/O Cost de 0.0868287, significa que disminuyo un 96% en esta consulta. Un Estimated Operator Cost de 0.142739 (1%), que antes era del 100%. Un Estimated CPU Cost de 0.0559099, que disminuyo casi un 90%. 

![222222222222](https://github.com/user-attachments/assets/9850bc54-206b-4657-a57e-5ca7714b1700)

Mirando los tiempos observamos que en vez de disminuir aumentaron. Esto no es necesariamente algo contradictorio, es necesario analizarlo junto al plan de ejecucion. En este caso el plan de ejecucion mostro muy buenos resultados y los tiempos no, esto puede deberse a varias causas: al ser la primera consulta luego de la creacion del indice puede verse afectado sus tiempos, si el indice se fragmenta, si la consulta es muy compleja. 

Para poder continuar con las pruebas, borramos el indice no agrupado idx_fecha que creamos anteriormente.

DROP INDEX idx_fecha ON Cita;

Con la tabla Cita sin índices no agrupados, creamos nuevamente un índice no agrupado sobre la columna Fecha de la tabla Cita, pero además incluimos la columna NroMatricula, que es el identificador del médico.

CREATE NONCLUSTERED INDEX idx_fecha_doctor ON Cita (Fecha) INCLUDE (NroMatricula);

Este índice se creó con el objetivo de optimizar las consultas que filtran por la fecha y un especialista.

SELECT * FROM Cita WITH (INDEX(idx_fecha_doctor)) 
WHERE Fecha BETWEEN '2022-01-01' AND '2022-12-31' AND NroMatricula = 3;

Al repetir la consulta forzando a utilizar el indice nuevo, obtuvimos los siguientes resultados: 

![3333](https://github.com/user-attachments/assets/1754a3d2-5ece-4fed-bb65-636cb8edd9ef)

Nuestro plan de ejecucion indica que se está utilizando un Index Seek (NonClustered) sobre el índice no agrupado idx_fecha_doctor.
Por otro lado obtuvimos muy buenos resultados en los costos, observamos un Estimated I/O Cost de 0.105347. Un Estimated Operator Cost de 0.119325 (1%). Un Estimated CPU Cost de 0.0139775. Incluir el NroMatricula en el índice ha permitido reducir más los costos, ya que se pueden evitar búsquedas adicionales en la tabla para obtener los datos necesarios.

![3](https://github.com/user-attachments/assets/be46735f-4c82-466d-bc83-04bc44b5f3ed)

Tambien podemos observar que la operacion llevo un Wait Time on Server Replies: 53 ms. Client Processing Time: 40 ms. Total Execution Time: 93 ms. Demuestra que la consulta se vio muy optimizada gracias al indice.

El trabajo demuestra claramente los beneficios de utilizar índices no agrupados para optimizar consultas en bases de datos de gran tamaño. Al trabajar con una tabla de citas médicas con 500,000 registros, la aplicación de índices no agrupados en la columna Fecha y en la combinación Fecha + NroMatricula mostró una reducción significativa en los costos de procesamiento de la consulta. Los índices permitieron reducir el Estimated I/O Cost en un 96% y el Estimated CPU Cost casi un 90% en comparación con la consulta sin índice, lo cual evidencia la eficiencia mejorada en el uso de recursos.

Además, al comparar los tiempos de ejecución, se observa que el índice no agrupado mejora notablemente el tiempo de respuesta, sobre todo cuando se realizan consultas específicas con filtros complejos, como la combinación de Fecha y NroMatricula. Sin embargo, los tiempos no siempre disminuyeron, en la primera consulta con el índice recién creado, lo cual puede explicarse por factores como la fragmentación del índice o la complejidad de la consulta. Estos resultados sugieren que el uso de índices no agrupados es especialmente beneficioso en consultas que involucran grandes volúmenes de datos y múltiples filtros.
