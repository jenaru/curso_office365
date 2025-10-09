# Flujo de Correo en Exchange Online

El flujo de correo gestiona el camino que sigue un mensaje al entrar, salir o moverse dentro de la organización. La administración avanzada del correo electrónico, incluyendo la configuración del flujo de correo, se realiza en el **Centro de Administración de Exchange (CAE)**.

Aquí te detallo la información clave sobre la administración del flujo de correo basada en las fuentes:

### 1. Seguimiento de Mensajes (Message Trace)

El seguimiento de mensajes es la herramienta principal para diagnosticar qué ocurrió con un correo.

- **Propósito:** Permite buscar mensajes por remitente, destinatario, estado de entrega, y más. Es útil cuando un usuario indica que un correo no le ha llegado o que hubo un fallo en el envío.
- **Alcance del Reporte:** Los registros se guardan por un máximo de **90 días**. Si se busca más allá de 90 días, solo se dispone de un archivo CSV.
- **Visibilidad:** Esta herramienta muestra el camino que siguió el correo dentro de la infraestructura de Office 365, pero no ofrece visibilidad sobre lo que ocurre una vez que el mensaje es entregado al sistema de correo de terceros.
- **Ejecución:** Se pueden usar consultas predefinidas o crear búsquedas concretas, especificando el remitente (sender) o el destinatario (recipient). Para informes detallados o búsquedas amplias (como un `extended report`), la preparación del informe puede tardar una hora o más, y se notifica al usuario que lo solicitó.

### 2. Reglas de Transporte (Transport Rules)

Las reglas de transporte son mecanismos que transforman o actúan sobre un correo mientras está en tránsito, aplicándose a mensajes entrantes, salientes e internos.

- **Propósito:** Se utilizan para automatizar acciones, como reenviar mensajes, redirigirlos, bloquearlos, agregar textos de renuncia de responsabilidad (_disclaimers_) o gestionar barreras internas (como prevenir la comunicación entre ciertos departamentos).
- **Configuración:** Al crear una regla, se especifican:
  - **Condiciones:** Qué debe cumplirse para que la regla se aplique (ej. si el remitente es externo, si el destinatario pertenece a un grupo, si contiene un patrón de texto específico, o si el tamaño es excedido).
  - **Acciones (Efectos):** Qué hará la regla si se cumplen las condiciones (ej. redirigir, bloquear, adjuntar un _disclaimer_ en HTML, o notificar al destinatario).
- **Orden y Flujo:** Las reglas se aplican en orden (de arriba abajo), y el orden es crucial. Es posible detener el procesamiento de más reglas mediante una opción específica al final de la regla, lo que evita que se apliquen reglas subsiguientes (ej. si una excepción debe aplicarse antes de un _disclaimer_ general).
- **Pruebas:** Antes de aplicar una regla de forma activa (exigirla), se recomienda ponerla en modo de **prueba** (_test mode_). El modo "Probar con sugerencia de directiva" (_Policy Tip_) muestra un mensaje al usuario antes de enviar un correo indicando que la regla se aplicaría.
- **Activación Programada:** Las reglas se pueden programar para que comiencen o finalicen automáticamente en una fecha determinada (ej. para un periodo navideño o un cambio de dominio).
- **Riesgos:** Un uso incorrecto o una regla mal configurada puede generar problemas, y debido a que la activación o desactivación de estas reglas no es inmediata, puede haber un periodo de tiempo con errores.

### 3. Dominios Aceptados (Accepted Domains)

Define qué dominios de correo son responsabilidad de este Exchange Online.

- **Tipos de Dominio Aceptado:**
  - **Autoritativo (Authoritative):** Es la opción por defecto. Exchange Online es el único responsable de gestionar el correo para ese dominio. Si un destinatario en ese dominio no existe, el correo se rechaza.
  - **Retransmisión Interna (Non-Authoritative/Relay):** Se utiliza en escenarios de coexistencia o migración. Exchange intentará buscar el destinatario internamente. Si no lo encuentra, lo enviará al registro MX del dominio, buscando al destinatario en otro sistema de correo (ej. un servidor de correo local o un hosting externo).

### 4. Conectores (Connectors)

Los conectores permiten gestionar el flujo de correo en casos particulares, definiendo cómo se recibe o se envía el correo a sistemas internos o externos específicos.

- **Conectores de Recepción (Inbound):** Definen cómo se acepta el tráfico de correo proveniente de sistemas internos (servidores de aplicaciones, impresoras multifunción) para que no sean tratados como spam o como tráfico externo. Se configuran generalmente especificando la **IP de origen** de la red local, lo que permite que el sistema envíe correo a través de Office 365 sin necesidad de autenticación.
- **Conectores de Envío (Outbound):** Se usan para dirigir el tráfico de salida a través de una ruta específica, alterando el flujo normal de salida (ej. enviando el correo a través de un dispositivo de seguridad perimetral externo como Barracuda, o a una IP específica en lugar de la ruta pública).
- **Relay de Correo:** La opción de usar un conector de entrada (Opción 3) permite que sistemas internos realicen _relay_ (envío de correo a terceros) a través de Office 365 sin necesidad de que la dirección de origen tenga un buzón asignado (ej. `notificaciones@dominio.com`), aunque sí debe ser un dominio aceptado.

### 5. Configuración General de Flujo

Se pueden configurar opciones globales en el CAE que afectan a todo el tráfico de correo de la organización:

- **Tamaño Máximo de Mensajes:** Se puede configurar el tamaño máximo de los mensajes enviados y recibidos, aunque el límite máximo soportado por la plataforma (alrededor de 128 MB) se encuentra en las descripciones del servicio. Por higiene y para evitar un mal uso, se suele establecer un límite inferior (ej. 32 MB).
- **SMTP Autenticado:** A nivel global, se puede desactivar el protocolo SMTP AUTH para todos los usuarios. Los _tenants_ nuevos suelen tenerlo desactivado por defecto, ya que es un método de autenticación considerado vulnerable.
- **Envío desde Alias:** Hay una opción para activar el envío de correo desde cualquiera de los alias de una cuenta, no solo desde la dirección principal, aunque esta es una funcionalidad inminente o muy reciente.
