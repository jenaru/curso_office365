### 1. Marco General de las Directivas de Correo

Todas las configuraciones de seguridad en Microsoft 365, incluyendo la protección del correo, se gestionan mediante **Directivas** (Policies). Estas directivas actúan sobre el correo **mientras está en tránsito** dentro de la plataforma Microsoft 365, antes de que llegue al buzón del usuario.

#### Mecanismo de las Directivas

1.  **Directiva Estándar (Global):** Por defecto, siempre existe una directiva estándar o global que se aplica a toda la organización.
2.  **Directivas Personalizadas:** El administrador puede crear nuevas directivas específicas (por ejemplo, "Directiva B" o "Directiva VIP") y asignarlas a usuarios o grupos concretos. Esto permite configuraciones de seguridad más estrictas para usuarios de alto perfil sin afectar al resto de la organización.
3.  **Análisis de Configuración:** Herramientas como el _Configuration Analyzer_ permiten revisar las políticas existentes y ofrecen recomendaciones activas para mejorar la postura de seguridad, a menudo sugiriendo que se reduzca el número de entradas de permitido a cero, lo que aumenta la protección.

### 2. Tipos Fundamentales de Directivas de Amenazas

Existen tres tipos principales de directivas que gestionan el flujo de correo: Antiphishing, Antispam y Antimalware.

#### A. Directiva Antiphishing (Antisuplantación de Identidad)

Se enfoca en proteger a los usuarios de correos que buscan suplantar la identidad de un remitente de confianza (interna o externa), siendo una defensa clave contra el compromiso de correo.

- **Configuración:** Permite activar un motor de Inteligencia Artificial (IA) para la detección automática de suplantación.
- **Usuarios Protegidos:** Se pueden especificar listas de usuarios o dominios que requieren una vigilancia y protección más exhaustiva debido a su alto riesgo de ser objetivo de suplantación.
- **Acciones de Protección:** El administrador define qué hacer con los mensajes detectados como suplantación: enviarlos a la **Cuarentena** o directamente a la carpeta de **Correo no Deseado** del usuario.
- **Indicadores de Seguridad:** Se pueden habilitar avisos visuales para el usuario, como mostrar un signo de interrogación o el texto "vía" cuando se detecte que el correo se envió usando una dirección distinta a la que afirma ser el remitente.

#### B. Directiva Antimalware (Antivirus)

Esta directiva gestiona el bloqueo de archivos maliciosos y virus.

- **Regla General:** Con el _malware_ **"no se negocia"**. El comportamiento por defecto es eliminar o poner en cuarentena el adjunto malicioso.
- **Notificaciones:** Aunque el archivo sea eliminado, se puede configurar para que el administrador sea notificado de que un ataque de _malware_ se intentó.
- **Filtro de Adjuntos Comunes (Common Attachment Filter):** Esta es una configuración crítica. Permite bloquear tipos de archivos que, aunque no contengan un virus conocido, son frecuentemente utilizados en ataques de ingeniería social o _ransomware_. Ejemplos de extensiones que se recomienda bloquear incluyen:
  - Archivos de _script_ (.CMD, .BAT).
  - Accesos directos de Windows (.LNK).
  - Imágenes de disco (.ISO), utilizadas en ataques donde contienen archivos LNK para iniciar una intrusión.
  - Macros de Office.

#### C. Directiva Antispam (Anticorreo Masivo)

Gestiona el correo no deseado y los envíos masivos (_bulk_ mail).

- **Umbrales de Correo Masivo:** Permite subir o bajar el umbral de puntuación para determinar qué tan estricto debe ser el filtro con el correo masivo.
- **Chequeos de Contenido:** El sistema puntúa negativamente a los correos que contengan elementos sospechosos, como URL que usan direcciones IP en lugar de nombres de dominio, o que provienen de dominios asociados a prácticas maliciosas.
- **Filtros Geográficos y Lingüísticos:** Es posible aumentar la puntuación de _spam_ o incluso bloquear correos que provengan de países o que estén escritos en idiomas con los que la organización no trabaja habitualmente.

### 3. Directivas de Cuarentena (Policies on Quarantine)

Una funcionalidad moderna que permite al administrador definir cómo se gestionan los correos retenidos. Esta es crucial para controlar el acceso del usuario a los mensajes que podrían ser peligrosos.

- **Acceso Limitado:** Se pueden crear políticas de cuarentena que otorgan **acceso limitado** a los usuarios estándar ("usuario patata"). Esto les permite previsualizar el mensaje y solicitar su liberación, pero **no les permite liberar el mensaje por sí mismos**, evitando que accidentalmente liberen contenido malicioso.
- **Vista Previa y Borrado:** Los usuarios, dependiendo de la política, pueden previsualizar los mensajes, borrarlos de la cuarentena, o bloquear al emisor.
- **Notificaciones:** Se puede configurar la frecuencia con la que se envían notificaciones por correo a los usuarios informándoles sobre el contenido de su cuarentena (por ejemplo, una vez al día).

### 4. Directivas de Autenticación de Correo (SPF, DKIM, DMARC)

Aunque estos protocolos se configuran en el DNS, Microsoft Defender los utiliza para reforzar sus directivas de seguridad.

- **SPF (Sender Protection Framework):** El sistema más básico. Verifica que la dirección IP de origen del correo esté autorizada para enviar en nombre del dominio, buscando un registro TXT en el DNS público del remitente.
- **DKIM (DomainKeys Identified Mail):** Aporta autenticación criptográfica. Firma digitalmente el correo para que el receptor pueda verificar que el mensaje no ha sido manipulado en tránsito y que el remitente es legítimo. La clave pública se publica en el DNS.
- **DMARC (Domain-based Message Authentication, Reporting, and Conformance):** Este protocolo unifica SPF y DKIM y permite al dominio emisor (por ejemplo, el suyo) indicar a los dominios receptores **qué acción deben tomar** si un correo falla las comprobaciones (ejemplo: **Reject**, **Quarantine**, o **None**).
  - _Reportes:_ DMARC es también utilizado para solicitar informes detallados (RUA/RUF) de vuelta, que le permiten saber cómo su correo se ve desde la perspectiva de los servidores externos.

> **Nota de Experto:** Es fundamental, pero riesgoso, configurar políticas que rechacen correos basándose en fallos de SPF o DMARC, ya que muchas organizaciones no tienen estos registros configurados correctamente, lo que podría llevar al bloqueo de correos legítimos de clientes o proveedores. Las políticas de Defender para Office 365 permiten ajustar qué tan estrictos somos con estos fallos.
