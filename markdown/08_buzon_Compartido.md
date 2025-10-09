El buzón compartido es un tipo de **destinatario especial de Exchange**.

### 1. ¿Qué es un Buzón Compartido y Para Qué Sirve?

Un buzón compartido se utiliza principalmente para direcciones genéricas o de equipo, como `soporte@` o `pedidos@`.

- **Diferencia clave:** A diferencia de una Lista de Distribución, el Buzón Compartido **sí tiene un buzón separado** (un repositorio de información propio) del de los miembros que acceden a él.
- **Acceso:** Los miembros tienen que **acceder activamente** a este buzón compartido para ver los correos, ya que el correo no se les envía a su buzón individual.
- **Licenciamiento:** La gran ventaja del buzón compartido es que **no consume licencia**.
- **Uso común:** Si un usuario se va de la empresa, una técnica común es **convertir su buzón individual a buzón compartido**. De esta forma, se mantiene su historial de correo (todo el contenido del buzón) sin consumir una licencia.

### 2. Administración y Permisos

Para que un usuario pueda trabajar con un buzón compartido, un administrador debe otorgarle permisos específicos:

| Permiso                             | Propósito                                                                    | Explicación                                                                                                                                                                                                           |
| :---------------------------------- | :--------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Acceso Completo** (_Full Access_) | Permite **leer y administrar** el buzón, incluyendo la capacidad de abrirlo. | Cuando un administrador otorga este permiso a un usuario (ej. a Alex y a Megan), ese buzón aparecerá como un buzón adicional en su cliente de correo (a través de _automapping_).                                     |
| **Enviar Como** (_Send As_)         | Permite **enviar correos electrónicos** en nombre de ese buzón.              | Al enviar un correo, en el campo "De" aparecerá la dirección del buzón compartido (`soporte@`) y el destinatario lo recibirá como si lo hubiera enviado el propio buzón, sin que aparezca el nombre del miembro real. |

**Nota sobre Envío en Nombre de:** Existe un permiso relacionado, **"Enviar en Nombre de"** (_Send on Behalf_), donde el destinatario ve que el correo fue enviado por el miembro (ej., Benito) _en nombre_ del buzón compartido (ej., Manu). Este es un nivel de suplantación inferior y menos común.

### 3. Configuraciones Especiales

- **Respuestas Automáticas:** Se le pueden activar respuestas automáticas. Sin embargo, funcionan igual que las de un buzón normal, con un límite de **una respuesta al día** al mismo remitente. Esto es importante para informar que se está procesando su solicitud.
- **Almacenamiento de Copias:** Se puede configurar si la copia del correo enviado desde el buzón compartido se guarda solo en el buzón compartido o si también se guarda una copia en la bandeja de elementos enviados del miembro individual. Esto se gestiona desde la interfaz de administración.

Un buzón compartido es una opción más que se suma a la Lista de Distribución y al Grupo de Office 365 para gestionar comunicaciones colectivas.
