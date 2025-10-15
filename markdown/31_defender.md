### 1. Nomenclatura y Licenciamiento: Entendiendo los Tiers

Es esencial distinguir las diferentes versiones de Defender, ya que su funcionalidad depende directamente del plan de licenciamiento que posea:

#### A. Defender for Business (Negocios)

Esta es la versión que Microsoft ha incluido recientemente en la licencia **Business Premium** (para organizaciones de hasta 300 usuarios). Esta inclusión ha hecho que la licencia Premium sea altamente valiosa.

- **Capacidades Incluidas:** Defender for Business ofrece una plataforma de seguridad muy avanzada que normalmente sería costosa. Incluye funcionalidades de:
  - **Antivirus y Protección de Próxima Generación:** Un antivirus avanzado.
  - **EDR (Endpoint Detection and Response):** Esta es una función crucial. Un antivirus tradicional se basa en firmas; EDR analiza el comportamiento y correlaciona eventos entre distintos equipos. Permite realizar investigaciones y respuestas automatizadas ante amenazas, incluso si el malware no tiene una firma conocida.
  - **Administración de Vulnerabilidades:** Ayuda a identificar y priorizar los puntos débiles en los dispositivos.
  - **Investigación y Respuesta Automatizada:** Permite seguir una línea de tiempo de lo que ocurrió durante un incidente de seguridad, aislar equipos y aplicar remediaciones automáticas.

#### B. Defender for Endpoint (Enterprise)

Esta es la solución de seguridad para grandes empresas (Enterprise) y está disponible en los planes E5 o como complemento avanzado. Microsoft Defender for Business es, esencialmente, una versión "light" de este producto, aunque incluye características de alto nivel que antes solo estaban en el plan más caro (Plan 2) de Defender for Endpoint.

#### C. Defender for Office 365

Esta parte se centra en la protección del correo electrónico, una vía de entrada común para los ataques cibernéticos. En las licencias **Business Standard**, muchas de las funciones avanzadas de Defender for Office 365 (como el Plan 1) no están disponibles.

---

### 2. Funcionalidades Clave en el Centro de Seguridad

La gestión de Defender se lleva a cabo principalmente en el Centro de Seguridad, ahora parte de **Microsoft Purview** (Cumplimiento).

#### 2.1 Puntuación de Seguridad (Secure Score)

Esta herramienta proporciona una métrica de la postura de seguridad de su entorno de Microsoft 365.

- **Evaluación y Recomendaciones:** Muestra un porcentaje que refleja cuántas de las configuraciones de seguridad recomendadas tiene activas. Si no tiene la **Autenticación Multifactor (MFA)** activada para todos los usuarios, por ejemplo, esto reducirá su puntuación.
- **Acciones Correctivas:** Sugiere acciones específicas para mejorar la seguridad, proporcionando guías sobre cómo implementarlas (aunque a veces las guías pueden llevar a interfaces antiguos o confusos). Incluso le permite marcar un riesgo como "aceptado" si es necesario para un proceso de negocio.

#### 2.2 Protección Avanzada de Correo Electrónico

Defender administra políticas críticas que reducen drásticamente la exposición a amenazas:

- **Vínculos Seguros (Safe Links):** Una directiva que protege contra enlaces maliciosos en correos electrónicos. Cuando un usuario hace clic en un enlace, Safe Links lo redirige y lo prueba en un entorno seguro antes de permitir el acceso, mitigando el riesgo de _phishing_.
- **Análisis de Amenazas (Threat Analytics):** Proporciona información detallada sobre las últimas campañas de ataques cibernéticos (como ransomware o TrickBot). Esta sección alerta si su organización ha sido el objetivo de correos maliciosos asociados a esas campañas. Los informes detallan las metodologías de ataque (acceso inicial, robo de credenciales, movimiento lateral, etc.).

#### 2.3 Administración de Aplicaciones y Dispositivos (Requiere Intune)

Las características de Defender relacionadas con la gestión de dispositivos y aplicaciones dependen de que su licencia incluya **Intune** (como la Business Premium).

- **Inventario y Riesgo de Dispositivos:** Permite visualizar los dispositivos inscritos (PCs, iPads, macOS, Android) y evaluar su nivel de exposición y vulnerabilidad.
- **Defender for Cloud Apps:** Monitorea las autorizaciones que los usuarios otorgan a aplicaciones de terceros (por ejemplo, al conectar Adobe o SAP). Esto es vital, ya que una técnica de ataque común es engañar al usuario para que autorice una "aplicación malware" para acceder y robar información de Office 365.

---

### 3. Defender y las Directivas de Seguridad

Defender trabaja a través de la aplicación de diversas **directivas** (policies) que definen el comportamiento de la seguridad:

- **Directivas de Anti-Phishing y Anti-Spam:** Permiten definir el umbral de agresividad del filtro de correo. La configuración anti-malware, por ejemplo, no se negocia: si detecta malware, se elimina, aunque se puede configurar para notificar. Es posible bloquear adjuntos que representan un riesgo (como archivos .ISO o ejecutables LNK/CMD).
- **Directivas de Cuarentena:** Permiten crear políticas específicas sobre cómo se manejan los correos en cuarentena. Es posible dar acceso limitado a los usuarios para que puedan revisar los mensajes, pero sin darles permiso para liberarlos, evitando que un usuario "torpe" libere inadvertidamente un correo peligroso.
- **Directivas de Cumplimiento:** Aunque la gestión principal de las **Etiquetas de Confidencialidad (Sensitivity Labels)** y **Etiquetas de Retención (Retention Labels)** se realiza en Purview, estas políticas de cumplimiento (que requieren licencia E3 o superior) trabajan de la mano con Defender para asegurar la protección de datos sensibles. Las etiquetas de confidencialidad pueden, por ejemplo, impedir la impresión de documentos o hacer que el acceso caduque después de cierto tiempo.
- **Auditoría (Audit Logs):** Por defecto, la plataforma registra todas las actividades (quién modificó un archivo, quién lo compartió, quién inició sesión), lo cual es crucial para la seguridad. Estas bitácoras se pueden retener hasta por 10 años, según la política de auditoría configurada.
