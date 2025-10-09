# Sistema CSS Modular - Curso 365

## 📁 Estructura de Archivos CSS

```
css/
├── styles.css           # Estilos para index.html
├── pages-base.css       # Estilos base comunes para todas las páginas
└── themes/              # Temas específicos por categoría
    ├── sharepoint.css
    ├── administracion.css
    ├── exchange.css
    ├── identidad.css
    ├── seguridad.css
    ├── arquitectura.css
    └── licenciamiento.css
```

## 🎨 Cómo Usar el Sistema

### Para páginas nuevas:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tu Página</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Estilos base obligatorio -->
    <link rel="stylesheet" href="../css/pages-base.css">

    <!-- Tema según categoría -->
    <link rel="stylesheet" href="../css/themes/sharepoint.css">

    <!-- Estilos específicos opcionales -->
    <style>
        /* Solo estilos únicos de esta página */
    </style>
</head>
```

## 🎯 Temas Disponibles

| Tema           | Archivo              | Color Principal      | Uso                     |
| -------------- | -------------------- | -------------------- | ----------------------- |
| SharePoint     | `sharepoint.css`     | #0ea5e9 (azul claro) | Páginas de SharePoint   |
| Administración | `administracion.css` | #3b82f6 (azul)       | Gestión y configuración |
| Exchange       | `exchange.css`       | #8b5cf6 (violeta)    | Correo y Exchange       |
| Identidad      | `identidad.css`      | #10b981 (verde)      | Usuarios y grupos       |
| Seguridad      | `seguridad.css`      | #ef4444 (rojo)       | Roles y permisos        |
| Arquitectura   | `arquitectura.css`   | #6366f1 (índigo)     | Conceptos generales     |
| Licenciamiento | `licenciamiento.css` | #f59e0b (amarillo)   | Licencias               |

## 🔧 Componentes CSS Disponibles

### Contenedores Base

- `.document-container` - Contenedor principal de página
- `.content-card` - Tarjetas de contenido
- `.page-header` - Encabezado de página
- `.page-title` - Título principal
- `.page-subtitle` - Subtítulo

### Elementos de Información

- `.info-box` - Cajas de información
- `.callout` - Llamadas de atención
- `.critical-config` - Configuraciones críticas
- `.code-block` - Bloques de código inline

### Tablas

- `.admin-table` - Tablas administrativas
- `.admin-table th` - Headers de tabla
- `.admin-table td` - Celdas de tabla

### Listas

- `.feature-list` - Listas con viñetas temáticas
- `.service-list` - Listas de servicios

### Diagramas

- `.architecture-layer` - Capas de arquitectura
- `.diagram-connector` - Conectores de diagrama
- `.architecture-comparison` - Comparaciones visuales
- `.comparison-side` - Lados de comparación

## ⚙️ Scripts de Automatización

### Refactorizar todas las páginas:

```powershell
# Desde la carpeta HTML/
.\refactor-css.ps1
```

### Vista previa (sin cambios):

```powershell
.\refactor-css.ps1 -DryRun
```

## 🎨 Personalización de Temas

### Variables CSS disponibles en cada tema:

```css
:root {
  --primary-color: /* Color principal del tema */
  --theme-primary: /* Color primario */
  --theme-secondary: /* Color secundario */
  --theme-accent: /* Color de acento */
}
```

### Clases específicas por tema:

- SharePoint: `.sharepoint-highlight`, `.sharepoint-modern`, etc.
- Administración: `.admin-section`, `.admin-highlight`
- Exchange: `.exchange-section`, `.exchange-highlight`
- Y así sucesivamente...

## 📱 Responsive Design

Todos los estilos incluyen breakpoints responsive:

- Mobile: `@media (max-width: 480px)`
- Tablet: `@media (max-width: 768px)`

## 🔄 Migración desde CSS Inline

El script `refactor-css.ps1` automatiza la migración:

1. **Detecta** el bloque `<style>` en cada página
2. **Mapea** la página al tema correcto según el contenido
3. **Reemplaza** el CSS inline con enlaces externos
4. **Preserva** estilos únicos en `<style>` minimalista

## 💡 Mejores Prácticas

### ✅ Recomendado:

- Usar clases CSS predefinidas cuando sea posible
- Mantener estilos únicos en `<style>` mínimo
- Seguir la convención de naming de temas
- Usar variables CSS para colores consistentes

### ❌ Evitar:

- CSS inline extenso en páginas individuales
- Duplicar estilos que ya existen en los archivos base
- Colores hardcodeados (usar variables CSS)
- Romper la consistencia visual entre temas

## 🚀 Beneficios del Sistema

### Rendimiento:

- **Cacheo**: CSS externo se cachea por el navegador
- **Reutilización**: Mismos archivos CSS para múltiples páginas
- **Carga paralela**: CSS se descarga en paralelo al HTML

### Mantenimiento:

- **Centralizado**: Cambios de estilo en un solo lugar
- **Consistencia**: Mismos componentes en todas las páginas
- **Escalabilidad**: Fácil agregar nuevos temas o componentes

### Desarrollo:

- **Legibilidad**: HTML más limpio y enfocado en contenido
- **Reutilización**: Componentes listos para usar
- **Flexibilidad**: Fácil personalización por tema
