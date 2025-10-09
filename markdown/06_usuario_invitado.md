### **¿Qué es un Usuario Invitado?**

Un **usuario invitado** es un tipo de objeto de identidad dentro de Microsoft 365, distinto de los usuarios activos y los contactos. Está diseñado para personas externas a tu organización (como colaboradores, personal externo o de otras empresas) con las que necesitas compartir recursos específicos.

A diferencia de un usuario activo, un invitado **solo puede acceder a aquellos recursos que se le hayan compartido explícitamente**. No puede iniciar sesión en el entorno de Office 365 de forma general ni tendrá acceso a un buzón de correo propio o a otras funcionalidades a menos que se le comparta algo directamente.

### **Proceso de Creación de Usuarios Invitados**

La creación de usuarios invitados es mayormente un proceso automático que ocurre en segundo plano:

1.  **Creación Automática (el método más común)**: Cuando un usuario de tu organización comparte un recurso (como un documento, un sitio de SharePoint o un Team) con una persona externa, el sistema **crea automáticamente un "objeto de invitado"**. Este objeto sirve como un "enganche" para la identidad de esa persona externa, permitiendo al sistema saber que tiene permiso para acceder a ese recurso concreto.
2.  **Creación Manual**: También es posible crear un usuario invitado de forma manual, aunque es menos frecuente en el día a día. Este proceso se realiza desde el portal de **Azure AD**, donde se puede invitar a un usuario, definir su identidad, enviarle un mensaje de bienvenida, añadirlo a grupos específicos y aplicarle ciertas restricciones de acceso.

Los usuarios invitados se distinguen en la lista de usuarios activos porque su nombre de usuario suele incluir el sufijo `_guest` y su dirección de correo electrónico original externa (por ejemplo, de Hotmail o Gmail).

### **Acceso y Permisos de los Usuarios Invitados**

El nivel de acceso de un usuario invitado depende del recurso que se le comparte:

*   **Acceso General**: Su acceso está limitado únicamente a lo que se ha compartido con ellos. Si se deja de compartir un recurso con un invitado, este **no pierde su cuenta de invitado, pero sí pierde el acceso** a dicho recurso.
*   **Acceso en Microsoft Teams**: Por defecto, un invitado en un Team tiene permisos bastante amplios, similares a los de un miembro normal de la organización. Las directivas de la organización permiten configurar lo que pueden hacer, como por ejemplo:
    *   Realizar llamadas privadas uno a uno.
    *   Participar en reuniones con vídeo.
    *   Compartir su pantalla.
    *   Editar los mensajes que han enviado.
    *   Utilizar la función de "Reunirse ahora".
*   **Nuevas Funcionalidades**: Microsoft está implementando opciones más granulares, como la posibilidad de **compartir un único canal de un Team con personal externo**, en lugar de tener que compartir el equipo completo, lo cual mejora la seguridad y la gestión de la colaboración.

### **Gestión y Administración**

La gestión de los usuarios invitados se realiza de la siguiente manera:

*   **Gestión del día a día**: Normalmente es un proceso automático. Cuando alguien comparte algo, el invitado se crea; si se necesita una gestión más detallada, se debe acudir a Azure AD.
*   **¡Advertencia sobre la eliminación!**: Es muy importante **no eliminar manualmente los usuarios invitados** desde la lista de usuarios activos. Si se borra un invitado, se rompe la compartición de todos los elementos con esa persona y restaurar esos accesos es un proceso muy complicado.
*   **Políticas de compartición**: Desde el centro de administración de SharePoint, se pueden establecer directivas a nivel de sitio para definir con quién se puede compartir, por ejemplo, permitiendo compartir con "invitados nuevos y existentes".

### **Diferencia entre Usuario Invitado y Contacto**

Es fundamental no confundir a un usuario invitado con un "contacto", ya que cumplen funciones totalmente diferentes:

*   **Usuario Invitado**: Su propósito es **dar acceso a recursos compartidos** (ficheros, Teams, etc.).
*   **Contacto**: Un contacto **no puede iniciar sesión ni acceder a ningún recurso**. Su única función es aparecer en la "libreta de direcciones global" de la organización para que los usuarios internos puedan encontrar fácilmente su dirección de correo y enviarles emails. También pueden ser añadidos a listas de distribución.