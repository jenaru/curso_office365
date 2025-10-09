El Sitio de Colaboración es la piedra angular de la colaboración en Microsoft 365, definido por su propósito y por su arquitectura plana y dependiente del Grupo de Microsoft 365.

---

### 1. Definición y Propósito del Sitio de Colaboración

Un Sitio de Colaboración es una plantilla de sitio de SharePoint Online diseñada específicamente para el trabajo en equipo, proyectos o departamentos, donde la expectativa principal es la **participación activa y la edición de contenido por parte de todos los miembros**.

A diferencia del Sitio de Comunicación (_Communication Site_), que está orientado a la difusión de información de "uno para muchos" (donde la mayoría de los usuarios son visitantes de solo lectura), el Sitio de Colaboración está pensado para que **todos los usuarios trabajen al mismo nivel**.

### 2. Arquitectura: La Base del Ecosistema Moderno

La comprensión del Sitio de Colaboración es inseparable de la arquitectura moderna de Microsoft 365:

#### A. La Colección de Sitios Convertida en "Isla"

En el modelo de SharePoint moderno, la arquitectura jerárquica de sitios y subsitios del modelo clásico se elimina. El concepto de la antigua "colección de sitios" ha sido renombrado y simplificado: cada Sitio de Colaboración se comporta como un **ente independiente**, o una "isla".

Esta independencia implica que cada sitio gestiona de manera autónoma su cuota de espacio, su idioma y sus políticas de compartición externa, sin depender de la herencia de permisos de un sitio superior.

#### B. El Sitio de Colaboración es un Grupo de Microsoft 365

El objeto fundamental que da vida al Sitio de Colaboración moderno es el **Grupo de Office 365**. Cuando se crea un Sitio de Colaboración (Sitio de Grupo), automáticamente se le asocia un Grupo de M365. Este grupo actúa como un sistema de gestión de identidad y membresía que proporciona varios servicios unificados:

- **Repositorio de Ficheros (SharePoint):** El sitio de SharePoint en sí mismo, donde residen los documentos.
- **Buzón Compartido (Exchange):** Un buzón de correo centralizado para el equipo.
- **Calendario Compartido (Exchange):** Un calendario accesible para todos los miembros.
- **OneNote Compartido:** Un bloc de notas para el equipo.

#### C. Teams como la Capa Superior

La mayoría de las organizaciones no consumen el Sitio de Colaboración directamente desde el interfaz web de SharePoint, sino a través de **Microsoft Teams**.

- **Teams es la interfaz preferida:** Teams se construye como una capa adicional sobre el Grupo de M365 subyacente.
- **Funcionalidades añadidas:** Teams agrega funcionalidades clave que no están disponibles directamente en SharePoint, como el chat persistente, las videollamadas, y la integración sencilla de aplicaciones como Planner, Listas, Wikis o pizarras.
- **Mismo contenido, diferente vista:** Es fundamental entender que la información del Team **no está sincronizada** con SharePoint; es la _misma información_ vista a través de una interfaz diferente. Por ejemplo, los canales de Teams se reflejan como carpetas dentro del sitio de SharePoint subyacente.

### 3. Modelo de Permisos y Compartimentación

La característica más definitoria del Sitio de Colaboración moderno es su filosofía de permisos simplificada.

- **"O estoy dentro o estoy fuera":** El enfoque moderno elimina la necesidad de permisos granulares y detallados (como permisos NTFS o los de "editor", "revisor" del SharePoint clásico). Si eres miembro del Grupo de M365/Team, tienes control completo sobre el contenido.
- **Consecuencias de la Granularidad:** Intentar aplicar permisos detallados manualmente en el sitio de SharePoint subyacente a un Team no es la forma correcta de trabajar según Microsoft, ya que la interfaz de Teams está diseñada bajo el presupuesto de que los miembros tienen acceso completo.
- **Aislamiento:** Si una organización necesita aislar información confidencial para un subconjunto de usuarios, la práctica correcta no es modificar los permisos de carpetas o archivos dentro del sitio, sino crear un **nuevo Team o contenedor separado** para esa información.

### 4. Gestión de Archivos y Buenas Prácticas

Aunque se utiliza principalmente para ficheros, los documentos en SharePoint se almacenan internamente como **listas**.

#### Recomendaciones de Acceso:

- **Trabajo en la Nube:** La práctica recomendada es trabajar directamente en la nube, accediendo a los archivos desde la interfaz de Teams o SharePoint.
- **Evitar la Sincronización Local:** Existe la opción de "Sincronizar" el repositorio de SharePoint/Teams con el disco duro local (a través de OneDrive), pero los expertos lo desaconsejan. La sincronización masiva aumenta la probabilidad de errores, de elementos duplicados, y puede interrumpir la colaboración en tiempo real, especialmente cuando hay muchos usuarios involucrados.

### 5. Gobernanza del Sitio de Colaboración

La creación descontrolada de Sitios de Colaboración (Teams) puede llevar a problemas de nomenclatura y gestión.

- **Limitación de Creación:** Se recomienda limitar quién puede crear Teams o Sitios de Grupo.
- **Delegación de Propiedad:** Se suele implementar un proceso donde el administrador crea el contenedor, pero asigna la responsabilidad de la gestión interna, la membresía, y el cumplimiento de las normas al **Propietario del Team**.
- **Nomenclatura:** Se pueden aplicar Directivas de Nombres para garantizar que los Grupos sigan una nomenclatura específica (aunque estas suelen requerir licencias Azure AD P1).
