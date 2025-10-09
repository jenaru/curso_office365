# Roles de Administración y Granularidad de Permisos

Los roles de administración sirven para **separar las tareas de administración**. En lugar de que todos los administradores tengan el mismo acceso a todas las configuraciones (_administradores globales_), los roles permiten aplicar permisos de forma más granular para tareas específicas.

Aquí tienes una explicación detallada de los roles que hemos cubierto y el concepto de granularidad de permisos:

### 1. El Concepto de Granularidad

- **Administradores Globales:** Son aquellos que tienen **todos** los permisos sobre la plataforma. Curiosamente, incluso ellos pueden no tener ciertos permisos de forma predeterminada (como permisos para abrir casos legales), aunque tienen la capacidad de otorgárselos a sí mismos.
- **Roles Especializados:** Permiten asignar funcionalidades específicas. Cuantos más roles se tengan, más se puede separar la administración. Por ejemplo, existe el rol de **Administrador de Facturación** para gestionar facturas.

### 2. Roles en el Panel de Administración General

En el panel de administración, se puede ver una lista de **muchos roles** de administración, que pueden ser muy granulares.

- **Asignación:** Se gestionan directamente en la configuración de la cuenta de cada usuario, en la sección de Roles de Administración.

### 3. Roles en el Contexto del Correo Electrónico (Exchange Online)

El sistema de correo Exchange (la base de Exchange Online) fue el primer producto que utilizó un sistema de control de acceso muy granular llamado **RPAC** (Role-Based Access Control).

- **Granularidad Extrema:** En Exchange, se puede definir un rol de administración diciéndole **qué comandos de Power Shell** van a poder utilizar, **con qué parámetros** y **para qué conjunto de usuarios**. Por ejemplo, podrías crear un rol de "administrador de direcciones de correo electrónico para los usuarios de marketing de Bulgaria".
- **Roles Legales/Compliance:** Dentro de la gestión de roles, existe una división entre el **rol de administración** y el **rol legal**. Los profesionales legales (abogados) necesitan roles que les permitan acceder al centro de cumplimiento (_compliance_) para tareas como realizar un descubrimiento legal (_eDiscovery_), sin tener acceso al panel de seguridad general. Esto requiere ser miembro de ciertos grupos de roles especializados.

### 4. Directivas de Paquetes de Roles (Teams)

En entornos complejos, asignar roles (o, en el caso de Teams, **Directivas**) uno por uno puede ser tedioso.

- **Paquetes de Directivas:** En Teams, puedes crear un **pack de directiva** (o paquete de roles). Este paquete es una configuración estandarizada que agrupa múltiples directivas (de chat, de llamadas, de reuniones, de aplicaciones, etc.) para un perfil específico (ej. un comercial o un profesor). Esto permite asignar todas las configuraciones necesarias de golpe, en lugar de una a una.

En resumen, el sistema de roles está diseñado para ofrecer una **separación de funciones** (separar al administrador del abogado, por ejemplo) y una **granularidad máxima**, especialmente en Exchange y Teams, donde se pueden crear configuraciones muy específicas para subconjuntos de usuarios.
