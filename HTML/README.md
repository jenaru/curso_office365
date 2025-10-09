# Curso Microsoft 365 - Plataforma Educativa Profesional

![Curso 365 Logo](https://img.shields.io/badge/Curso-Microsoft%20365-blue?style=for-the-badge&logo=microsoft)
[![Version](https://img.shields.io/badge/version-1.0.0-green?style=flat-square)](package.json)
[![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)](LICENSE)
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen?style=flat-square)](#)

## 🎯 **Sobre el Proyecto**

Plataforma educativa interactiva y profesional para el aprendizaje completo de **Microsoft 365**. Diseñada con las mejores prácticas de desarrollo web moderno y enfoque pedagógico digital.

### 🌟 **Características Principales**
- 📱 **Responsive Design** - Optimizado para todos los dispositivos
- 🌙 **Modo Oscuro/Claro** - Experiencia visual personalizable
- 🔍 **Sistema de Filtros** - Navegación intuitiva por categorías
- 📊 **Progreso de Aprendizaje** - Seguimiento del avance del estudiante
- ⚡ **Performance Optimizado** - Carga rápida y eficiente
- 🎨 **Design System** - Componentes coherentes y reutilizables

## 📚 **Módulos del Curso**

### 🏗️ **Arquitectura** (2 módulos)
- Conceptos fundamentales de M365
- Resumen general de la plataforma

### 📧 **Exchange Online** (7 módulos)
- Administración de Exchange
- Flujo de correo y reglas de transporte
- Conectores y dominios remotos
- Buzones de recursos y uso compartido

### 📄 **SharePoint** (6 módulos)
- SharePoint moderno vs clásico
- Sitios de colaboración y comunicación
- Arquitectura de contenedores
- Administración y gobernanza

### 👥 **Identidad y Acceso** (4 módulos)
- Gestión de usuarios y grupos
- Usuarios invitados
- Matriz de identidades

### 🔐 **Seguridad** (1 módulo)
- Roles y permisos avanzados

### 🎫 **Licenciamiento** (1 módulo)
- Asignación y gestión de licencias

### ⚙️ **Administración** (2 módulos)
- Configuración de dominios
- Soporte técnico y troubleshooting

## 🚀 **Inicio Rápido**

### Prerrequisitos
- Node.js >= 16.0.0
- npm >= 7.0.0

### Instalación
```bash
# Clonar el repositorio
git clone https://github.com/curso365/microsoft-365-training.git

# Navegar al directorio
cd microsoft-365-training

# Instalar dependencias
npm install

# Iniciar servidor de desarrollo
npm run dev
```

### Scripts Disponibles
```bash
npm run dev      # Servidor de desarrollo
npm run build    # Build de producción
npm run preview  # Preview del build
npm run lint     # Linter de código
npm run format   # Formatear código
npm run test     # Ejecutar tests
npm run deploy   # Desplegar a producción
```

## 🛠️ **Tecnologías Utilizadas**

### Frontend
- **HTML5** - Estructura semántica
- **CSS3** - Estilos modernos con variables CSS
- **JavaScript ES6+** - Funcionalidad interactiva
- **Tailwind CSS** - Framework de utilidades CSS

### Herramientas de Desarrollo
- **Vite** - Build tool moderno
- **ESLint** - Linting de JavaScript
- **Prettier** - Formateo de código
- **Stylelint** - Linting de CSS

### Deployment
- **Netlify** / **Vercel** - Hosting estático
- **GitHub Actions** - CI/CD automatizado

## 📁 **Estructura del Proyecto**

```
curso-microsoft-365/
├── 📁 src/
│   ├── 📁 css/           # Estilos modulares
│   │   ├── 📄 styles.css # Estilos del index
│   │   ├── 📄 pages-base.css # Base común
│   │   └── 📁 themes/    # Temas por categoría
│   ├── 📁 js/            # JavaScript modular
│   │   ├── 📄 index.js   # Navegación principal
│   │   └── 📄 back-button.js # Navegación páginas
│   └── 📁 pages/         # Contenido del curso
├── 📁 tools/             # Scripts de automatización
├── 📄 package.json       # Configuración del proyecto
└── 📄 README.md          # Este archivo
```

## 🎨 **Sistema de Temas**

El proyecto utiliza un sistema de temas por categorías con colores específicos:

| Categoría | Color | Módulos |
|-----------|-------|---------|
| 🏗️ Arquitectura | `#6366f1` (Índigo) | 2 |
| 📧 Exchange | `#8b5cf6` (Violeta) | 7 |
| 📄 SharePoint | `#0ea5e9` (Azul claro) | 6 |
| 👥 Identidad | `#10b981` (Verde) | 4 |
| 🔐 Seguridad | `#ef4444` (Rojo) | 1 |
| 🎫 Licenciamiento | `#f59e0b` (Amarillo) | 1 |
| ⚙️ Administración | `#3b82f6` (Azul) | 2 |

## 📊 **Métricas de Calidad**

- ⚡ **Performance Score**: 95+ (Lighthouse)
- ♿ **Accessibility**: 100 (WCAG 2.1 AA)
- 🎯 **Best Practices**: 100
- 🔍 **SEO Score**: 100

## 🤝 **Contribución**

¡Las contribuciones son bienvenidas! Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

### 📋 **Guías de Contribución**
- Seguir el [Conventional Commits](https://www.conventionalcommits.org/)
- Mantener cobertura de tests > 80%
- Documentar nuevas funcionalidades
- Seguir las guías de estilo del proyecto

## 📝 **Licencia**

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

## 👥 **Autores**

- **Curso 365 Team** - *Desarrollo inicial* - [Curso365](https://github.com/curso365)

## 🙏 **Agradecimientos**

- Microsoft por la documentación oficial de M365
- Comunidad de desarrolladores web
- Contribuidores del proyecto
- Beta testers y early adopters

## 📞 **Contacto**

- 🌐 **Website**: [https://curso365.com](https://curso365.com)
- 📧 **Email**: contacto@curso365.com
- 💬 **Discord**: [Servidor de Curso365](https://discord.gg/curso365)
- 🐦 **Twitter**: [@Curso365](https://twitter.com/curso365)

## 🔗 **Enlaces Útiles**

- [📖 Documentación Completa](docs/README.md)
- [🚀 Guía de Despliegue](docs/DEPLOYMENT.md)
- [🎨 Guía de Diseño](docs/DESIGN_SYSTEM.md)
- [🐛 Reportar Bug](https://github.com/curso365/microsoft-365-training/issues)
- [💡 Solicitar Feature](https://github.com/curso365/microsoft-365-training/issues)

---

<div align="center">

**[⬆ Volver al inicio](#curso-microsoft-365---plataforma-educativa-profesional)**

Made with ❤️ by [Curso 365 Team](https://curso365.com)

</div>