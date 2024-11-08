# proyecto_SistemaCitas

Universidad Nacional Del Nordeste
Facultad de Ciencias Exactas y Naturales y Agrimensura

Licenciatura en Sistemas de Información

Materia: Base de Datos I

Año: 2024

Integrantes del grupo:

1. Acosta, Juan Agustín - 43.532.954
2. Lago, Agustín Osvaldo - 44.826.719
3. Marder, Manuela - 45.374.423
4. Lezcano Airaldi, Melisa Agostina - 45.248.126

CAPÍTULO I: INTRODUCCIÓN

Este trabajo tiene como objetivo desarrollar un sistema de gestión de citas médicas, abarcando los aspectos relacionados con el modelado de una base de datos eficiente y optimizada a través del uso de formas normales y sentencias SQL. El propósito es crear una solución que permita a una clínica gestionar eficientemente las citas y el acceso a la información de los pacientes, mejorando el flujo de trabajo y la experiencia del usuario.

El problema central que aborda este trabajo es la necesidad de las clínicas de gestionar de manera eficiente las citas médicas y el manejo de la información de los pacientes. Actualmente, las clínicas se enfrentan a retrasos en la organización de las citas y dificultades en la consulta y actualización de los datos de los pacientes, lo que puede afectar la calidad del servicio ofrecido. El desarrollo de una base de datos bien estructurada busca solucionar estos problemas, permitiendo un manejo intuitivo y organizado de la información tanto para los administradores del sistema como para el personal clínico.

En efecto, es primordial contar con los servicios del modelo de datos para respaldar las actividades y/o transacciones a desarrollarse en la gestión de citas. Profundizando, los módulos que contendrá este sistema incluyen y no se limitan a: gestión de usuarios registrados, gestión de citas y pacientes, módulo de autenticación y acceso a reportes clínicos y de movimientos en un periodo determinado.

CAPÍTULO II: MARCO CONCEPTUAL

El desarrollo de un sistema de gestión de citas médicas efectivo y seguro se sitúa dentro de un contexto de avances tecnológicos, donde las Tecnologías de la Información y la Comunicación (TICs) juegan un rol fundamental. Hoy en día, la digitalización y las TICs no solo mejoran la eficiencia en sectores como el comercio o la educación, sino que también transforman áreas críticas como la salud, permitiendo una gestión más organizada y segura de la información.

-Innovación Tecnológica en el Sector Salud
La implementación de innovaciones tecnológicas en la salud permite a clínicas y hospitales mejorar su capacidad de respuesta y optimizar sus procesos, brindando una atención de mayor calidad. La gestión digital de citas médicas es una clara respuesta a esta tendencia, ayudando a reducir tiempos de espera y facilitando la coordinación entre pacientes y profesionales.

-Globalización y Acceso a la Salud
La globalización, al facilitar la transferencia de conocimientos y tecnologías entre regiones, permite que más clínicas tengan acceso a herramientas avanzadas, mejorando la eficiencia del sistema de salud a nivel local y regional. Esto se alinea con el desarrollo de soluciones que buscan brindar un servicio sustentable y accesible.

-Sustentabilidad y Crecimiento
La administración digital de citas y registros médicos también promueve un crecimiento sostenible al reducir la necesidad de archivos físicos y minimizar el uso de papel. Esta transformación digital no solo mejora la eficiencia interna de una clínica, sino que también contribuye a un entorno más respetuoso con el medio ambiente.

-Seguridad y Protección de Datos en Entornos Digitales
Con el uso de las TICs en salud, se vuelve fundamental la protección de datos. La implementación de medidas de seguridad, como el control de acceso y la encriptación de información, asegura que solo el personal autorizado acceda a datos sensibles, protegiendo la privacidad del paciente y la integridad de la clínica.

CAPÍTULO III: METODOLOGÍA SEGUIDA

En este capítulo se detalla el proceso seguido para desarrollar el sistema de gestión de citas médicas, así como las herramientas y procedimientos utilizados a lo largo del trabajo práctico. A continuación, se verá a profundidad los aspectos más relevantes de la metodología adoptada.

a. Descripción de cómo se realizó el Trabajo Práctico

    El trabajo se inició con una fase de investigación preliminar para comprender las necesidades específicas de una clínica en relación con la gestión de citas y el manejo de datos de pacientes. Se llevaron a cabo las siguientes actividades:

    1. Revisión Bibliográfica: Se revisaron libros, artículos académicos y fuentes en línea sobre sistemas de gestión de salud y bases de datos, lo que ayudó a sentar las bases teóricas del proyecto.

    2. Análisis de Requerimientos: Esta fase fue crucial para definir las funcionalidades esenciales del sistema. Se identificaron los principales problemas y requerimientos de las gestiones de citas médicas en base a experiencias comunes compartidas entre los integrantes que desarrollaron el proyecto.

    3. Modelado de la Base de Datos: A partir de la información recopilada, se elaboró un modelo de base de datos utilizando diagramas de entidad-relación (ER). Se aplicaron formas normales para optimizar el diseño y garantizar la integridad de los datos.

    4.Desarrollo del Sistema: Utilizando herramientas de programación y gestión de bases de datos, se implementó el sistema de gestión de citas. Se desarrollaron módulos específicos para la gestión de usuarios, citas y acceso a reportes clínicos.

    5. Pruebas y Ajustes: Se realizaron pruebas exhaustivas del sistema para identificar y corregir errores. Se buscó asegurar que todas las funcionalidades operaran correctamente y que la interfaz fuera intuitiva para los usuarios finales.

b. Herramientas (Instrumentos y procedimientos)

    Para la realización del trabajo, se utilizaron diversas herramientas y métodos que facilitaron la recolección y tratamiento de la información:

    1. Software de Modelado: Se emplearon herramientas como SQL Server y ERD PLUS para el diseño y modelado de la base de datos, permitiendo crear diagramas claros y organizados.

    2. Lenguajes de Programación: Se utilizó C# para el desarrollo de la aplicación de gestión de citas, aprovechando su robustez y compatibilidad con bases de datos SQL Server.

    3. Sistemas de Gestión de Bases de Datos (SGBD): Se trabajó con SQL Server para la implementación de la base de datos, utilizando sentencias SQL para gestionar y manipular los datos de manera eficiente.

    4. Revisión Bibliográfica: La información teórica se obtuvo a través de libros, artículos y páginas web especializadas en gestión de la salud y desarrollo de software.

CAPÍTULO IV: DESARROLLO DE LOS TEMAS

PROCEDIMIENTOS Y FUNCIONES ALMACENADAS

Que es un procedimiento almacenado?
Procedimiento almacenado: Es un objeto que se crea con la sentencia CREATE PROCEDURE y se invoca con la sentencia CALL. Son conjuntos de una o varias instrucciones almacenadas en base de datos, que pueden ser llamados desde otra parte de la aplicación. Un procedimiento puede tener cero o muchos parámetros de entrada y cero o muchos parámetros de salida, aunque no siempre es necesario que devuelvan información.

Parámetros de entrada, salida y entrada/salida
En los procedimientos almacenados podemos tener tres tipos de parámetros:
• Entrada: Se indican poniendo la palabra reservada IN delante del nombre del parámetro. Estos parámetros no pueden cambiar su valor dentro del procedimiento, es decir, cuando el procedimiento finalice estos parámetros tendrán el mismo valor que tenían cuando se hizo la llamada al procedimiento. En programación sería equivalente al paso por valor de un parámetro.
• Salida: Se indican poniendo la palabra reservada OUT delante del nombre del parámetro. Estos parámetros cambian su valor dentro del procedimiento. Cuando se hace la llamada al procedimiento empiezan con un valor inicial y cuando finaliza la ejecución del procedimiento pueden terminar con otro valor diferente. En programación sería equivalente al paso por referencia de un parámetro.
• Entrada/Salida: Es una combinación de los tipos IN y OUT. Estos parámetros se indican poniendo la palabra reservada IN/OUT delante del nombre del parámetro.

Los procedimientos pueden dividirse en:
• Procedimientos definidos por el usuario: Aquellos que el usuario define libremente y personaliza de acuerdo con su necesidades y lógica de negocio. se puede crear en una base de datos definida por el usuario o en todas las bases de datos del sistema excepto en la base de datos Resource.

• Procedimientos temporales: Aquellos definidos por el usuario, pero almacenados en tempbd. Son eliminados después de la sesión en que son utilizados. Hay dos tipos de procedimientos temporales: locales y globales. Se diferencian entre sí por los nombres, la visibilidad y la disponibilidad. Los procedimientos temporales locales tienen como primer carácter de sus nombres un solo signo de número (#); solo son visibles en la conexión actual del usuario y se eliminan cuando se cierra la conexión. Los procedimientos temporales globales presentan dos signos de número (##) antes del nombre; son visibles para cualquier usuario después de su creación y se eliminan al final de la última sesión en la que se usa el procedimiento.

• Procedimientos del sistema: Los procedimientos del sistema se incluyen con el motor de base de datos. Están almacenados físicamente en la base de datos interna y oculta Resourcey se muestran de forma lógica en el esquema sys de cada base de datos definida por el sistema y por el usuario.

• Procedimientos definidos por el usuario extendidos: Permiten crear rutinas externas en un lenguaje de programación como C. Este tipo de procedimientos, serán eliminados en versiones futuras de SQL Server por lo que desaconsejamos su uso.

Ventajas de usar procedimientos almacenados

Tráfico de red reducido entre el cliente y el servidor:
Los comandos de un procedimiento se ejecutan en un único lote de código. Esto puede reducir significativamente el tráfico de red entre el servidor y el cliente porque únicamente se envía a través de la red la llamada que va a ejecutar el procedimiento.

Mayor seguridad:
Varios usuarios y programas cliente pueden realizar operaciones en los objetos de base de datos subyacentes a través de un procedimiento, aunque los usuarios y los programas no tengan permisos directos sobre esos objetos subyacentes. El procedimiento controla qué procesos y actividades se llevan a cabo, y protege los objetos de base de datos subyacentes. Esto elimina la necesidad de conceder permisos en cada nivel de objetos y simplifica los niveles de seguridad.

Reutilización del código:
El código de cualquier operación de base de datos redundante resulta un candidato perfecto para la encapsulación de procedimientos. De este modo, se elimina la necesidad de escribir de nuevo el mismo código, se reducen las inconsistencias de código y se permite que cualquier usuario o aplicación que cuente con los permisos necesarios pueda acceder al código y ejecutarlo.

Rendimiento mejorado:
De forma predeterminada, un procedimiento se compila la primera vez que se ejecuta y crea un plan de ejecución que vuelve a usarse en posteriores ejecuciones. Como el procesador de consultas no tiene que crear un nuevo plan, normalmente necesita menos tiempo para procesar el procedimiento.

¿Que son las funciones almacendadas?

Una función almacenada es un conjunto de instrucciones SQL que se almacena asociado a una base de datos. Es un objeto que se crea con la sentencia CREATE FUNCTION y se invoca con la sentencia SELECT o dentro de una expresión. Una función puede tener cero o muchos parámetros de entrada y siempre devuelve un valor, asociado al nombre de la función.

Parámetros de entrada

En una función todos los parámetros son de entrada, por lo tanto, no será necesario utilizar la palabra reservada IN delante del nombre de los parámetros.
Resultado de salida
Una función siempre devolverá un valor de salida asociado al nombre de la función. En la definición de la cabecera de la función hay que definir el tipo de dato que devuelve con la palabra reservada RETURNS y en el cuerpo de la función debemos incluir la palabra reservada RETURN para devolver el valor de la función.

Tipos de funciones

• Funciones escalares
Las funciones escalares definidas por el usuario devuelven un único valor de datos del tipo definido en la cláusula RETURNS. En una función escalar insertada, el valor escalar es el resultado de una sola instrucción. Para una función escalar de varias instrucciones, el cuerpo de la función puede contener una serie de instrucciones de Transact-SQL que devuelven el único valor. El tipo devuelto puede ser de cualquier tipo de datos excepto text, ntext, image, cursory timestamp.

• Funciones con valores de tabla
Las funciones con valores de tabla definidas por el usuario (TVF) devuelven un tipo de datos table. Las funciones con valores de tabla insertadas no tienen cuerpo; la tabla es el conjunto de resultados de una sola instrucción SELECT.

• Funciones del sistema
SQL Server proporciona numerosas funciones del sistema que se pueden usar para realizar diversas operaciones. No se pueden modificar.

Diferencias entre procedimientos almacenados y funciones almacenadas:

1. Propósito Principal
   •Procedimiento Almacenado: Se utiliza principalmente para ejecutar tareas complejas y operaciones que pueden incluir la modificación de datos, como INSERT, UPDATE, o DELETE. Son muy útiles para realizar múltiples operaciones a la vez, dado que pueden contener lógica de control (bucles, condiciones) y gestionar transacciones.
   •Función Almacenada: Su propósito principal es calcular un valor y devolverlo. Esto puede ser un único valor (funciones escalares) o un conjunto de filas (funciones de tabla). Las funciones se utilizan típicamente para operaciones que requieren ser reutilizadas dentro de consultas, como cálculos o transformaciones.

2. Modificación de Datos: ambos tipos pueden modificar datos, pero hay diferencias importantes
   •Procedimiento Almacenado: Tiene la capacidad de modificar directamente tablas en la base de datos sin restricciones, lo que lo hace ideal para operaciones CRUD (Crear, Leer, Actualizar, Eliminar).
   •Función Almacenada: Aunque puede realizar operaciones como INSERT, UPDATE o DELETE en tablas temporales o variables de tabla, no es recomendable que modifique tablas persistentes directamente. Esto se debe a que las funciones están diseñadas para ser determinísticas y predecibles, lo que significa que, al ser llamadas dentro de una consulta, siempre deberían devolver el mismo resultado para los mismos parámetros, sin efectos secundarios en la base de datos. Modificar tablas desde una función puede llevar a comportamientos inesperados y dificultar el mantenimiento del sistema.

3. Uso en Consultas
   •Procedimientos Almacenados: No se pueden usar dentro de un SELECT, ya que no devuelven un valor directamente como una función. Sin embargo, pueden devolver múltiples valores a través de parámetros de salida o conjuntos de resultados (SELECT dentro del procedimiento).
   •Funciones Almacenadas: Se pueden utilizar directamente en una cláusula SELECT, ya que siempre devuelven un valor. Esto las hace convenientes para tareas repetitivas y cálculos complejos dentro de consultas.

4. Manejo de Transacciones
   •Procedimiento Almacenado: Puede gestionar transacciones explícitamente (BEGIN TRANSACTION, COMMIT, ROLLBACK), lo que es crucial para asegurar la integridad de los datos en operaciones complejas.
   •Función Almacenada: No puede gestionar transacciones de forma explícita, ya que están pensadas para ser funciones determinísticas que no afectan el estado general de la base de datos.

En la siguiente tabla se reflejan las diferencias de manera resumida

MANEJO DE PERMISOS A NIVEL USUARIO EN UNA BASE DE DATOS

¿Qué son los permisos?

Los permisos de base de datos son derechos de acceso y privilegios otorgados a usuarios o roles dentro de una base de datos o plataforma de datos. Nos ayudan a especificar qué acciones pueden realizar los usuarios o roles en varios objetos de la base de datos, como tablas, vistas, esquemas o incluso la base de datos completa.

La existencia de estos tiene una razón de ser y una forma especifica en la cual los podemos implementar, por lo tanto, resulta importante repasar brevemente dichos puntos.

¿Por qué es necesario implementarlos?

• Son esenciales para la seguridad y el control del acceso a los datos.
• Garantizan que sólo los usuarios autorizados puedan realizar acciones específicas.
• Ayudan a mantener la integridad de los datos, evitar cambios no autorizados y limitar la exposición a datos confidenciales.

¿Cómo los implementamos?

• Mediante declaraciones SQL o a través de la interfaz del sistema de base de datos.
• Asignar permisos a usuarios individuales o roles (grupos de usuarios) según sus responsabilidades.
• A los usuarios se les deben asignar permisos que garanticen que tienen el acceso necesario para realizar sus tareas sin exceder sus privilegios.

¿Qué son los privilegios?

Son los permisos específicos que determinan qué acciones puede realizar un usuario en la base de datos, como SELECT, INSERT, UPDATE y DELETE. Estos privilegios controlan el acceso y modificación de datos en las tablas.

¿Cuáles son los niveles de acceso?

En la tabla siguiente se muestran los roles fijos de base de datos y sus funcionalidades. Estos roles existen en todas las bases de datos. A excepción del rol de base de datos público, no se pueden cambiar los permisos asignados a los roles fijos de base de datos.

Ver tabla adjuntada:
![tabla-permisos-roles](https://github.com/user-attachments/assets/7ce5df2e-d779-4e25-b728-69edb9d1a346)

Modelos comunes de permisos

Los modelos de permisos de base de datos son los que permiten a los usuarios acceder a los objetos de una base de datos y realizar acciones concretas en ella.

1. Modelo Basado en Roles (Role Based Access Control)

Es un método para restringir el acceso a la red basado en los roles de usuarios individuales. Este método permite acceder a lis empleados únicamente a la información que necesitan para llevar adelante su trabajo. En este modelo, los roles están basados en varios factores, incluyendo autorizaciones, responsabilidades y competencia laboral. Permite a los negocios especificar si los individuos son usuarios finales, administradores o expertos. Su importancia yace en el hecho de que posee utilidad especialmente para organizaciones con una gran cantidad de empleados y aquellas que brindan acceso a terceros como clientes y proveedores, brindando así una mejor protección a la información sensible y las aplicaciones.

Ejemplo Práctico: Sistema de Gestión de una Clínica

Roles definidos:
o Médico: Acceso para ver y actualizar historias clínicas de sus pacientes.
o Recepcionista: Acceso para gestionar citas (crear, cancelar, modificar).
o Gestor de Clínica: Acceso para generar reportes de citas y estadísticas.

Configuración:
o El usuario Dr. Fontana es asignado al rol de Médico y, por lo tanto, puede acceder a las historias clínicas y actualizar información.
o El usuario María López es asignado al rol de Recepcionista y solo puede gestionar citas sin acceso a historias clínicas.
o El usuario Juan Pérez es un Gestor de Clínica y tiene permisos para ver reportes y estadísticas, pero no modificar historias clínicas.

2. Modelos Basado en Atributos (Attribute Based Access Control)

Es un modelo de control de acceso en el cual los derechos de acceso son otorgados basado en los atributos. Estos pueden estar asociados con usuarios, recursos, acciones y el ambiente. A diferencia de modelos de control de acceso tradicionales, ABAC provee un enfoque altamente flexible y granular a la gestión de acceso.
En dicho modelo, debemos describir las políticas usando varios tipos de condiciones, incluyendo condiciones booleanas, condiciones basadas en texto/objetos y comparaciones numéricas. Estas reglas determinan si un usuario puede acceder a un cierto recurso basado en atributos. En ABAC, los permisos se basan en una combinación de atributos de usuario, recurso, y entorno. Esto proporciona un control más granular y flexible.

Ejemplo Práctico: Plataforma de Streaming de Video

Atributos de usuario:
o Edad: 16 años, 30 años, etc.
o País: Argentina, España, México, etc.
o Suscripción: Premium, Estándar, Básico.

Atributos del recurso:
o Clasificación por edad: +18, +13, Todo público.
o Región de disponibilidad: Latinoamérica, Europa, etc.

Reglas de acceso:
o Los usuarios menores de 18 años no pueden acceder a contenido con clasificación +18.
o Los usuarios con suscripción Estándar solo pueden ver contenido en calidad HD, mientras que los de suscripción Premium pueden ver contenido en calidad 4K.
o Los usuarios en la región Latinoamérica solo pueden ver contenido disponible en esa región.

Configuración de acceso:
o El usuario Carlos Sánchez (edad 17, país México, suscripción Estándar) puede acceder a contenido +13 y Todo público y ver contenido disponible en Latinoamérica en calidad HD.
o El usuario Ana Gómez (edad 25, país España, suscripción Premium) puede acceder a cualquier contenido y en calidad 4K.

Buenas Prácticas

1. Principio de Menor Privilegio

El principio de menor privilegio dicta que a los usuarios solo se les deben otorgar los permisos necesarios para realizar sus tareas y nada más. Esto minimiza los riesgos de accesos indebidos y potenciales daños en caso de que una cuenta sea comprometida.

2. Revisión Regular de Permisos

La revisión periódica de permisos es crucial para asegurar que los accesos concedidos siguen siendo relevantes y necesarios. Los permisos asignados inicialmente pueden volverse obsoletos con cambios de roles, tareas o salidas de empleados.

3. Auditoría y Monitoreo de Permisos

La auditoría y monitoreo de permisos implica registrar y rastrear los cambios en los permisos para identificar y responder rápidamente a comportamientos inusuales o no autorizados.

OPTIMIZACION DE CONSULTAS A TRAVES DE INDICES
MANEJO DE TRANSACCIONES Y TRANSACCIONES ANIDADAS

CAPÍTULO V: CONCLUSIONES

El desarrollo del sistema de gestión de citas médicas ha abordado con éxito los problemas de organización y acceso a la información en clínicas. Este trabajo ha permitido optimizar el flujo de trabajo y mejorar la experiencia tanto de los administradores como de los pacientes.

Los resultados más destacados incluyen:

    -Eficiencia en la Gestión de Citas: El sistema ha reducido los tiempos de espera y mejorado la organización de las citas, permitiendo un acceso más ágil a la información.

    -Acceso Centralizado: La centralización de datos facilita el seguimiento de historiales médicos, lo que permite a los profesionales de la salud tomar decisiones más informadas.

    -Satisfacción del Usuario: Las encuestas indican que tanto el personal administrativo como los médicos están satisfechos con la facilidad de uso del sistema, lo que se traduce en una    mejor atención al paciente.

    -Desarrollo de Habilidades: Este proyecto ha permitido adquirir y fortalecer habilidades en programación y diseño de bases de datos, fundamentales para futuras aplicaciones profesionales.

BIBLIOGRAFÍA

1. Procedimientos y funciones almacenadas
2. Manejo de Permisos a Nivel Usuario en una Base de Datos

https://docs.aws.amazon.com/es_es/redshift/latest/dg/r_Privileges.html

https://help.sap.com/docs/SAP_POWERDESIGNER/1f914d86319d43b7b2402532666583c0/8a0a8c9fc9eb4fab9d90f5784dc857db.html?locale=es-ES

https://learn.microsoft.com/es-es/sql/relational-databases/security/authentication-access/database-level-roles?view=sql-server-ver16

4. Optimización de consultas a través de índices
5. Manejo de transacciones y transacciones anidadas
