# Flujo de Correo en Exchange Online##

## 1. Propósito y Funcionalidad

Las reglas de transporte permiten automatizar acciones y aplicar políticas a los mensajes de correo electrónico en función de condiciones específicas.

- **Alcance:** Originalmente, solo se podían utilizar para el correo que entraba o salía de la organización, pero desde Exchange 2007 (o Exchange 2010), también sirven para el correo interno.
- **Usos Comunes:**
  - **Automación y Transformación:** Se usan para automatizar acciones como reenviar mensajes, redirigirlos, bloquearlos, o agregar textos de renuncia de responsabilidad (_disclaimers_) en la parte inferior.
  - **Seguridad:** Pueden utilizarse para crear "barreras" o compartimentos internos, por ejemplo, impidiendo la comunicación entre ciertos departamentos (Asuntos Internos y empleados) o alertando sobre información confidencial.
  - **Moderación:** Se puede configurar que los mensajes pasen a un moderador para su aprobación antes de ser enviados.

### 2. Configuración y Condiciones

Al crear una regla, se especifican condiciones y acciones:

- **Condiciones:** Determinan qué debe cumplirse para que la regla se aplique. Esto incluye:

  - Si el remitente es interno o externo.
  - Si pertenece a un grupo.
  - Si contiene un patrón de texto específico.
  - Si está en una lista de supervisión.
  - El tamaño del adjunto.
  - El remitente o destinatario de la persona.
  - Patrones de texto en el destinatario.

- **Acciones (Efectos):** Lo que ocurrirá si se cumplen las condiciones:

  - Reenviar, redirigir, o bloquear el mensaje.
  - Poner a alguien en copia.
  - Adjuntar un texto de renuncia de responsabilidad (_disclaimer_), el cual puede ser en formato HTML.
  - Cambiar la seguridad del mensaje.
  - Notificar al destinatario (ej. "Gracias por su correo, se le responderá en breve").

- **Excepciones:** Se pueden añadir excepciones para que la regla sea lo más acotada posible y no se aplique a ciertos mensajes, incluso si cumplen las condiciones.

- **Dirección del Remitente:** Es importante notar que, según la arquitectura SMTP, la dirección del remitente puede venir en dos sitios: el **encabezado** y el **sobre**. Las reglas permiten hacer referencia a la dirección del encabezado, del sobre, o de ambas.

### 3. Orden y Riesgos de Aplicación

El orden en el que se aplican las reglas es fundamental.

- **Procesamiento Secuencial:** Las reglas se aplican en orden (de arriba abajo), y el orden puede subirse y bajarse.
- **Detener Procesamiento:** Es posible detener el procesamiento de más reglas mediante una opción específica al final de la regla. Si no se usa esta opción, se ejecutarán la Regla 1, la Regla 2, la Regla 3, y así sucesivamente.
- **Riesgo por Retraso:** Las reglas de transporte no se activan de forma inmediata. Si se comete un error al configurarlas, tardan un rato en activarse y, si hay que desactivarlas, también tardan un rato, lo que puede causar problemas.

### 4. Pruebas y Auditoría

Antes de forzar el cumplimiento de una regla, existen modos de prueba para mitigar los riesgos:

- **Modo Activo (Exigir):** La regla está funcionando y se aplica.
- **Probar con Sugerencia de Directiva (_Policy Tip_):** La regla no se aplica, pero si el usuario va a enviar un correo que cumpla la condición, le sale un mensaje antes de enviarlo, avisando que la regla se aplicaría.
- **Probar sin Sugerencia de Directiva:** La regla no se aplica, pero luego se puede sacar un informe para ver qué correos habrían sido afectados.

**Auditoría:** Se puede auditar la regla con un nivel de gravedad (Alto, Medio, Bajo). Esto permite sacar un informe posterior para ver qué reglas de seguridad se han activado.

### 5. Configuración Adicional

- **Activación Programada:** Las reglas se pueden configurar para que comiencen o finalicen automáticamente en una fecha determinada.
- **Comentarios:** Es posible agregar un comentario a la regla, por ejemplo, especificando quién ordenó su creación y cuándo (ej. "regla creada el 7 del 6 por orden de Alfredo").
