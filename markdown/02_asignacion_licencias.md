El proceso de asignación de licencias es fundamental en Microsoft 365, ya que una licencia es lo que otorga a los usuarios el derecho a utilizar las distintas funcionalidades y aplicaciones de la plataforma.

### **Conceptos Clave del Licenciamiento**

Una cuenta de usuario por sí sola no tiene coste hasta que se le asigna una licencia. Sin una licencia, un usuario puede iniciar sesión en Office 365, pero no tendrá acceso a funcionalidades como SharePoint, Teams o un buzón de correo. Las funcionalidades disponibles, especialmente en el ámbito de la seguridad, dependen directamente del tipo de licencia asignada. A mayor coste de la licencia, se obtienen más posibilidades de auditoría, alertas y otras herramientas avanzadas.

### **Proceso de Asignación de Licencias**

Existen métodos manuales y automáticos para asignar licencias a los usuarios.

#### **1. Verificación de Licencias Disponibles**

Antes de asignar licencias, es importante saber de cuáles dispone la organización. Esta información se encuentra en la sección de **Facturación > Licencias** en el centro de administración. Allí se puede ver el total de licencias compradas, cuántas están asignadas y cuántas quedan libres.

#### **2. Asignación Manual (a través del Centro de Administración)**

Este es el método más directo y se realiza siguiendo estos pasos:

1.  Ir a **Usuarios > Usuarios activos** en el centro de administración.
2.  Seleccionar el usuario al que se le quiere asignar una licencia.
3.  En el panel del usuario, ir a la pestaña **Licencias y aplicaciones**.

En este panel, se pueden activar o desactivar aplicaciones individuales que forman parte del paquete de la licencia. Esta granularidad es útil, por ejemplo, para introducir funcionalidades de manera progresiva a los usuarios a medida que reciben formación. Es importante saber que algunas aplicaciones están vinculadas, como OneDrive, que forma parte de SharePoint y no puede desactivarse de forma independiente.

#### **3. Mezcla de Licencias**

Es posible tener una mezcla de distintos tipos de licencias dentro de la misma organización. Por ejemplo, se pueden asignar licencias más básicas y económicas (como las de *Frontline*) a personal externo o temporal que no requiere todas las funcionalidades de un usuario de oficina.

Incluso un mismo usuario puede tener asignados varios paquetes de licencias diferentes simultáneamente. La interfaz de administración muestra claramente qué aplicaciones provienen de cada paquete de licencia asignado. Por ejemplo, un usuario podría tener una licencia *Business Standard* y, además, una licencia de prueba como *Teams Exploratory Trial*.

#### **4. Asignación Automática**

Para organizaciones más grandes o para simplificar la gestión, Office 365 ofrece métodos para automatizar la asignación de licencias:

*   **Asignación al primer inicio de sesión**: Se puede configurar que las licencias se asignen automáticamente la primera vez que un usuario inicia sesión.
*   **Asignación basada en grupos**: Un método más avanzado y recomendable para la gestión a gran escala es asignar licencias según la pertenencia a grupos de usuarios en Azure AD. De esta forma, al añadir un usuario a un grupo determinado (por ejemplo, "Comerciales"), se le asigna automáticamente el paquete de licencias predefinido para ese grupo.

#### **5. Gestión mediante PowerShell**

La gestión de licencias también se puede realizar mediante **PowerShell**, lo cual es especialmente útil para operaciones masivas. Se pueden utilizar comandos, como `Set-MSOLUser`, para asignar licencias, cambiar contraseñas o modificar el nombre principal de usuario. También es posible incluir la asignación de licencias como parte de scripts para la creación masiva de usuarios.

### **Gestión de Costes y Casos Especiales**

*   **Liberación de licencias**: Cuando un empleado deja la empresa, una práctica común es convertir su buzón en un **buzón compartido**. Esto permite conservar el correo sin consumir una licencia, ya que los buzones compartidos no requieren una.
*   **Recursos sin licencia**: Algunos tipos de buzones, como los de **sala** (para salas de reuniones) o los de **equipamiento** (para recursos como proyectores o vehículos), no consumen licencias.
*   **Licencias de prueba**: Es importante revisar si los usuarios tienen licencias de prueba, como la "Microsoft Teams Exploratory Trial", que fue una licencia gratuita durante la pandemia. Estas licencias caducan y deben ser reemplazadas por licencias de pago para no perder la funcionalidad.