# Directiva de Retención en Office 365

### 1. El Concepto Fundamental: Retención vs. Copia de Seguridad

Es crucial entender que **Office 365 no incluye una copia de seguridad (backup) del correo**. La estrategia de Microsoft se basa en la **retención** y la **disponibilidad** del correo.

Microsoft garantiza que el servicio de correo estará disponible con una caída máxima de 4 horas y una pérdida máxima de elementos de correo de 2 horas. Esto se logra manteniendo cuatro copias de cada base de datos de buzones, tres replicadas y una cuarta en otro país con un desfase de 2 horas.

### 2. Retención por Defecto y Pérdida de Datos

Aunque no hay un backup tradicional, Office 365 retiene los cambios que sufren los buzones de correo por un tiempo.

- **Proceso de Eliminación:** Cuando un usuario borra un correo y lo elimina permanentemente (de la carpeta de elementos eliminados), Office 365 lo mantiene internamente guardado por un periodo.
- **Período por Defecto:** Por defecto, el tiempo de retención de estos elementos eliminados permanentemente es de **15 días**, aunque puede ampliarse a **30 días**.
- **Pérdida Permanente:** Una vez superados los 30 días, si no se ha aplicado ningún mecanismo de retención adicional, la información se pierde de forma permanente, lo que implica que no hay forma de recuperar ese correo, incluso si fuera necesario por temas legales.

### 3. Mecanismos Avanzados de Retención y Cumplimiento

Para cumplir con requisitos legales o regulatorios (compliance), existen mecanismos que aseguran que el contenido se mantenga indefinidamente o por un tiempo prolongado.

#### A. Suspensión por Litigio (Litigation Hold)

Esta funcionalidad, a la que se accede a través del centro de administración de Exchange, permite activar un buzón para que **todos los cambios siempre se registren y nunca se elimine nada**.

- **Efecto:** El usuario puede percibir que ha borrado el contenido, pero internamente el sistema mantiene guardadas todas las versiones del buzón, permitiendo a los administradores o equipos legales volver a una versión específica en el tiempo.
- **Licenciamiento y Costo:** La suspensión por litigio requiere una **licencia avanzada**. Al activarse, aunque el contenido eliminado esté oculto para el usuario, este consume espacio en la base de datos subyacente (no en la cuota visible del buzón), lo que implica un costo a nivel de licenciamiento.

#### B. Buzón de Archivado (Archive Mailbox)

El buzón de archivado es una solución para gestionar grandes volúmenes de correo y evitar que el buzón principal consuma excesivo espacio.

- **Capacidad:** El buzón de archivado tiene por defecto **100 GB** de capacidad, la cual puede ampliarse incluso a **Terabytes**, dependiendo de la licencia.
- **Uso:** Los usuarios pueden utilizarlo directamente, y se pueden establecer reglas automáticas para mover al buzón de archivado el contenido más antiguo (por ejemplo, con las directivas MRM).
- **Ventaja Técnica:** El contenido del buzón de archivado no se descarga en el archivo de caché local (OST) del usuario, lo que aligera la carga de los equipos y permite mantener información histórica sin afectar el rendimiento diario.

#### C. Directivas de Retención de Registros de Mensajes (MRM)

Estas son configuraciones más antiguas, heredadas de Exchange, que permiten la **autogestión del contenido** dentro del buzón.

- **Funcionalidad:** Permiten configurar reglas (políticas de archivo o retención) para que el contenido de las carpetas de correo se autogestione, por ejemplo, eliminando automáticamente lo que llega a la bandeja de entrada después de un mes, o purgando elementos eliminados cada 3 meses.
- **Aplicación:** Los usuarios pueden aplicar estas políticas de retención manualmente desde Outlook o OWA (Outlook Web Access).

#### D. Etiquetas de Retención y Confidencialidad (Microsoft Purview)

En el modelo moderno de Microsoft, las directivas de cumplimiento y seguridad se gestionan a través del centro de **Microsoft Purview** (anteriormente Compliance). Aquí se definen las etiquetas de retención y confidencialidad (Retention Labels y Sensitivity Labels).

- **Alcance Amplio:** Las etiquetas de retención ya no se limitan solo al correo, sino que tienen un alcance mucho más global, aplicándose a: **sitios de SharePoint, OneDrive y chats de Teams**.
- **Propósito Legal:** Permiten definir que el contenido marcado con dicha etiqueta no se pueda borrar de forma permanente hasta que haya transcurrido un tiempo específico (por ejemplo, 5 años) porque así lo exija la ley.
- **Requisito de Licencia:** Es importante notar que aunque las opciones para crear estas etiquetas pueden ser visibles, para que sean funcionales y aplicables en el entorno, se requiere una **licencia superior** como E3 o su equivalente.

#### E. Retención de Registros de Auditoría (Audit Logs)

Dentro del centro de cumplimiento (Compliance), las políticas de auditoría (Audit Policy) permiten especificar el tiempo que se desea conservar los registros de actividad (logs de auditoría). Por ejemplo, es posible configurar que estos registros se mantengan hasta por 10 años.
