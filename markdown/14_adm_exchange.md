El contenido relacionado con la administración detallada de Exchange se encuentra principalmente dentro del **Centro de Administración de Exchange (CAE)**. Sin embargo, muchas de las tareas más comunes o básicas pueden realizarse también a través del panel principal de **Usuarios Activos**.
A continuación, se describen las principales áreas de administración de Exchange Online:

### 1. Destinatarios (Recipients)

Los destinatarios son los elementos que Exchange Online utiliza para enviar o recibir correo. La gestión en el CAE es más detallada que en el panel de administración general de Office 365.

| Tipo de Destinatario                       | Descripción y Acciones                                                                                                                                                                                                                                                                                                                                                                                             |
| :----------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Cuentas de Usuario (Buzones)**           | Son usuarios con licencia de Exchange Online, lo que les asigna un buzón. El tamaño predeterminado del buzón es de 50 GB, pero esto debe consultarse en las Descripciones del Servicio.                                                                                                                                                                                                                            |
| **Buzones Compartidos (Shared Mailboxes)** | Funcionan como listas de distribución, pero tienen un buzón separado. **No consumen licencia**. Al crearlos, se otorgan automáticamente permisos de **Acceso Completo** y **Enviar en Nombre de (Send on Behalf of)** a los miembros asignados. Un buzón de usuario (con licencia) puede convertirse en compartido cuando alguien se va de la empresa, manteniendo el historial de correo y liberando la licencia. |
| **Listas de Distribución**                 | El tipo de grupo más sencillo, sin repositorio de información (no es un buzón). El correo enviado se multiplica a todos los miembros de la lista. Se puede configurar si son accesibles desde fuera de la organización (por defecto no lo son) y si requieren aprobación (moderación) para recibir correos.                                                                                                        |
| **Grupos de Office 365**                   | Grupos especiales que crean un buzón compartido y un calendario compartido de Exchange, además de un repositorio de SharePoint.                                                                                                                                                                                                                                                                                    |
| **Contactos**                              | Son entradas que aparecen en la Lista Global de Direcciones (GAL) para personas o entidades externas, permitiendo enviarles correo fácilmente. No pueden iniciar sesión en el entorno. Se pueden agregar de forma manual o masiva mediante PowerShell.                                                                                                                                                             |
| **Buzones de Recursos**                    | Son buzones que **no ocupan licencia** y se utilizan para salas de reuniones (salas) o equipamiento (excavadoras, coches, etc.). Tienen atributos especiales como capacidad (en el caso de salas) o un delegado responsable de autorizar o rechazar reservas.                                                                                                                                                      |

#### 1.1 Gestión de Buzones (Detalle)

Dentro del CAE se pueden configurar varios aspectos de los buzones:

- **Direcciones de Correo Electrónico (Alias):** Se pueden añadir alias SMTP (los más comunes) y otros tipos (como X500, ZIP). La dirección de respuesta (primaria) es la que aparece en negrita y mayúsculas. Los alias permiten recibir correo, pero el envío solo se realiza desde la dirección primaria, aunque se ha anunciado que esta limitación cambiará.
- **Permisos (Tríada):** Se gestionan permisos clave que tardan un tiempo en aplicarse (alrededor de una hora o más):
  - **Acceso Completo (Full Access):** Permite a otro usuario abrir y leer el buzón, incluyendo la eliminación de correos.
  - **Enviar Como (Send As):** Permite al usuario delegado enviar correos como si fuera el buzón principal.
  - **Enviar en Nombre de (Send on Behalf of):** Deja claro que el correo fue enviado por un delegado.
- **Reenvío de Correo (Mail Forwarding):** Permite reenviar automáticamente el correo a una dirección interna o externa. Se considera una acción **peligrosa** y es un método común en ataques de compromiso de correo, por lo que existen alertas para detectarla.
- **Cuotas y Límites:** Se pueden configurar límites de tamaño para el buzón (por defecto 50 GB) y establecer un tamaño máximo de mensajes enviados y recibidos (globalmente o individualmente).

### 2. Flujo de Correo (Mail Flow)

El Flujo de Correo gestiona el camino que sigue el correo al entrar y salir de la organización.

#### 2.1 Reglas de Transporte (Rules)

Las reglas de transporte transforman o actúan sobre el correo mientras está en tránsito, y pueden aplicarse tanto al correo entrante y saliente como al interno.

- **Condiciones:** Se puede aplicar una regla si el remitente es interno o externo, si pertenece a un grupo, o si cumple patrones de texto específicos.
- **Acciones (Efectos):** Las acciones pueden ser redirigir, bloquear, reenviar el mensaje, o adjuntar un texto de renuncia de responsabilidad (disclaimer).
- **Orden de Reglas:** Las reglas se aplican en orden (de arriba abajo), por lo que el orden es crucial. Se puede detener el procesamiento de más reglas con una opción específica.
- **Prueba:** Se pueden probar las reglas en modo de sugerencia de directiva (Policy Tip) para ver qué correos se verían afectados antes de forzar su cumplimiento.

#### 2.2 Seguimiento de Mensajes (Message Trace)

Es la herramienta principal para saber qué pasó con un correo. Permite buscar mensajes por remitente, destinatario, estado de entrega, y más.

- **Limitación de Búsqueda:** Los registros se guardan hasta un máximo de **90 días**. Si se busca más allá, solo está disponible un archivo CSV.
- **Alcance:** Permite ver el camino que sigue el correo dentro de la infraestructura de Office 365, pero no da visibilidad de lo que ocurre una vez que el mensaje se entrega a un sistema de correo de terceros.

#### 2.3 Conectores (Connectors)

Los conectores definen cómo se recibe o se envía el correo en casos particulares, generalmente con servidores internos.

- **Conectores de Recepción (Inbound):** Se usan para aceptar el tráfico de correo de sistemas internos (como servidores de aplicaciones o impresoras multifunción) sin que sean tratados como spam. Esto se suele configurar especificando la IP de origen.
- **Conectores de Envío (Outbound):** Se usan para alterar el flujo de salida, por ejemplo, enviando el correo a través de un dispositivo de seguridad perimetral (appliance/Barracuda) en lugar de la vía pública.

#### 2.4 Dominios Aceptados (Accepted Domains)

Define qué dominios son responsabilidad de este Exchange.

- **Autoritativo:** El dominio es únicamente responsabilidad de este Exchange. Si un destinatario no existe, el correo se rechaza.
- **Retransmisión Interna (Non-Authoritative/Relay):** El Exchange intentará buscar al destinatario internamente; si no lo encuentra, lo enviará al registro MX del dominio (buscando al destinatario en otro sistema de correo externo). Esto se usa durante la coexistencia o migración de entornos.

### 3. Seguridad del Correo (Vía Centro de Seguridad)

Aunque muchas configuraciones de seguridad estaban históricamente en el CAE, las políticas modernas se gestionan en el Centro de Administración de Seguridad y Cumplimiento.

- **Políticas de Antispam y Antimalware:** Permiten configurar filtros para correo no deseado (spam), correo masivo (bulk) y archivos maliciosos. Es posible bloquear adjuntos por extensión (ej. .ISO, .LNK, .CMD), aunque puede ser un riesgo si la organización necesita esos archivos.
- **Cuarentena (Quarantine):** Permite a los administradores revisar correos marcados como spam o phishing. Las **Políticas de Cuarentena** (introducidas recientemente) permiten configurar si los usuarios pueden acceder a su cuarentena y si pueden **liberar** correos o solo **solicitar** la liberación (lo cual es útil para usuarios menos técnicos).
- **Protección de la Identidad del Emisor (SPF, DKIM, DMARC):** Estas tecnologías se configuran en el DNS para evitar la suplantación de identidad. **DMARC** le indica al servidor receptor cómo debe tratar el correo que falle los chequeos de SPF/DKIM (ej. eliminarlo o ponerlo en cuarentena) y puede solicitar un informe de la actividad de correo que se recibe en nombre de nuestro dominio.

### 4. Retención de Correo (Legal Hold / Archivo)

- **Retención por Litigio (Litigation Hold):** Requiere una licencia avanzada (generalmente E3 o superior). Garantiza que el contenido del buzón, incluyendo los correos eliminados por el usuario, se mantenga permanentemente o por un periodo definido.
- **Buzón de Archivado (Archive Mailbox):** Proporciona un buzón adicional de 100 GB para el almacenamiento histórico. El buzón de archivado no utiliza el archivo de caché local (OST), lo cual es una ventaja. Si la persona se va, su buzón de archivado se mantiene, y se puede exportar a un PST o convertir a buzón compartido.
