# Arquitectura de Contenedores en Microsoft 365: Una Guía para el Diseño Efectivo

### 1. La Filosofía del Contenedor Moderno: De la Jerarquía a la Independencia

Históricamente, el SharePoint Clásico (que data de 2003 y versiones posteriores) se basaba en una arquitectura jerárquica de sitios y subsitios, donde los permisos se heredaban de arriba abajo, similar a los permisos NTFS de un servidor de archivos.

En el **modelo moderno** de SharePoint Online, esta estructura jerárquica se elimina. Los contenedores ya no dependen unos de otros, sino que cada sitio se convierte en una **"isla independiente"** que puede gestionar su propio idioma, cuota de espacio, y política de compartición externa.

Esta arquitectura moderna permite mayor flexibilidad y evita la parálisis de diseño que ocurría antes, ya que la estructura se puede cambiar a voluntad sin romper la herencia de permisos.

**La clave está en los Sitios Centrales (Hub Sites):** Aunque internamente no hay jerarquía, se puede crear una estructura visual (navegación y aspecto) utilizando menús y Sites Centrales. Esto permite que sitios relacionados (como diferentes departamentos) compartan un menú común y un esquema de colores, aunque sigan siendo entidades independientes.

### 2. Tipos de Contenedores y su Relación

Los contenedores en Microsoft 365 son interdependientes, y una capa se construye sobre otra.

| Contenedor Principal             | Propósito Primario                                                                       | Base Subyacente                                                                             |
| :------------------------------- | :--------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------ |
| **Microsoft Teams**              | Colaboración y comunicación diaria (chats, llamadas, apps).                              | Es una capa sobre un Grupo de M365, que a su vez es un Sitio de Grupo de SharePoint Online. |
| **Grupos de Microsoft 365**      | Eje de colaboración, proporciona calendario, buzón compartido y repositorio de ficheros. | Sitio de Grupo de SharePoint Online.                                                        |
| **Sitios de Grupo (Team Sites)** | Colaboración interna, orientado a que todos los miembros modifiquen y editen.            | Colección de Sitios (el concepto de sitio moderno).                                         |
| **Sitios de Comunicación**       | Comunicación "uno para muchos" (intranets, noticias, manuales).                          | No llevan un Grupo de M365 asociado.                                                        |

El objeto fundamental para la colaboración es el **Grupo de Office 365**, el cual automáticamente crea un buzón compartido, un calendario, un OneNote y un repositorio de archivos que es, en realidad, un sitio de SharePoint Online. Teams añade una capa de comunicación a este Grupo.

### 3. Estrategia de Diseño y Permisos (El Criterio de Compartimentación)

El paso más importante al diseñar la estructura de contenedores es redefinir los permisos y hablar con los dueños de la información.

#### A. Permisos Basados en el Contenedor

Las organizaciones deben abandonar los permisos muy granulares (como "Editor," "Revisor," o permisos NTFS detallados) que existían en el modelo clásico.

En el modelo moderno, la filosofía es simple: **o estás dentro del contenedor, o estás fuera**. Si eres miembro de un Grupo de M365/Team, se espera que tengas control total sobre el contenido.

Esto lleva a una compartimentación de la información basada en la necesidad de aislamiento de permisos. Por ejemplo, lo que antes era una estructura jerárquica de carpetas se transforma en múltiples contenedores (sitios/Teams), y un usuario es miembro solo de los que necesita.

#### B. Uso de Contenedores según la Finalidad

1.  **Contenedores de Colaboración (Teams/Sitios de Grupo):**

    - Se usan para el trabajo diario, proyectos o departamentos, donde la expectativa es que todos los miembros editen y modifiquen.
    - Si se requiere aislar un conjunto de datos dentro de un Team (por ejemplo, información confidencial para una subsección del equipo), Microsoft permite crear **Canales Privados**. Sin embargo, esta práctica crea, de hecho, un sitio de SharePoint completamente distinto y separado para esa información, lo que demuestra la necesidad de aislamiento a nivel de contenedor, no a nivel de carpeta.

2.  **Contenedores de Comunicación (Sitios de Comunicación):**
    - Se usan para publicar información de "uno a muchos", como intranets corporativas, noticias o manuales.
    - Estos sitios están pensados para ser personalizados visualmente (mediante plantillas como las del Lookbook de Microsoft) y solo requieren permisos detallados para los editores/propietarios, mientras que la mayoría de los usuarios son "visitantes" (solo lectura).
    - Se puede utilizar la **identificación de audiencias** para segmentar el contenido (menús, noticias, etc.) según los grupos a los que pertenezca el usuario, sin necesidad de crear múltiples sitios.

#### C. Canales de Teams vs. Carpetas

Dentro de un Team, los canales se reflejan como carpetas en el SharePoint subyacente. Los canales no se usan para compartimentar permisos (salvo el canal privado), sino para organizar temas, documentos y aplicaciones extra (como listas, Planner o pizarras) relacionadas con ese tema, potenciando las capacidades nativas de M365.

### 4. Gobernanza y Creación de Contenedores

Para evitar la proliferación descontrolada de Teams y Sitios con nombres inadecuados (como "Manoli, Pepi, Antonio y yo"), las organizaciones establecen políticas de gobernanza.

1.  **Restricción de Creación:** La práctica recomendada es **limitar quién puede crear un Team o un sitio** para que los usuarios normales no puedan hacerlo a voluntad.
2.  **Flujo de Aprobación:** Para solicitar un nuevo Team, se suele implementar un formulario de solicitud que pregunta: quién es el dueño/propietario, el departamento, la finalidad del Team y si se requerirá acceso externo.
3.  **Gestión de Propiedad:** Una vez creado el Team por el administrador, se asigna al solicitante como **Propietario del Team**. El propietario se hace responsable de la membresía y gestión interna del Team, liberando al administrador de la carga de añadir o quitar usuarios constantemente.
4.  **Nomenclatura y Políticas:** Se pueden aplicar **Directivas de Nombres** (que requieren licencia P1) para asegurar que los Grupos sigan una nomenclatura específica (como prefijos de departamento) y evitar nombres poco serios o confusos.

En resumen, la estrategia moderna se centra en crear un sitio o Team por cada necesidad de aislamiento de permisos o colaboración específica, aprovechando la flexibilidad de la arquitectura plana y las herramientas de gestión (como el Panel de Administración de SharePoint o Intune) para controlar el acceso y la gobernanza.
