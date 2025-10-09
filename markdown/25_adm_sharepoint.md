# Centro de Administración de SharePoint: Guía Completa

Este panel ha evolucionado enormemente para adaptarse a la arquitectura moderna y plana que Microsoft promueve. A continuación, le explico detalladamente sus funcionalidades, su estructura y la filosofía que hay detrás de su administración.

### 1. La Filosofía del SharePoint Moderno y el Centro de Administración

Es fundamental entender que el Centro de Administración moderno está diseñado para gestionar sitios que son **"islas independientes"**, un concepto que rompe con la arquitectura jerárquica de sitios y subsitios del SharePoint clásico.

1.  **Modelo Plano:** En el modelo moderno, se eliminó la herencia de permisos jerárquica. La administración ya no se centra en gestionar niveles profundos de un árbol, sino en supervisar y configurar colecciones de sitios individuales.
2.  **Abandono del Clásico:** El centro de administración moderno ha quitado casi por completo las opciones y vistas del SharePoint clásico. Si bien aún existen remanentes por compatibilidad hacia atrás, estos se administran a través de interfaces antiguas y "horribles" a las que se accede con dificultad, ya que Microsoft desaconseja su uso y no quiere que los administradores utilicen la parte antigua.

### 2. Secciones Clave y Gestión de Sitios Activos

La sección principal del Centro de Administración es **Sitios Activos** (_Active Sites_), la cual ofrece una visión global de todos los contenedores de contenido creados en la organización, ya sean Sitios de Comunicación o Sitios de Grupo (los cuales son la base de los Teams).

#### A. Visión General y Propiedades

En esta lista es donde se visualizan y controlan los contenedores. Las columnas permiten ver información crítica de gobernanza:

- **URL y Nombre:** Identificación del sitio y posibilidad de cambiar la URL (lo cual, en el modelo moderno, se puede hacer sin que ocurran problemas).
- **Asociación a Teams/Grupos:** Indica si el sitio está conectado a un Team o si tiene un Grupo de Microsoft 365 por debajo.
- **Uso de Almacenamiento y Cuota:** Muestra el espacio ocupado y permite la gestión del límite de almacenamiento.
- **Sitio Central (Hub Site):** Indica si el sitio está asociado a un Centro o es un Centro en sí mismo (utilizado para heredar navegación visual y aspecto).
- **Administrador Principal y Creación:** Quién es el propietario del sitio, la fecha de creación, y si el sitio tiene aplicada alguna etiqueta de confidencialidad.

#### B. Gestión Individual de Sitios

Al seleccionar o hacer clic en un sitio individual, se accede a un panel lateral con opciones:

- **Edición:** Permite cambiar el nombre y la URL del sitio.
- **Permisos:** Desde aquí se puede ver quiénes son los propietarios del sitio o del Grupo de M365 subyacente, así como los administradores adicionales.
- **Directivas (Policies):** Permite configurar reglas específicas para ese sitio, como el control de uso compartido externo.

#### C. Sitios Eliminados

Esta sección permite la recuperación de sitios borrados. Los sitios eliminados se mantienen durante un periodo de hasta **93 días** antes de su purga permanente.

### 3. Políticas Globales y Controles de Gobernanza

La sección de **Directivas** (_Policies_) y **Configuración** (_Settings_) establece las reglas maestras de gobernanza para toda la organización, especialmente en lo que respecta a la seguridad de la información.

#### A. Directivas de Uso Compartido (Compartición Externa)

Esta es una de las configuraciones más importantes, ya que establece el nivel máximo de compartición externa para SharePoint y OneDrive. Es altamente recomendable configurarla por defecto:

1.  **Límite de Compartición:** La práctica recomendada es limitar la compartición por defecto a "Invitados existentes o nuevos". Esto significa que nadie sin autenticación podrá acceder a los archivos de la empresa, evitando riesgos.
2.  **Vínculos Anónimos:** Se desaconseja totalmente la compartición mediante **vínculos anónimos**, ya que representa un riesgo de seguridad.
3.  **Permisos por Defecto:** Se recomienda configurar que los permisos por defecto para los enlaces de compartición sean de **solo lectura**, ya que los usuarios son "muy torpes" y a menudo otorgan permisos de escritura cuando solo pretenden que se visualicen los documentos.
4.  **Caducidad de Enlaces:** Se puede configurar que el acceso de invitados y los enlaces caduquen automáticamente después de un periodo de tiempo (por ejemplo, 30 o 60 días).

#### B. Control de Acceso y Gestión de Dispositivos

Esta área contiene configuraciones que permiten restringir cómo y desde dónde se accede a SharePoint:

- **Restricción de Acceso:** Se puede restringir el acceso para que solo se permita la entrada a través de la web, bloqueando la descarga de archivos.
- **Dispositivos No Administrados:** Se puede denegar el acceso a dispositivos que no estén unidos al dominio o al Office 365, aunque el control más eficaz de los dispositivos (como el acceso condicional) se gestiona a través de Intune.

#### C. Configuración Global (Configuración)

Esta sección contiene ajustes que afectan a todos los sitios de SharePoint:

- **Creación de Sitios:** Permite limitar la creación de nuevos sitios a un grupo específico de usuarios, lo cual es una práctica clave de **gobernanza** para evitar la proliferación descontrolada de Teams y Sitios.
- **Sitio Principal (_Home Site_):** Se puede establecer un sitio específico como la página de aterrizaje (landing page) de la intranet de toda la organización.
- **Zona Horaria:** Es vital configurar correctamente la zona horaria predeterminada, ya que por defecto suele estar mal configurada (generalmente en la hora del Pacífico).
- **Límites de OneDrive:** Permite acotar la cuota de almacenamiento de OneDrive de cada usuario (por defecto 1 TB) para evitar que se saturen los discos locales y fomentar "mejor higiene" en el uso del espacio. También se pueden bloquear ciertos tipos de archivos para evitar que se suban películas o vídeos a OneDrive.

### 4. Herramientas de Migración y Aspectos Legacy

- **Herramienta de Migración (SMT):** El Centro de Administración enlaza a la **SharePoint Migration Tool** (SMT), una herramienta gratuita que facilita la copia de datos desde repositorios locales (como servidores de archivos) a SharePoint o OneDrive. Esta herramienta es crucial porque permite hacer la subida de datos en **varias pasadas incrementales** y escanea los archivos en el origen para detectar problemas de nomenclatura o longitud excesiva de los nombres.
- **Características Obsoletas:** Gran parte de las opciones fuera de la gestión de sitios y políticas son configuraciones antiguas que ya no se utilizan o que han sido reemplazadas por soluciones modernas de M365, como los sistemas de formularios (reemplazados por Power Apps) o la conectividad a bases de datos locales (BCS).

En resumen, el Centro de Administración de SharePoint es la herramienta esencial para mantener el control y la seguridad sobre los contenedores de la organización, asegurando que la arquitectura se mantenga plana y que el uso compartido de la información se adhiera a las políticas de gobernanza definidas.
