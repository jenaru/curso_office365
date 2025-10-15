## Microsoft Defender para Office 365: El Escudo Antimalware

Microsoft Defender for Office 365 es la solución de seguridad que protege la infraestructura de correo electrónico de su organización. A diferencia de un antivirus de puesto de cliente, Defender actúa sobre el correo **mientras está en tránsito** dentro de la plataforma Microsoft 365.

Esta plataforma incluye funcionalidades esenciales como:

1.  **Antispam y Antimalware:** Políticas que escanean el tráfico de correo para bloquear o poner en cuarentena amenazas conocidas. En el caso del _malware_, la política es clara: "no se negocia", el archivo debe eliminarse o ponerse en cuarentena.
2.  **Antifishing:** Políticas avanzadas que utilizan inteligencia artificial para detectar la suplantación de identidad (spoofing), incluso ofreciendo indicadores visuales al usuario cuando recibe un correo por primera vez de un remitente específico.
3.  **Cuarentena y Revisiones:** El centro de seguridad permite a los administradores revisar los correos que han sido detenidos por estas políticas.

Para que esta protección sea efectiva, es fundamental que el sistema pueda verificar que el correo que recibe o envía es legítimo. Aquí es donde entran en juego los tres protocolos de autenticación de correo.

---

## La Tríada de Autenticación de Correo Electrónico: SPF, DKIM y DMARC

Estos tres protocolos se configuran mediante registros en el DNS público de su dominio y permiten a los servidores de correo receptores (de terceros) verificar la legitimidad de los correos enviados por su organización.

### 1. SPF (Sender Protection Framework)

El SPF es el mecanismo más básico y antiguo.

- **Propósito:** Identificar cuáles son los servidores de correo autorizados para enviar mensajes en nombre de su dominio. Esto ayuda a evitar que un atacante utilice su dominio para enviar spam o correos maliciosos.
- **Mecanismo:** Se implementa mediante un registro de tipo **TXT** en su DNS público. Este registro lista las direcciones IP o nombres de host de todos los servicios (incluido Office 365, proveedores de marketing, etc.) que están permitidos para originar correo de su dominio.
- **Importancia en Defender:** Cuando un correo entra, Defender (o el servidor receptor) verifica si el servidor de envío está en la lista SPF del dominio remitente. Si falla, es una señal de alerta.

> Como nota detallista, debe tenerse **mucho cuidado** al activar políticas que rechacen correos por fallar el SPF. La realidad es que muchas empresas, incluso grandes, tienen registros SPF mal configurados, y rechazar automáticamente estos correos legítimos puede provocar problemas de comunicación con clientes o proveedores.

### 2. DKIM (DomainKeys Identified Mail)

DKIM aporta una capa de seguridad criptográfica.

- **Propósito:** Firmar digitalmente los correos electrónicos para que el receptor pueda verificar que el mensaje no ha sido alterado en tránsito y que realmente proviene del dominio que afirma ser.
- **Mecanismo:** La firma digital se genera utilizando una **clave privada** (gestionada por Office 365) y se verifica utilizando una **clave pública** que se publica en su DNS, generalmente bajo registros llamados `selector1` y `selector2`.
- **Importancia en Defender:** Microsoft Defender utiliza estas firmas para aumentar la confianza en los correos salientes y entrantes. Si un correo no está firmado digitalmente (DKIM desconocido) o la firma es inválida, se eleva su nivel de riesgo.

### 3. DMARC (Domain-based Message Authentication, Reporting, and Conformance)

DMARC es el protocolo de política y monitoreo que unifica el uso de SPF y DKIM.

- **Propósito:** Indica al servidor receptor qué acción debe tomar si un correo que afirma ser de su dominio **falla** las comprobaciones de SPF y/o DKIM.
- **Mecanismo (Política):** Se implementa mediante un registro **TXT** en el DNS, donde se define la política de acción:
  - **None (p=none):** No tomar ninguna acción (aceptar), pero se utiliza para monitorear.
  - **Quarantine (p=quarantine):** Marcar el correo como sospechoso y ponerlo en cuarentena.
  - **Reject (p=reject):** Rechazar completamente el correo.
- **Mecanismo (Reportes):** DMARC también incluye campos (`RUA` y `RUF`) que permiten a los servidores receptores enviar informes de vuelta a su organización. Estos informes (a menudo en formato XML) detallan si los correos enviados desde su dominio pasaron o fallaron las comprobaciones de SPF y DKIM.

> **Dato Didáctico:** La construcción del registro DMARC le permite al emisor decirle al receptor cómo comportarse. Esto es vital para proteger su identidad de posibles suplantaciones, ya que le asegura que si alguien más intenta usar su dominio de forma ilegítima, el correo será rechazado.

---

## Gestión de Políticas de Correo en Defender

Dentro del portal de seguridad (Microsoft Purview), la administración utiliza las políticas de Defender para Office 365 para determinar cómo se interactúa con estos chequeos de autenticación:

1.  **Políticas Antifishing:** Estas políticas pueden ser configuradas para ser más agresivas si los correos fallan SPF o DKIM. El administrador puede configurar umbrales de seguridad y activar funciones de inteligencia artificial para monitorear usuarios y dominios específicos susceptibles de ser suplantados (suplantación de usuarios internos).
2.  **Configuración de Autenticación:** El administrador puede confirmar si DKIM está habilitado para el dominio a través de la sección de autenticación de correo.
3.  **Cuarentena:** Los mensajes que fallan estos chequeos de autenticación y superan los umbrales de riesgo son colocados en cuarentena. Las políticas de cuarentena pueden ser ajustadas para dar acceso limitado a los usuarios estándar para revisar mensajes (solo vista previa), sin darles permiso para liberarlos, lo cual protege contra la liberación accidental de correos peligrosos.
4.  **Simulaciones de Ataque:** Defender también facilita la creación de políticas para que ciertas IP de simulaciones de phishing sean ignoradas por los filtros normales, permitiendo a la organización probar la resistencia de sus usuarios ante ataques reales.
