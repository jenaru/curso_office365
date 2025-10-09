# Resumen Moderno de SharePoint en Microsoft 365

### I. El Rol Central de SharePoint en Microsoft 365

SharePoint Online es una de las **tres principales cargas de trabajo** o herramientas troncales de Office 365, junto con Exchange Online (correo) y Teams.

Su función principal es servir como **repositorio para archivos, documentación y comunicación**.

**Relación con OneDrive y Teams:**

1.  **OneDrive:** A pesar de tener su propia interfaz, OneDrive se apoya completamente en SharePoint. De hecho, al ir a la URL de OneDrive, en realidad se está accediendo a SharePoint.
2.  **Teams:** Teams actúa como una capa adicional que se construye sobre SharePoint. La colaboración en Teams utiliza un sitio de SharePoint por debajo para almacenar sus archivos. Es crucial entender que la información de Teams no se _sincroniza_ con SharePoint; **es la misma información** vista desde una interfaz diferente.

### II. La Naturaleza Fundamental de SharePoint

Históricamente, SharePoint (que data de 2003) nació para resolver las **limitaciones de las carpetas compartidas** tradicionales, donde el acceso al archivo quedaba bloqueado para otros usuarios si alguien estaba trabajando en él.

El concepto fundamental de SharePoint, aunque pueda parecer centrado en archivos, es que **todo son listas**. SharePoint es, en realidad, un conjunto de tablas de una base de datos SQL. Incluso los archivos que usted sube son tratados como elementos dentro de una lista.

### III. La Evolución Arquitectónica: SharePoint Clásico vs. Moderno

Para entender la administración actual, debemos diferenciar los dos modelos que coexisten, aunque Microsoft promueve fuertemente el más reciente:

#### 1. Modelo Clásico (Arquitectura Jerárquica)

Este modelo, anterior aproximadamente a 2015, se utilizaba para construir grandes **intranets corporativas**.

- **Estructura:** Estaba basado en una **jerarquía estricta** de sitios y subsitios, muy similar a la estructura de carpetas de un servidor de archivos.
- **Permisos:** Heredaban permisos (la herencia era un problema) y los permisos eran muy detallados y granulares (editor, revisor, etc.).
- **Diseño:** Los proyectos de implantación eran largos y requerían programación avanzada con herramientas como SharePoint Designer y código CSS para la funcionalidad y el aspecto visual.
- **Rigidez:** La estructura definida al inicio no podía cambiarse fácilmente. Mover un sitio o modificar su diseño era muy complicado.

#### 2. Modelo Moderno (Arquitectura Plana y Flexible)

Microsoft desarrolló este modelo debido a que el clásico era demasiado complejo y la gente prefería seguir enviando archivos adjuntos por correo en lugar de colaborar. Este es el modelo que debemos usar:

- **Sitios Independientes:** Los sitios no tienen jerarquía estricta, operan como **islas independientes**.
- **Navegación Lógica (No Jerárquica):** La ilusión de que un sitio "cuelga" de otro (la jerarquía visual) se consigue simplemente **editando los menús de navegación** para vincularlos. Si cambia de opinión, simplemente cambia la URL en el menú.
- **Permisos Simplificados:** La filosofía es **dentro o fuera**. Si un usuario es miembro del sitio, tiene acceso; si no lo es, no lo tiene. Esta simplificación evita los problemas de romper permisos a nivel granular, lo cual causaba errores en el capa de Teams.
- **Tipos de Sitio Modernos:** Solo se recomiendan dos plantillas principales:
  - **Sitio de Colaboración:** Orientado a que todos los miembros editen y modifiquen contenido al mismo nivel. Este es el tipo de sitio que se crea automáticamente al formar un **Grupo de Office 365** o un **Team**.
  - **Sitio de Comunicación:** Orientado a la difusión (_one-to-many_), donde un pequeño grupo de personas edita contenido (noticias, catálogos, enlaces) y el resto de la organización solo lo visualiza. Es ideal para Intranets.

### IV. La Doctrina: Colaboración a Través de Teams

La visión de Microsoft, denominada **Modern Workplace**, indica que se debe trabajar a favor de esta doctrina, ya que cualquier configuración que se aparte de ella tiende a volverse obsoleta o problemática.

En la práctica, esto significa que:

1.  **Uso de Contenedores:** Se deben evitar las estructuras detalladas de permisos de carpetas (NTFS). Se recomienda crear **contenedores** separados (sitios de SharePoint o Teams) basados en la necesidad de aislamiento de permisos. Si un grupo de usuarios necesita acceso a un conjunto de información, se les da acceso completo al contenedor; si requieren permisos diferentes para otro conjunto, se crea un segundo contenedor.
2.  **Teams para el Trabajo Diario:** Aunque SharePoint aloja los archivos, la forma más recomendada para que los usuarios interactúen con esos archivos y colaboren es a través de **Teams**. Esto se debe a que Teams ofrece un entorno más sencillo y unificado, incluyendo chat, planificación y otras aplicaciones, sin exponer la complejidad de la interfaz web de SharePoint.

### V. Administración General (Panel de Administración de SharePoint)

Desde el Centro de Administración de SharePoint, el enfoque es principalmente la gestión de alto nivel y las políticas globales:

- **Sitios Activos:** Permite ver y gestionar todos los sitios creados, su uso de almacenamiento (el límite por defecto es 1 TB más 1 GB por usuario).
- **Directivas (Policies):** Aquí se establecen reglas globales para la compartición externa de SharePoint y OneDrive, como limitar la compartición a ciertos dominios o desactivar la compartición anónima para toda la organización.
- **Personalización a Nivel de Sitio:** Aunque las tareas detalladas de personalización se realizan en la propia interfaz de SharePoint (como editar menús o añadir bloques web), las propiedades administrativas (como la cuota de almacenamiento o si un sitio pertenece a un _Hub Site_ o centro) se manejan desde el centro de administración.

En resumen, la introducción moderna a SharePoint implica una comprensión profunda de que la simplicidad del sistema de permisos (dentro/fuera) y el uso de Teams como interfaz principal son las claves para una colaboración exitosa y mantenible en Microsoft 365.
