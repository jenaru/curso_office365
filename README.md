# 📚 Curso Microsoft 365 - Plataforma Educativa

> **Plataforma web profesional para aprendizaje de administración Microsoft 365**

## 🌐 **Sitio Web en Vivo**

### 🚀 **Acceso Directo**
**🌍 [Ver Curso Online](https://jenaru.github.io/curso_office365/)** - Acceso inmediato al curso completo

### 📖 **Manual Completo Disponible**
- **📱 [Manual HTML](https://jenaru.github.io/curso_office365/HTML/manual.html)** - Versión web interactiva
- **📄 [Descargar PDF](https://jenaru.github.io/curso_office365/HTML/manualOfficce365.pdf)** - Manual completo (655 KB)

### ✨ **Características del Sitio**
- ✅ **Acceso instantáneo** - Sin instalación requerida
- ✅ **Totalmente responsive** - Funciona en móviles y escritorio  
- ✅ **Manual integrado** - PDF y HTML disponibles
- ✅ **Navegación inteligente** - Filtros por categorías
- ✅ **Despliegue automático** - Actualizado con cada commit

---

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-🌐%20Live-brightgreen)](https://jenaru.github.io/curso_office365/)
[![HTML5](https://img.shields.io/badge/HTML5-E34F26?logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/HTML)
[![CSS3](https://img.shields.io/badge/CSS3-1572B6?logo=css3&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/CSS)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?logo=tailwind-css&logoColor=white)](https://tailwindcss.com/)

## 🌟 Características Principales

- **📚 23 Módulos Educativos** - Contenido completo de administración Microsoft 365
- **🎨 Interfaz Moderna** - Diseño responsive con tema oscuro
- **⚡ Navegación Inteligente** - Sistema de filtros por categorías
- **🔧 Configuración Profesional** - Build tools, linting, PWA ready
- **📱 Progressive Web App** - Funciona offline y se puede instalar
- **🛠️ Scripts de Automatización** - Herramientas de desarrollo integradas

## 📁 Estructura del Proyecto

```
📦 Curso365_info/
├── 📁 HTML/                          # 🌐 Aplicación web principal
│   ├── 📄 index.html                 # Página principal con navegación
│   ├── 📁 css/                       # 🎨 Estilos modulares (10 archivos)
│   │   ├── pages-base.css            # Estilos base compartidos
│   │   └── themes/                   # Temas por categoría
│   ├── 📁 js/                        # ⚡ JavaScript optimizado
│   │   ├── index.js                  # Sistema de navegación y filtros
│   │   └── back-button.js            # Navegación automática
│   ├── 📁 pages/                     # 📚 23 páginas educativas
│   │   ├── adm_exchange.html         # Administración Exchange
│   │   ├── adm_sharepoint.html       # Administración SharePoint
│   │   ├── usuarios_mail.html        # Gestión de usuarios
│   │   └── ...                       # Y 20 módulos más
│   └── 📁 tools/                     # 🛠️ Scripts de automatización
├── 📁 markdown/                      # 📝 Contenido fuente en Markdown
├── 📁 data/                          # 🎥 Videos del curso (ignorado en Git)
├── 📁 output/                        # 🎵 Audio extraído (ignorado en Git)
└── 📄 README.md                      # Esta documentación
```

## 🚀 Inicio Rápido

### Visualizar el Proyecto

```bash
# Opción 1: Servidor Python (recomendado)
cd HTML
python -m http.server 8080

# Opción 2: Servidor Node.js
cd HTML
npx serve . -p 8080

# Opción 3: Abrir directamente
# Abrir HTML/index.html en tu navegador
```

### Desarrollo Profesional

```bash
# Configuración inicial (instala Node.js, ESLint, Prettier)
cd HTML
.\setup.ps1

# Servidor de desarrollo con hot reload
npm run dev

# Build de producción
npm run build

# Verificar calidad del código
.\analyze-quality.ps1
```

## 📚 Contenido Educativo

### 🏗️ Arquitectura (3 módulos)

- Arquitectura de contenedores
- Conectores y flujo de datos
- Configuración de infraestructura

### 🔐 Identidad y Licenciamiento (4 módulos)

- Gestión de usuarios y grupos
- Asignación de licencias
- Usuarios invitados
- Roles y permisos

### 📧 Exchange Online (6 módulos)

- Administración Exchange
- Flujo de correo
- Reglas de correo
- Dominios remotos y aceptados
- Salas y recursos
- Buzones compartidos

### 📊 SharePoint Online (5 módulos)

- Administración SharePoint
- Sitios de colaboración
- Sitios de comunicación
- Intranet corporativa
- Uso compartido y permisos

### 🛠️ Administración (3 módulos)

- Soporte técnico
- Usuarios activos
- Herramientas administrativas

### 📋 Recursos (2 módulos)

- Resumen general
- Documentación técnica

## 🎨 Características Técnicas

### Frontend Moderno

- **HTML5 Semántico** - Estructura accesible y SEO optimizada
- **CSS3 Modular** - Sistema de temas con variables CSS
- **JavaScript ES2021** - Código moderno y optimizado
- **Tailwind CSS** - Framework utility-first para diseño rápido

### Development Experience

- **🔍 ESLint** - Linting automático con reglas ES2021
- **💅 Prettier** - Formateo consistente de código
- **⚡ Vite** - Build system ultrarrápido con HMR
- **📦 npm Scripts** - Automatización de tareas

### Production Ready

- **🗜️ Optimización** - Assets minificados y optimizados
- **📱 PWA** - Progressive Web App con service worker
- **🔒 Seguridad** - Headers de seguridad configurados
- **📈 SEO** - Meta tags y structured data

## 🛠️ Scripts Disponibles

### Desarrollo

```bash
.\tasks.ps1 dev          # Servidor de desarrollo
.\tasks.ps1 build        # Build de producción
.\tasks.ps1 preview      # Vista previa del build
```

### Calidad de Código

```bash
.\tasks.ps1 lint         # Verificar código con ESLint
.\tasks.ps1 format       # Formatear con Prettier
.\tasks.ps1 analyze      # Análisis completo del proyecto
```

### Utilidades

```bash
.\tasks.ps1 setup        # Configuración inicial
.\tasks.ps1 clean        # Limpiar archivos temporales
.\tasks.ps1 backup       # Crear backup del proyecto
.\tasks.ps1 status       # Estado del proyecto
```

## 📊 Métricas del Proyecto

- **📄 25 archivos HTML** (6,277 líneas de contenido)
- **🎨 10 archivos CSS** (833 líneas optimizadas)
- **⚡ 2 archivos JavaScript** (455 líneas, 100% utilización)
- **📦 0.4 MB** tamaño total optimizado
- **✅ 95.7%** conformidad con estándares
- **🚀 100%** configuración profesional

## 🌐 Deploy y Hosting

### 🚀 GitHub Pages (Activo)

**📍 Sitio Web**: https://jenaru.github.io/curso_office365/

```bash
# Despliegue automático configurado
# Cada push a 'master' actualiza el sitio automáticamente
git push origin master
```

**🔧 Configuración GitHub Pages:**
- ✅ **Fuente**: GitHub Actions (automático)
- ✅ **Directorio**: Toda la estructura del proyecto
- ✅ **Redirección**: Index automático a `/HTML/`
- ✅ **SSL**: Habilitado por defecto
- ✅ **CDN**: GitHub Global CDN

**📋 Workflow Automático:**
- 📤 Push a master → 🔄 GitHub Actions → 🌐 Deploy automático
- ⏱️ Tiempo de despliegue: ~2-3 minutos
- 🔄 Actualización en tiempo real del sitio

### 🛠️ Otras Opciones de Deploy Netlify

```bash
npm run build
netlify deploy --prod --dir=dist
```

### Vercel

```bash
npm run build
vercel --prod
```

### Servidor Traditional

```bash
# Subir la carpeta HTML/ a tu servidor web
# El proyecto es estático, no requiere backend
```

## 🤝 Contribuir

1. **Fork** el proyecto
2. **Crear** rama feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** cambios (`git commit -m 'Add AmazingFeature'`)
4. **Push** a la rama (`git push origin feature/AmazingFeature`)
5. **Abrir** Pull Request

## 📝 Licencia

Este proyecto está bajo la licencia MIT. Ver `HTML/LICENSE` para más detalles.

## 👨‍💻 Autor

**Desarrollado con ❤️ para la comunidad de administradores Microsoft 365**

---

### 🎯 ¿Por qué este proyecto?

Esta plataforma educativa fue creada para proporcionar una experiencia de aprendizaje **moderna, interactiva y profesional** para administradores de Microsoft 365. Combina las mejores prácticas de desarrollo web con contenido educativo de alta calidad.

### 🌟 Destacados

- ✅ **Código limpio y documentado**
- ✅ **Arquitectura escalable y mantenible**
- ✅ **Performance optimizado**
- ✅ **SEO y accessibility friendly**
- ✅ **Mobile-first responsive design**
- ✅ **Progressive Web App capabilities**

**¡Empieza tu aprendizaje ahora! 🚀**
