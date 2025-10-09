Los **Usuarios Activos** (Active Users) en la consola de administración de Office 365 representan a las identidades que pueden iniciar sesión en el entorno. Esta lista es equivalente a los objetos de usuario en Azure AD (Azure Active Directory), que funciona como el gestor de identidades y autenticación para todos los servicios de Microsoft 365.

Aquí tienes un desglose de las principales acciones que se pueden realizar con los usuarios activos:

### 1. Gestión de Identidad y Licenciamiento

Las acciones sobre usuarios activos están intrínsecamente ligadas a las licencias, ya que una cuenta de usuario sin licencia no tiene ninguna funcionalidad asociada.

- **Asignación de Licencias:** Un usuario solo comienza a generar costos una vez que se le asigna una licencia. La asignación de una licencia es lo que activa funcionalidades como el buzón de Exchange, el acceso a Teams y el acceso a SharePoint.
- **Gestión de Sublicencias:** Es posible activar o desactivar funcionalidades específicas (sublicencias) dentro de un paquete de licencias asignado. Esto permite, por ejemplo, introducir herramientas progresivamente (como Teams o SharePoint) para evitar la sobrecarga del usuario, aunque OneDrive, por ejemplo, forma parte de SharePoint y no se puede desactivar por separado.
- **Configuración del UPN (User Principal Name):** Se puede modificar el nombre principal de usuario (UPN), que es el nombre de inicio de sesión del usuario. Este suele coincidir con la dirección de correo electrónico principal. Si se han agregado múltiples dominios a la organización, se puede seleccionar cuál usar como UPN.
- **Alias de Correo Electrónico:** Se pueden configurar y modificar alias de correo (direcciones SMTP). Es importante notar que, tradicionalmente, solo se puede enviar correo desde la dirección principal, aunque se ha anunciado un cambio inminente para permitir el envío desde cualquiera de los alias. (Nota: Obtener un listado de todos los alias sin el uso de PowerShell no es posible a través de la interfaz web).

### 2. Acciones de Correo Electrónico (Vía Panel General o Exchange)

Aunque la gestión avanzada del correo se realiza en el Centro de Administración de Exchange, el panel de Usuarios Activos ofrece atajos a las tareas más comunes.

- **Tríada de Permisos:** Se gestionan tres permisos clave sobre el buzón:
  - **Acceso Completo (Full Access):** Permite a otro usuario abrir y administrar el buzón, incluyendo la lectura y modificación de correos.
  - **Enviar Como (Send As):** Permite a otro usuario enviar correos haciéndose pasar por el buzón, lo que es útil, por ejemplo, para asistentes que gestionan el correo de un directivo.
  - **Enviar en Nombre de (Send on Behalf of):** Permite enviar correos, pero dejando claro que el correo ha sido enviado por un delegado en nombre del buzón original.
- **Reenvío de Correo:** Se puede configurar el reenvío automático a otra dirección de correo electrónico. Esta acción es considerada peligrosa y es un método común en ataques de compromiso de correo, por lo que existen alertas para detectarla.
- **Respuestas Automáticas:** Se pueden configurar mensajes de "Fuera de la oficina", con la opción de establecer respuestas distintas para usuarios internos y externos.
- **Ocultar de la GAL (Global Address List):** Se puede ocultar al usuario de la Lista Global de Direcciones (GAL).
- **Conversión de Buzones:** Un buzón de usuario (con licencia) puede convertirse en un buzón compartido (Shared Mailbox), lo que permite que varios usuarios lo administren y, crucialmente, deja de consumir una licencia.

### 3. Seguridad y Control

- **Suspensión por Litigio (Litigation Hold):** Si el licenciamiento lo permite (generalmente se requiere una licencia avanzada), se puede activar la suspensión por litigio. Esto garantiza que todos los cambios realizados en el buzón (incluidas las eliminaciones) queden registrados y que la información nunca se elimine, sirviendo como una forma de retención legal y evitando la eliminación permanente de correos después del periodo de retención normal.
- **Cerrar Sesiones:** Se puede forzar el cierre de todas las sesiones de Office 365 abiertas por el usuario. Esto es una medida importante en caso de que se detecte una brecha de seguridad para bloquear el acceso incluso después de que se haya cambiado la contraseña.

### 4. Gestión Avanzada y Masiva

- **PowerShell:** Para tareas masivas o complejas, se utiliza PowerShell (a través de módulos como Exchange Online o Azure AD). Por ejemplo, se puede crear, modificar y asignar licencias a múltiples usuarios a la vez mediante la importación de archivos CSV e iteración con bucles (`for each`).
- **Roles de Administración:** Se puede asignar roles de administración específicos y granulares al usuario, como el rol de Administrador de Facturación o roles con permisos muy acotados.
