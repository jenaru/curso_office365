### 1. Lista de Distribución (Distribution List - DL)

- **¿Qué es?** Es un **destinatario de Exchange** (_recipient_).
- **Función principal:** Es un mecanismo sencillo para **enviar correo a múltiples miembros individuales** utilizando una sola dirección de correo electrónico (alias).
- **Funcionamiento clave:** Cuando recibe un correo, lo multiplica (proceso llamado _fanning out_) y lo entrega a la bandeja de entrada de cada miembro.
- **Almacenamiento:** **No son un buzón**; no tienen un repositorio de información propio para almacenar correos.
- **Administración:** Por defecto, **no son accesibles desde fuera** de la organización. Se pueden configurar para requerir **aprobación** de un delegado antes de enviar el correo.
- **Contexto:** Son anteriores a los Grupos de Microsoft 365.

### 2. Grupo de Seguridad (Security Group)

- **¿Qué es?** Es un tipo de grupo diseñado para **otorgar permisos**.
- **Función principal:** Se utiliza para gestionar el **acceso** a distintos tipos de contenido o recursos.
- **Uso en SharePoint:** Aunque existen, se usan **muy poco** en el modelo moderno de SharePoint.
- **Relación con correo:** Por defecto, un Grupo de Seguridad no tiene cuenta de correo.

### 3. Grupo de Seguridad Habilitado para Correo (Mail-Enabled Security Group)

- **¿Qué es?** Es una variante de un Grupo de Seguridad.
- **Función principal:** Además de **otorgar permisos**, tiene asignada una **cuenta de correo electrónico**.
- **Funcionamiento:** Funciona simultáneamente como un Grupo de Seguridad (para permisos) y como un Grupo de Distribución (para correo).

### 4. Grupo de Microsoft 365 (Grupo Moderno o Unified Group)

- **¿Qué es?** Es un **objeto especial** creado para fomentar la **colaboración**.
- **Almacenamiento clave:** A diferencia de una Lista de Distribución, un Grupo de Microsoft 365 **sí tiene un buzón propio** (un buzón compartido de Exchange).
- **Componentes de colaboración:** Incluye varios elementos para la colaboración además del buzón:
  - Un **calendario compartido**.
  - Un **repositorio de ficheros** (que proviene de SharePoint).
  - Un **blog de notas compartido**.
- **Relación con Teams y SharePoint:**
  - Un Grupo de Microsoft 365 es esencialmente un **sitio moderno de SharePoint**.
  - Sirve como la capa subyacente para un **equipo de Teams** (Team). Teams es una capa adicional de visualización e interacción sobre este grupo de Office 365.
