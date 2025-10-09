# Uso Compartido en Exchange Online

### Ubicación y Alcance

La configuración de "Uso Compartido" (uso compartido de Exchange) se encuentra dentro de la sección de **Organización** del Centro de Administración de Exchange Online.

Es fundamental notar que, al hablar de "uso compartido" en este contexto, **no se refiere al correo electrónico**, sino exclusivamente a la funcionalidad del **calendario**.

### 1. Uso Compartido Federado (Compartición a Nivel de Organización)

El concepto principal en esta sección es el **uso compartido federado** (o uso compartido de Exchange).

Esta funcionalidad permite a su organización:

1.  **Intercambiar información de calendario:** Permite que su empresa pueda ver la disponibilidad de otros usuarios que se encuentran en organizaciones externas, siempre y cuando estas estén configuradas para la federación.
2.  **Escenarios de aplicación:** Esto es útil cuando su empresa necesita coordinarse con un socio, o si forman parte de un grupo de empresas y necesitan ver la disponibilidad de otros usuarios que están en otra de las empresas del grupo.
3.  **Ambientes Híbridos:** También se utiliza en entornos de Exchange híbridos, donde parte de la infraestructura de correo está localmente (on-premise) y parte está en Exchange Online.

#### Configuración de la Federación

Para habilitar esta funcionalidad, se pueden agregar otras organizaciones con las que se desea federar (intercambiar información de disponibilidad).

Aunque a menudo es un proceso que requiere cierta complejidad técnica, en algunos casos se llega a configurar incluso mediante **PowerShell**. La política por defecto, sin embargo, ya permite a todos los usuarios compartir su calendario con gente externa.

### 2. Distinción de la Compartición Individual

Es importante diferenciar la configuración a nivel de organización de las opciones de uso compartido a nivel de usuario:

| Tipo de Compartición          | Nivel de Aplicación              | Control                                                                           | Datos Compartidos por Defecto                   |
| :---------------------------- | :------------------------------- | :-------------------------------------------------------------------------------- | :---------------------------------------------- |
| **Uso Compartido Federado**   | Colectivo (Toda la organización) | Se gestiona desde el panel de administración de Exchange.                         | La **disponibilidad** (si están ocupados o no). |
| **Uso Compartido Individual** | Individual (Cada usuario)        | Se gestiona directamente por el usuario desde Outlook o Outlook Web Access (OWA). | La **disponibilidad** (si están ocupados o no). |

Por defecto, todos los usuarios de Exchange ya tienen habilitada la posibilidad de compartir su calendario con todos los demás. Lo que comparten es solo el estado de ocupado o no, aunque esta configuración se puede cambiar para incluir más detalles. Esta compartición individual la gestiona el propio usuario y se realiza desde el calendario en Outlook o OWA.
