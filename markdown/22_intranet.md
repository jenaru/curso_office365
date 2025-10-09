### 1. El Paradigma de la Arquitectura Moderna: De la Jerarquía a la Estructura Plana

Para crear una buena intranet en M365, es fundamental comprender y aplicar el modelo de **SharePoint Moderno**, dejando atrás el modelo clásico basado en sitios y subsitios jerárquicos.

1.  **Independencia del Sitio:** En el modelo moderno, se eliminan las jerarquías de herencia de permisos. Cada sitio es una **"isla independiente"**.
2.  **Flexibilidad Total:** Esta independencia permite que cada sitio gestione su propio idioma, su cuota de espacio y sus políticas de compartición externa de manera individual. Además, se gana en flexibilidad, ya que si la organización desea reestructurar su navegación o eliminar un área, puede hacerlo sin provocar una parálisis de diseño ni romper la herencia de permisos, lo cual era un problema habitual en el modelo clásico.
3.  **Contenedores como Unidades:** La arquitectura se enfoca en que cada necesidad de aislamiento de permisos o colaboración específica se traduzca en un nuevo "contenedor" (un sitio o un Team).

### 2. Clasificación de Contenedores y Plantillas

La primera decisión estratégica es definir el propósito del contenido que albergará la intranet, ya que esto determina el tipo de sitio a crear:

| Tipo de Contenedor                                  | Propósito                                                                                                   | Base de Permisos                                                                        |
| :-------------------------------------------------- | :---------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------- |
| **Sitios de Comunicación**                          | Enfocados en comunicación "uno para muchos" (intranets, noticias, manuales, catálogos).                     | Diseñados para que un pequeño grupo edite y el resto de la organización solo visualice. |
| **Sitios de Colaboración (Grupos de M365 / Teams)** | Orientados al trabajo diario y proyectos, donde todos los miembros esperan editar y modificar el contenido. | Son la base para Microsoft Teams.                                                       |

Un **Team** es una capa adicional de visualización e interacción que se construye sobre un Grupo de Office 365, y este a su vez es un sitio de SharePoint Online (colaboración).

### 3. Estrategia de Diseño para una Buena Intranet de Comunicación

La intranet corporativa se construye típicamente sobre Sitios de Comunicación. Aunque la arquitectura interna es plana, la organización necesita crear una estructura visualmente jerárquica para la navegación.

#### A. Navegación y Estructura Jerárquica Visual

1.  **Página de Inicio (Landing Site):** Es fundamental establecer un sitio principal (Home Site o Landing Page) que sea la puerta de entrada para todos los usuarios.
2.  **Sitios Centrales (Hub Sites):** Para agrupar visualmente sitios relacionados (por ejemplo, todos los sitios de un departamento), se utiliza la funcionalidad de Sitios Centrales.
    - Un sitio se define como un "Centro" (Hub).
    - Los sitios relacionados se asocian a ese Centro, heredando un **menú común** y un **esquema de colores** compartido.
    - **Importante:** Esta asociación es puramente visual y de navegación, **no** implica herencia de permisos, manteniendo la independencia de cada sitio.

#### B. Personalización Visual y Contenido Relevante

1.  **Branding:** Es altamente recomendable utilizar el _branding_ (logotipos, colores corporativos) para que el usuario sepa en qué área de la organización se encuentra. Microsoft ofrece herramientas para generar archivos XML (a menudo subidos vía PowerShell) para definir los temas y colores exactos que luego estarán disponibles en SharePoint.
2.  **Utilidad:** La intranet debe ofrecer contenido que sea útil para el usuario (noticias relevantes, enlaces a procesos internos como solicitud de vacaciones, baja parental, etc.), de lo contrario, no será utilizada.
3.  **Diseño Modular:** Los sitios de comunicación modernos son responsivos (se adaptan a diferentes dispositivos) y su edición es modular, similar a WordPress, utilizando _Web Parts_ y bloques predefinidos (como los ejemplos vistos en el **Lookbook de Microsoft**).

#### C. Segmentación de Audiencias

Para evitar la creación de múltiples sitios idénticos con pequeñas variaciones, se debe habilitar la **Identificación de Audiencias** (Audience Targeting).

- Esta funcionalidad permite que diferentes elementos del sitio (como noticias, enlaces o menús) se muestren de forma personalizada, dependiendo de si el usuario pertenece o no a un grupo específico de Azure AD.

### 4. Gestión de la Colaboración y Repositorios

Aunque la intranet de comunicación pueda enlazar a repositorios, la mejor práctica en M365 es consumir los archivos y colaborar de manera indirecta.

1.  **Teams como Interfaz Preferida:** Aunque los archivos residen en SharePoint, se recomienda que los usuarios accedan a los documentos colaborativos a través de **Teams**. Teams proporciona un entorno más simplificado para trabajar con ficheros y agrega funcionalidades clave como chat, videollamadas, Planner, y otras aplicaciones, ofreciendo una experiencia de colaboración completa.
2.  **Principio de Permisos Simplificado:** En los sitios de colaboración, la filosofía de permisos debe ser simple: **"o estás dentro o estás fuera"**. Se debe evitar la asignación manual de permisos granulares a nivel de carpeta o archivo dentro del sitio de SharePoint subyacente a un Team, ya que esto está desfasado y puede causar problemas en la funcionalidad que presupone Teams.
3.  **Gobernanza de la Creación de Contenedores:** Para evitar la proliferación descontrolada de Teams y sitios, las organizaciones suelen:
    - **Limitar la creación:** Restringir qué usuarios pueden crear Teams o Grupos de M365.
    - **Delegar la propiedad:** Utilizar formularios de solicitud para que el administrador cree el Team, pero luego asignarle la responsabilidad de la membresía y gestión interna al solicitante (el **Propietario del Team**).

### 5. Advertencia Didáctica: Evitar la Sincronización Local

Como experto, debo enfatizar una mala práctica que se debe evitar en un buen diseño de intranet:

- **Evitar la sincronización de archivos de sitios de colaboración (SharePoint/Teams) con el disco duro local (OneDrive):** Aunque existe el botón de "Sincronizar", se desaconseja su uso para archivos departamentales. La sincronización constante de grandes volúmenes de datos departamentales entre múltiples usuarios aumenta drásticamente la probabilidad de errores de sincronización y archivos duplicados o replicados incorrectamente. El método correcto es trabajar directamente en la nube, preferentemente a través de la interfaz de Teams.
