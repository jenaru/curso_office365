# Directivas de Confidencialidad en Office 365

### Propósito y Funcionalidad

El objetivo principal de estas etiquetas es ofrecer un mecanismo granular para proteger datos sensibles que va más allá de los permisos básicos de acceso que se configuran en sitios o grupos.

Las funcionalidades de protección clave que se pueden aplicar mediante estas etiquetas incluyen:

1.  **Control de Acceso Riguroso:** La etiqueta puede establecer que, para abrir un documento, un usuario debe pertenecer a un grupo específico, haciendo que los permisos de acceso tradicionales sean irrelevantes. Un usuario no podrá abrir el archivo si no es miembro del grupo definido en la etiqueta.
2.  **Gestión de Derechos Digitales:** Permiten controlar acciones que el usuario puede realizar con el contenido una vez que tiene acceso a él. Por ejemplo, se pueden establecer reglas para **impedir la impresión de un documento**.
3.  **Caducidad del Contenido:** Se puede configurar que el acceso al archivo "caducue" después de un tiempo determinado, como a los tres días, tal "como los yogures".
4.  **Cifrado y Marcado:** Las etiquetas de confidencialidad se utilizan para marcar elementos con un **nivel de protección más alto**, asegurando que si la información sale del entorno de la organización, se mantenga protegida según las políticas establecidas.

### Alcance de las Etiquetas

Es importante notar que estas etiquetas no se limitan solo al correo electrónico, sino que tienen un alcance global dentro de la plataforma de Microsoft 365, abarcando una capa mucho más amplia que la gestión de registros de mensajes (MRM) de Exchange:

- **Correo electrónico**.
- **Sitios de SharePoint**.
- **OneDrive**.
- **Chats de Teams**.

Al aplicar una etiqueta, esta viaja con el contenido, asegurando que la política de confidencialidad se respete sin importar dónde se almacene o se comparta.

### Administración y Licenciamiento (Detalles Cruciales)

La gestión de las Directivas de Confidencialidad y de Retención se centraliza en el Centro de Administración de Cumplimiento (Compliance), ahora conocido como **Microsoft Purview**.

Dentro de Purview, estas etiquetas se crean en la sección de **Clasificación de datos** (Data Classification) y están estrechamente ligadas a la funcionalidad de **Information Protection**.

**Requisito de Licenciamiento:**

Como experto, debo ser **detallista** sobre la licencia requerida, ya que esta es una funcionalidad avanzada que no se incluye en los planes base:

- **Licencia Requerida:** Para que las etiquetas de confidencialidad sean funcionales y se apliquen efectivamente, se requiere una **licencia superior**, como **E3 o un equivalente**.
- **Visibilidad vs. Funcionalidad:** Es común que, aunque un administrador pueda ver las opciones para crear estas etiquetas en el panel de Purview, no serán operativas en el entorno si la organización no dispone del licenciamiento adecuado. Si se intenta activar en licencias estándar, la funcionalidad "no sirve, no protege nada".
