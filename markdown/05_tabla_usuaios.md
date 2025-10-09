| Característica | Usuario Activo (con Licencia) | Usuario Invitado (Guest) | Contacto (Contact) |
| :--- | :--- | :--- | :--- |
| **Definición** | Usuario con una licencia asignada que incluye Exchange Online (como mínimo Exchange P1). | Usuario cuyo correo se gestiona externamente (ej. Hotmail.com), pero que accede a tu entorno. | Objeto de identidad que es un destinatario básico (recipient) de Exchange. |
| **Capacidad de Inicio de Sesión** | **Puede** iniciar sesión en Office 365. | **Puede** iniciar sesión en el *tenant* (entorno) de la organización. | **No puede** iniciar sesión en el directorio activo ni en Office 365. |
| **Buzón de Correo** | Tiene un buzón de correo gestionado **dentro** de Exchange Online. | Su correo es gestionado **externamente** (ej. Gmail, Hotmail). | Su correo se gestiona **fuera** de la organización. |
| **Acceso a Recursos** | Accede a funcionalidades según la licencia (SharePoint, Teams, etc.). | Solo accede a los recursos que se le hayan **compartido**. | **No tiene** acceso a archivos ni nada. |
| **Propósito Principal** | Utilizar los servicios completos de Office 365. | Colaboración externa sobre recursos compartidos (como documentos o Teams). | Aparecer en la **Lista Global de Direcciones (GAL)** de Exchange para recibir correos. |
| **Permisos Típicos en Teams** | Lector y escritor (según el rol en el equipo). | Generalmente, es de **lectura y escritura**, pudiendo hacer la mayoría de las cosas de un usuario normal en el equipo. | N/A (No puede iniciar sesión ni acceder a Teams). |
| **Creación** | Creado y gestionado dentro del entorno de nube/AD. | Objeto creado automáticamente cuando se comparte algo con un usuario externo. | Creado manualmente o importado a nivel global (por ejemplo, con Power Shell). |
