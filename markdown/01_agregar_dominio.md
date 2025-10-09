### **Propósito de Agregar un Dominio**

Cuando se da de alta un *tenant* (inquilino) en Office 365 por primera vez, este viene con un dominio interno gestionado por Microsoft, que suele tener un formato como `cpsl.onmicrosoft.com`. Aunque funcional, no es lo ideal para el uso diario, ya que los usuarios prefieren iniciar sesión y usar direcciones de correo electrónico que les resulten más familiares y profesionales, como las de su propia empresa.

Agregar tu propio dominio (por ejemplo, `cpsl.com` o el `.cat` que mencionas) te permite:

*   Asignar a los usuarios un **nombre de inicio de sesión** (conocido como User Principal Name o UPN) que coincida con su dirección de correo electrónico corporativa.
*   Tener **múltiples dominios** dentro de la misma organización. Por ejemplo, podrías tener `cpsl.com` y `cpsl.cat` y asignar a unos usuarios un dominio y a otros, otro. Incluso se pueden usar subdominios como `external.cpsl.com`.
*   Permitir que un usuario tenga una **dirección de correo principal** en un dominio, pero también reciba correos enviados a alias en otros dominios que tengas registrados.

### **Proceso Detallado para Agregar y Configurar un Dominio**

El proceso consta de dos fases principales: la verificación de la propiedad del dominio y la configuración de los servicios (principalmente el correo electrónico).

#### **1. Verificación de la Propiedad del Dominio**

Para agregar un dominio, debes demostrarle a Microsoft que eres el propietario. Esto se hace desde el panel de administración, en la sección de **Configuración > Dominios**. El proceso es el siguiente:

1.  Haces clic en **"Agregar un dominio"** e introduces el nombre del dominio que quieres registrar (por ejemplo, `pepito.com`).
2.  Microsoft te pedirá una **prueba de que el dominio es tuyo**. Para ello, ofrece tres métodos principales:

    *   **Agregar un registro TXT en tu DNS (método más común)**: Esta es la opción más sencilla. Microsoft te proporcionará un valor específico (por ejemplo, `MS=ms6539...`) que debes crear como un registro de tipo TXT en la configuración de DNS externa de tu dominio. Una vez creado, esperas un poco y le das al botón de "Verificar". Cuando se confirma, el dominio ya puede ser usado y este registro TXT se puede eliminar si lo deseas.
    *   **Agregar un registro MX**: Este método es un poco más "peligroso" porque los registros MX gestionan el flujo de correo. Sin embargo, se puede crear un registro MX con una prioridad muy baja para que no afecte al flujo de correo existente durante la verificación.
    *   **Agregar un archivo de texto en el sitio web del dominio**: Si tienes una página web asociada a tu dominio (ej. `cpsl.com`), puedes subir un archivo de texto específico a una URL que Microsoft te indicará. El sistema comprobará que el archivo está ahí y con eso verificará que controlas el dominio.

#### **2. Configuración de los Servicios (Registros DNS)**

Una vez verificado el dominio, necesitas crear una serie de registros DNS adicionales para que servicios como el correo electrónico funcionen correctamente. Los registros más importantes son:

*   **Registro MX (Mail Exchanger)**: Este registro es crucial y su función es **dirigir todo el flujo de correo electrónico entrante hacia los servidores de Office 365**.
*   **Registro SPF (Sender Protection Framework)**: Es un sistema diseñado para reducir el spam. Se trata de un registro TXT en tu DNS público donde declaras qué servidores de correo están autorizados para enviar correos en nombre de tu dominio. Microsoft te pedirá que incluyas `spf.protection.outlook.com` para autorizar a sus servidores. Este registro puede tener modificadores como:
    *   `-all` (hard fail): Indica que si un correo no proviene de los servidores autorizados, es falso.
    *   `~all` (soft fail): Es menos estricto; sugiere que el correo podría ser falso, pero no lo califica como tal de forma automática.
*   **Registro CNAME para Autodiscover**: Este es un alias (por ejemplo, `autodiscover.cpsl.com`) que apunta a los servidores de Microsoft. Su función es permitir que las aplicaciones de Outlook (a partir de la versión 2010) **encuentren y configuren automáticamente el buzón de un usuario sin necesidad de saber en qué servidor físico se encuentra**. El cliente de Outlook busca este servicio para obtener la configuración en un archivo XML. Es importante saber que si tu dominio interno de Active Directory se llama igual que el externo, este registro debe crearse también en el DNS interno.