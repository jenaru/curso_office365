# Dominios Remotos y Dominios Aceptados en Exchange Online

### Dominios Aceptados (Accepted Domains)

Un Dominio Aceptado define qué dominios de correo electrónico son responsabilidad del entorno de Exchange Online.

**1. Propósito Principal**

El propósito es declarar a Exchange como un responsable potencial de gestionar los buzones o las direcciones de correo para ese dominio. La configuración de estos dominios se realiza en el panel de administración general de Office 365, donde se deben añadir y verificar (por ejemplo, mediante un registro TXT en el DNS público). Una vez verificado, aparece en la configuración de Dominios Aceptados.

**2. Tipos de Dominios Aceptados**

Un dominio aceptado puede configurarse de dos maneras, lo que determina cómo Exchange maneja el correo dirigido a ese dominio:

- **Autoritativo (Authoritative)**:

  - **Función:** Esta es la opción por defecto.
  - **Comportamiento:** Exchange Online es el **único responsable** de gestionar el correo para ese dominio. Si un mensaje llega a Exchange y el destinatario de ese dominio no existe dentro de la organización de Office 365, el correo **se rechaza**.

- **Retransmisión Interna (Non-Authoritative/Relay)**:
  - **Función:** Se utiliza comúnmente en escenarios de **coexistencia o migración**.
  - **Comportamiento:** Exchange intenta encontrar el destinatario internamente (en el buzón de Office 365). Si el destinatario no se encuentra, Exchange **no rechaza** el mensaje, sino que lo envía al registro MX del dominio. De esta manera, el correo es redirigido a **otro sistema de correo externo o local** donde el buzón del destinatario pueda existir.

### 3. Dominios Remotos (Remote Domains)

Los Dominios Remotos no definen qué dominios acepta Exchange, sino que definen la configuración que Exchange aplicará a los **mensajes salientes** (o, en ciertas configuraciones, a los mensajes entrantes) cuando interactúa con sistemas de correo externos.

**1. Propósito Principal**

Se utilizan para configurar el flujo de correo entre Exchange Online y un dominio externo, definiendo cómo deben tratarse los mensajes, especialmente en cuanto a la compartición de información y el formato.

**2. Funcionalidades y Configuración Comunes**

Aunque se encuentran en el Centro de Administración de Exchange (CAE), las configuraciones más importantes de Dominios Remotos están relacionadas con la funcionalidad de calendario y el formato del mensaje:

- **Uso Compartido Federado (Calendario):** En la configuración de uso compartido y organización, se puede **federar** dominios externos para que los usuarios puedan ver la información de disponibilidad de calendario de usuarios en otras organizaciones. Esto es útil si se trabaja frecuentemente con socios o empresas del mismo grupo.
- **Restricciones de Correo:** Históricamente, se usaba para configurar el formato del correo (por ejemplo, forzar el uso de texto enriquecido o formato de texto sin formato) para destinatarios en ese dominio. Sin embargo, en la actualidad, estas opciones predeterminadas suelen ser funcionales y no necesitan cambiarse.
