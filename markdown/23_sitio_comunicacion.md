El Sitio de Comunicación, junto con el Sitio de Grupo (que es la base de Teams), constituye el núcleo de la arquitectura moderna de SharePoint.

### 1. Propósito Central y Orientación

El rol principal de un Sitio de Comunicación es la difusión de información, marcando una clara distinción con los sitios de colaboración:

1.  **Comunicación Uno para Muchos (One-to-Many):** El Sitio de Comunicación está enfocado en la difusión masiva de información. Su diseño está pensado para que un grupo pequeño de personas administre y edite el contenido, mientras que el resto de la organización lo visualiza o consume.
2.  **Uso Principal:** Estos sitios son la base ideal para crear la **intranet corporativa** de una organización, incluyendo la publicación de noticias, manuales, catálogos e información general.
3.  **Utilidad:** Para que una intranet basada en Sitios de Comunicación sea exitosa, debe ser útil, proporcionando contenido relevante como noticias de cohesión corporativa o enlaces directos a procesos internos (como solicitudes de vacaciones), garantizando así su adopción por parte de los empleados.

### 2. Arquitectura y Diferencias Clave

En el modelo moderno de SharePoint, la arquitectura es plana, lo que significa que no existe la jerarquía rígida de sitios y subsitios que caracterizaba al SharePoint clásico.

El Sitio de Comunicación se distingue del Sitio de Colaboración (Team Site) en un aspecto fundamental:

- **Independencia del Grupo de Microsoft 365:** El Sitio de Comunicación **no** lleva asociado un Grupo de Microsoft 365. Esta independencia simplifica su gestión, permitiendo que cada sitio sea una "isla independiente" que puede gestionar su propio idioma, cuota de espacio y políticas de compartición externa.
- **Flexibilidad:** Gracias a esta arquitectura plana, la estructura de la intranet puede modificarse con facilidad (como cambiar enlaces o eliminar sitios), ya que no hay dependencias de herencia de permisos que se rompan.

### 3. Modelo de Permisos Simplificado

El modelo de permisos de un Sitio de Comunicación refleja su orientación al consumo de información, siendo típicamente más simple que el modelo granular del SharePoint clásico.

Aunque se puede acceder a la configuración de permisos avanzados (que muestra la interfaz antigua del SharePoint clásico), la práctica recomendada es utilizar el modelo simplificado, que clasifica a los usuarios en tres roles:

| Rol                       | Capacidad                                                        | Propósito                                                  |
| :------------------------ | :--------------------------------------------------------------- | :--------------------------------------------------------- |
| **Propietarios (Owners)** | Control total.                                                   | Responsables de la administración completa del sitio.      |
| **Miembros (Members)**    | Capacidad de modificar y editar el contenido (control limitado). | El equipo de comunicación o editores del departamento.     |
| **Visitantes (Visitors)** | Solo visualización (solo lectura).                               | La audiencia de la intranet (el resto de la organización). |

En un Sitio de Comunicación, es totalmente aceptable y, de hecho, el uso previsto, que los visitantes tengan permisos de solo lectura para acceder a archivos y contenido, sin modificar la estructura o los datos del repositorio.

### 4. Características para Intranets y Personalización

El Sitio de Comunicación está diseñado para ser visualmente atractivo y altamente personalizable:

#### A. Estructura Visual y Navegación

Aunque la arquitectura subyacente es plana, la organización utiliza herramientas visuales para crear una estructura jerárquica para el usuario:

- **Sitio Central (Hub Site):** Se designa un sitio como "Centro" (Hub), y los sitios relacionados se **asocian** a él. Esta asociación es puramente visual, haciendo que los sitios hereden un **menú común de navegación transversal** y un **esquema de colores** compartido, lo que facilita la navegación y otorga una identidad gráfica consistente.
- **Landing Page:** Se recomienda establecer un sitio principal (_Home Site_ o _Landing Page_) que sea el punto de entrada a la intranet, y se puede configurar un sitio específico para que sea la raíz de toda la estructura.
- **Diseño Moderno:** Los sitios de comunicación son **responsivos**, adaptándose correctamente al dispositivo con el que se visualizan (móviles, tabletas).

#### B. Componentes y Contenido

- **Plantillas y Web Parts:** La edición es modular, usando bloques predefinidos (Web Parts). Microsoft pone a disposición de las organizaciones ejemplos de diseño (como los que se encuentran en el Lookbook de Microsoft) que se pueden utilizar para crear sitios personalizados.
- **Identificación de Audiencias (Audience Targeting):** Esta es una funcionalidad clave. Permite que el contenido del sitio (como noticias, enlaces rápidos o elementos de menú) se muestre de forma personalizada según el grupo de Azure AD al que pertenece el usuario. Esto evita la necesidad de crear múltiples sitios paralelos para segmentar la información. Por ejemplo, se puede mostrar una opción de menú solo a los directivos.

#### C. Integración con Teams

La forma más moderna de consumir la intranet es directamente desde Microsoft Teams. Si bien la intranet se construye en SharePoint, su menú de navegación y contenido puede activarse y visualizarse dentro de la interfaz de Teams a través de la funcionalidad de _Home Site_ (que requiere activación por PowerShell). Esto asegura que la intranet se convierta en una herramienta central accesible desde el entorno de colaboración diario.
