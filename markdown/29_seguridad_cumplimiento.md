# Seguridad y Cumplimiento en Microsoft 365

### La Administración de Seguridad y Cumplimiento en Microsoft 365

La gestión de la seguridad y el cumplimiento se lleva a cabo principalmente en dos centros de administración separados, aunque relacionados, debido a la diferencia en los roles que los administran (administradores de TI versus personal legal o auditores).

1.  **Centro de Administración de Seguridad (Microsoft Defender):** Orientado a la gestión activa de amenazas, la protección de puntos de conexión y la configuración de políticas.
2.  **Centro de Administración de Cumplimiento (Microsoft Purview):** Orientado a las obligaciones legales, el gobierno de datos, auditorías y gestión de riesgos, área que Microsoft ha renombrado recientemente a **Microsoft Purview**.

#### 1. Arquitectura y Dependencia de Licencias

La disponibilidad de las funcionalidades de seguridad y cumplimiento está estrechamente ligada a la licencia que se posea. Por ejemplo, si se tiene la licencia **Business Premium** (la cual el experto recomienda por su relación calidad-precio), esta incluye funcionalidades avanzadas:

- **Microsoft Defender for Business:** Esta es una versión ligera (_light_) del costoso Microsoft Defender for Endpoint, que proporciona capacidades importantes como la **Detección y Respuesta de Puntos de Conexión (EDR)**. EDR y la investigación automatizada de amenazas están incluidas y son muy valiosas.
- **Intune (Endpoint Manager):** Permite la gestión de dispositivos (PC, iPad, macOS, Android).
- **Azure AD P1:** Necesaria para habilitar funcionalidades clave de identidad, como el **Acceso Condicional**.

Es importante notar que muchas funcionalidades de seguridad requieren licencias avanzadas (como Azura AD P1) y si bien el panel de administración puede permitir la configuración, su uso real puede depender de que todos los usuarios dispongan de la licencia adecuada.

#### 2. Seguridad de la Plataforma y la Identidad

La protección comienza en la identidad y el acceso, gestionado en parte por Azure AD:

- **Puntuación de Seguridad (Secure Score):** Una herramienta esencial que evalúa el estado de seguridad del _tenant_ (entorno de Office 365) y ofrece una lista de acciones recomendadas para mejorar la seguridad (como habilitar la MFA para todos los usuarios o configurar la restricción de reenvío de correo). Las acciones se priorizan según cuánto mejorarían la seguridad.
- **Valores Predeterminados de Seguridad (_Security Defaults_):** Configuración de seguridad básica y no administrable que Microsoft impone por defecto. Microsoft ha anunciado que esto será obligatorio, asegurando que incluso los usuarios que no han implementado MFA lo tengan activado de alguna forma.
- **Acceso Condicional (_Conditional Access_):** Es una funcionalidad poderosa que permite crear reglas estrictas basadas en el riesgo, la ubicación o el dispositivo del usuario. Por ejemplo, se puede exigir la autenticación multifactor (MFA) si el usuario inicia sesión fuera de la red corporativa, o bloquear el acceso si se detecta un "viaje imposible" (inicios de sesión distantes en poco tiempo).

#### 3. Políticas de Protección de Correo (Policies & Rules)

El correo electrónico es el principal vector de ataque, por lo que las directivas de protección son fundamentales:

- **Antimalware:** Las políticas de _Antimalware_ son estrictas ya que "con el malware no se negocia". Se recomienda ser extremadamente estricto con las extensiones de archivos adjuntos y bloquear formatos que son comunes en los ataques de _ransomware_ y _malware_ (como `.ISO`, `.LNK`, `.CMD`, `.BAT`).
- **Antispam y Antifishing:** Permiten configurar umbrales de agresividad (puntuación) para el _spam_ y el _phishing_.
  - **Bloqueo por Origen:** Es posible aumentar la puntuación de riesgo si el correo proviene de países o lenguajes específicos con los que la empresa no trabaja.
  - **Controles de Dominio (SPF, DKIM, DMARC):** Estos mecanismos refuerzan la seguridad del correo y evitan la suplantación de identidad (spoofing).
    - **SPF (Sender Protection Framework):** Publica qué servidores están autorizados a enviar correo en nombre de su dominio.
    - **DKIM (DomainKeys Identified Mail):** Firma digitalmente los correos electrónicos para que el receptor verifique la legitimidad del emisor.
    - **DMARC (Domain-based Message Authentication, Reporting, and Conformance):** Indica al receptor qué hacer con los correos que fallan las comprobaciones SPF o DKIM (rechazarlos, ponerlos en cuarentena o aceptarlos) y permite solicitar informes sobre cómo se reciben los correos de su dominio.
- **Reenvío de Correo (_Forwarding_):** Es una configuración de alto riesgo que debe controlarse y justificarse, ya que es la técnica más común utilizada por los atacantes para mantener el acceso y recibir copias de los correos incluso después de que las credenciales de la víctima han sido restablecidas. Existen alertas para detectar reenvíos automáticos a cuentas externas.
- **Cuarentena (_Quarantine_):** Las políticas de cuarentena modernas permiten definir si los usuarios comunes tienen acceso a ver los mensajes retenidos y qué acciones pueden realizar (como solicitar su liberación, sin poder liberarlos directamente).

#### 4. Cumplimiento, Retención y Auditoría (Purview)

Estas funcionalidades se centran en el gobierno de la información para cumplir con requisitos legales:

- **Retención (_Retention_) y Suspensión por Litigio (_Litigation Hold_):** Es crucial entender que Office 365 no ofrece copias de seguridad (_backup_) del correo; en su lugar, ofrece **retención**. _Litigation Hold_ es una funcionalidad de licencia avanzada que permite conservar todos los cambios históricos en un buzón de correo (o archivos/chats de Teams) de forma permanente, de modo que el contenido nunca se pierde, incluso si el usuario lo borra.
- **Auditoría (_Auditing_):** Permite registrar detalladamente las acciones realizadas por usuarios y administradores (por ejemplo, quién modificó un fichero). En _tenants_ antiguos, la auditoría puede no estar activada por defecto y debe habilitarse manualmente.
- **Descubrimiento Electrónico (_eDiscovery_):** Herramienta que permite a los equipos legales crear búsquedas y extraer contenido específico (correos, documentos, etc.) de la plataforma en un formato que es legalmente aceptable para ser presentado ante un tribunal.
- **Etiquetas de Confidencialidad (_Confidentiality Labels_):** Sellos de seguridad adicionales que se aplican a los documentos (sitios de SharePoint, OneDrive, chats de Teams) para controlar los derechos de uso, independientemente de la ubicación del archivo. Estas etiquetas pueden impedir la impresión, la descarga o hacer que el documento caduque automáticamente. Requieren licenciamiento avanzado.
