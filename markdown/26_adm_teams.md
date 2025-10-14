### La Administración de Teams: Un Enfoque Experto y Didáctico

Teams es una de las tres herramientas principales o cargas de trabajo fundamentales de Microsoft 365, junto con Exchange Online (correo electrónico) y SharePoint (repositorio de archivos, documentación y comunicación). Teams actúa como un aglutinador de información y capacidad de comunicación, y su administración se lleva a cabo principalmente a través del **Centro de Administración de Teams**.

#### 1. Arquitectura y Fundamentos de Teams

Para entender la administración de Teams, es fundamental comprender su estructura subyacente:

1.  **Teams como capa visual:** Teams no es una entidad independiente, sino una capa adicional sobre otros servicios.
2.  **Grupos de Microsoft 365 y SharePoint:** Cada vez que se crea un Team, automáticamente se crea por debajo un **Grupo de Office 365** (anteriormente llamados Grupos Modernos o Unificados). Este grupo, a su vez, es un **Sitio de SharePoint Online**.
3.  **Administración Compartida:** Debido a esta dualidad, hay configuraciones que se gestionan directamente desde el Centro de Administración de Teams y otras que deben gestionarse desde el Centro de Administración de SharePoint (especialmente aquellas relacionadas con la capacidad de compartir con usuarios externos o la estructura de archivos).
4.  **Sitios Ocultos:** Si bien cada Team tiene un Grupo y un Sitio de SharePoint subyacentes, el Grupo suele permanecer oculto en la interfaz tradicional de Grupos (Outlook/OWA) si ha sido creado como un Team. Esto se debe a que la funcionalidad de Teams es superior a la interfaz de Grupos antigua. Esta propiedad de ocultamiento puede modificarse mediante PowerShell.

**Nota Didáctica:** El objeto que gestiona la membresía y el acceso a un Team es el Grupo de Microsoft 365 que se encuentra debajo.

#### 2. Gobierno y Gestión de Equipos

Una de las tareas de administración más importantes es el **Gobierno** (Governance) de la plataforma, especialmente para evitar la proliferación descontrolada de Teams, que puede llevar a la confusión (como el ejemplo del Team llamado "Manoli, Pepi, Antonio y yo").

- **Limitación de Creación:** La práctica recomendada es limitar quién puede crear Teams. Esto se logra limitando quién puede crear los Grupos de Microsoft 365.
- **Roles de Propietario:** Una vez creado el Team (normalmente mediante un proceso formal, como un formulario), se asigna un _Propietario_ que se encarga de la membresía y de ajustar configuraciones internas del Team, liberando así al administrador general.

Desde el Centro de Administración de Teams, el administrador puede ver un listado de todos los equipos activos, modificar sus propiedades (como cambiar un equipo de público a privado), y gestionar miembros y canales sin necesidad de ser un propietario directo del Team. También es posible sacar informes detallados sobre el uso que se le da a cada Team (última actividad, tráfico de archivos, etc.) para ajustar licencias o tomar decisiones de limpieza.

#### 3. Configuración por Directivas (Policies)

La configuración en Teams se basa en **Directivas**, lo cual permite una gestión granular y selectiva. Por defecto, existe una **Directiva Global (Estándar)** que se aplica a todos los usuarios, pero se pueden crear directivas específicas para conjuntos de usuarios (como comerciales o directivos) y asignarlas individualmente o por grupos.

Las Directivas abarcan numerosos aspectos de la experiencia de Teams:

- **Paquetes de Directivas (Policy Packages):** Para organizaciones complejas, los paquetes de directivas simplifican la administración al agrupar múltiples directivas (de llamadas, mensajería, reuniones, etc.) y aplicarlas conjuntamente a un grupo (ej. "Comercial").
- **Directivas de Equipo (Team Policies):** Controlan funcionalidades básicas dentro de un Team, como si los usuarios pueden o no crear canales privados.
- **Directivas de Mensajería:** Definen qué se permite en los chats. Esto incluye la activación o desactivación de funciones como el uso de GIFs, memes o si los usuarios pueden editar los mensajes enviados. También controlan el uso de **etiquetas** (_tags_), que permiten notificar rápidamente a un subconjunto específico de personas dentro de un Team numeroso.
- **Directivas de Reunión:** Gobiernan la experiencia de videoconferencia, incluyendo:
  - La posibilidad de unirse de forma anónima a una reunión.
  - Opciones de audio y video.
  - Restricciones sobre quién puede presentar o compartir pantalla.
  - La configuración de la caducidad automática de las grabaciones de reuniones (ej. a los 120 días) para gestionar el almacenamiento.
  - Si se permite el botón "Reunirse ahora" en los canales.
- **Directivas de Eventos en Directo:** Controlan los parámetros de los eventos en vivo (_Live Events_), que son presentaciones unidireccionales (como un webinar o una keynote) para grandes audiencias, incluyendo la posibilidad de apertura al público externo (que requiere tiempo de activación, un día aproximadamente).
- **Directivas de Actualización:** Permiten controlar la versión de Teams que reciben los usuarios, de modo que los usuarios más avanzados o técnicos puedan recibir las características de vista previa más rápidamente, mientras que otros usuarios pueden esperar a versiones más estables.

#### 4. Aplicaciones y Personalización de Interfaz

La administración de aplicaciones es otro componente clave, dado que Teams permite integrar miles de aplicaciones de terceros (como Adobe Acrobat o Trello) y aplicaciones de Microsoft.

- **Configuración Global:** Se pueden establecer reglas para toda la organización, como prohibir el uso de aplicaciones de terceros o aplicaciones personalizadas.
- **Configuración por Aplicación:** El administrador puede decidir, aplicación por aplicación, cuáles se permiten o se bloquean.
- **Personalización del Interfaz:** Mediante las **Directivas de Configuración**, el administrador puede definir qué aplicaciones aparecen en el panel izquierdo de Teams y en qué orden (solo caben seis aplicaciones en ese panel). Esto es útil para simplificar el entorno o destacar herramientas corporativas esenciales, como una aplicación de gestión de turnos.

#### 5. Gestión de Acceso Externo y Colaboración

- **Acceso de Invitados (Guests):** Se refiere a la configuración de lo que puede hacer una persona externa (invitada) que ha sido agregada a un Team. Por defecto, los invitados tienen capacidad de lectura y escritura, no son actores de solo lectura. Las directivas controlan si se permite esta funcionalidad y bajo qué parámetros.
- **Acceso Externo (External Access):** Se refiere a la capacidad de los usuarios de comunicarse (chatear) con usuarios que se encuentran en otras organizaciones de Teams o que aún usan Skype. Se puede limitar este acceso solo a dominios específicos.

#### 6. Administración Adicional y Consideraciones

- **Telefonía y Voz (Voice):** Gran parte del Centro de Administración de Teams está dedicado a la funcionalidad de voz sobre IP (VoIP), ya que Teams puede actuar como una centralita completa. Opciones como el correo de voz, la directiva de llamadas o los planes de mercado requieren la compra de licencias y complementos adicionales. Si estas funcionalidades no se usan, estas opciones pueden ignorarse.
- **Correo Electrónico a Canales:** Es posible asociar una dirección de correo electrónico a un canal específico, permitiendo que los correos enviados a esa dirección aparezcan como publicaciones dentro del canal (con los archivos adjuntos guardados en una carpeta especial).
- **PowerShell:** Aunque la interfaz web es robusta, hay tareas avanzadas (como algunas configuraciones complejas de reuniones o la gestión masiva de datos) que solo se pueden realizar mediante comandos de PowerShell. Existe un módulo de administración específico de Teams para PowerShell.
