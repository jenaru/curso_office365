### Conectores (_Connectors_) en el Flujo de Correo

Los conectores definen las rutas específicas para cómo el correo se recibe o se envía, especialmente cuando involucra servidores internos o dispositivos perimetrales.

**Propósito:** La idea de un conector es indicarle a Exchange Online cómo debe realizar el envío o la recepción del correo en **casos particulares**.

#### 1. Conectores de Recepción (Inbound Connectors)

Estos conectores definen cómo Exchange Online debe aceptar el tráfico de correo proveniente de **sistemas internos** (servidores de aplicaciones, impresoras multifunción, etc.) para que no sea tratado como _spam_ o como tráfico externo.

- **Uso Principal:** Se utilizan cuando se tienen sistemas en la red interna que también envían correo, como un servidor con una aplicación que envía albaranes.
- **Aceptación de Tráfico:** Se pueden configurar para aceptar el tráfico de correo de sistemas internos.
- **Configuración por IP:** Para que Exchange confíe en el sistema interno, se puede configurar el conector especificando la **dirección IP** de salida de la red local (la IP de origen).
- **Ventajas (Opción 3 del artículo mítico):** Esta es la mejor opción para que las aplicaciones internas envíen correo a través de Office 365.
  - Utiliza el **puerto 25** estándar, lo que facilita la configuración.
  - **No requiere autenticación** (ya que se confía implícitamente en la IP de origen especificada), lo que es más fácil de configurar en dispositivos como impresoras o cacharros.
  - Permite hacer **relay** (reenvío): El sistema aceptará cualquier correo, aunque la dirección de origen (ej. `notificaciones@dominio.com`) no tenga un buzón asignado, siempre que sea de un dominio aceptado por la organización.
  - El correo que ingresa por este conector es tratado como una **conexión interna** y está sujeto a menos restricciones de antispam que si pasara por la puerta pública.

#### 2. Conectores de Envío (Outbound Connectors)

Estos conectores definen cómo se debe enviar el correo desde Exchange Online hacia el exterior en casos específicos, **alterando el flujo normal de salida**.

- **Uso Principal:** Se usan para dirigir el tráfico saliente a través de una ruta específica o un dispositivo perimetral.
- **Alteración del Flujo:** En lugar de enviarlo por el camino público, se le puede indicar que lo envíe a través de una **IP específica** de un servidor de correo (ejemplo de una empresa de automoción que enviaba a un servidor específico de Volkswagen para encargos de piezas).
- **Seguridad:** También se usan cuando se tienen dispositivos de seguridad perimetral externos (como un Barracuda), para que el correo saliente pase primero por ese dispositivo antes de ser entregado al mundo.

#### 3. Diferencia con Reglas de Transporte

Un conector de recepción abre una **segunda puerta** que acepta conexiones desde una IP local y está sujeta a **menos restricciones de antispam**, tratándose como una conexión interna. Esto permite hacer _relay_, cosa que no se puede lograr solo con una regla de transporte.

**En resumen:** Los conectores permiten configurar escenarios complejos, como que una aplicación interna sin buzón pueda enviar correos de manera segura (_relay_ usando la Opción 3) o que todo el correo saliente pase por un dispositivo de seguridad perimetral.
