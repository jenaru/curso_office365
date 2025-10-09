# Microsoft 365 Course Site - AI Coding Assistant Instructions

## Project Architecture

This is a **static HTML educational website** for a Microsoft 365 administration course. The architecture follows a **centralized component pattern** with automated navigation and dynamic filtering.

### Core Structure

```
HTML/
├── index.html                 # Main landing page with card-based navigation
├── js/
│   ├── index.js              # Core navigation system and tag filtering
│   └── back-button.js        # Automated navigation component
├── pages/                    # Individual course pages (16+ HTML files)
└── components/               # Reusable HTML components
```

## Key Patterns & Workflows

### Page Registration System

All pages are **centrally registered** in `HTML/js/index.js` in the `pages` array:

```javascript
{
  title: "Page Title",
  file: "filename.html",
  description: "Brief description",
  image: "📊",  // Emoji icon (NO external URLs)
  tag: "category"  // For filtering
}
```

### Standardized Page Structure

Every page in `pages/` follows this template:

1. **Dark theme CSS** with CSS variables (`:root`)
2. **Tailwind CSS** via CDN
3. **Content structure**: `.document-container` → `.content-card`
4. **Automated navigation**: `<script src="../js/back-button.js"></script>` before `</body>`

### Content Conversion Pattern

When processing existing pages, **always convert markdown syntax to HTML**:

- `**text**` → `<strong>text</strong>`
- Check with `grep_search` for `\*\*[^*]+\*\*` pattern first

### Tag-Based Filtering System

Six predefined categories with specific colors (defined in `tagColors` object):

- `arquitectura` (purple) - System architecture
- `licenciamiento` (amber) - Licensing
- `identidad` (green) - Identity management
- `administracion` (blue) - Administration
- `seguridad` (red) - Security
- `correo` (purple) - Exchange/email

## Critical Developer Commands

### Adding New Pages

1. Create HTML file in `pages/` following the template
2. Register in `js/index.js` pages array
3. Use PowerShell automation: `.\update-pages.ps1` (bulk updates)

### Testing Changes

```powershell
Start-Process "c:\Users\ibi_x\Desktop\Curso365_info\HTML\index.html"
```

## Project-Specific Conventions

### Design System

- **Dark theme only** - all pages use dark background with light text
- **Emoji icons** - NO external icon dependencies (Flaticon replaced with emojis)
- **Hover effects** - extensive use of CSS transitions and transform effects
- **Responsive grid** - card layouts with Tailwind utility classes

### Component Philosophy

- **Zero duplication** - navigation handled by single `back-button.js` script
- **Automatic injection** - components added via JavaScript, not templates
- **Self-contained** - each page includes all necessary styles inline

### Content Strategy

- **Spanish language** - all content in Spanish for Microsoft 365 training
- **Technical focus** - Exchange Online, Azure AD, SharePoint administration
- **Practical examples** - real configuration scenarios with code blocks

## Integration Points

### External Dependencies

- **Tailwind CSS** (CDN) - only external dependency
- **No build system** - pure HTML/CSS/JS for simplicity

### Cross-Component Communication

- Filtering state managed entirely in `index.js`
- No global state - each page is independent
- Navigation handled by URL changes, not SPA routing

When working on this codebase, prioritize consistency with existing patterns over modern web practices. The deliberate choice of inline styles and script injection serves the educational context and deployment simplicity.
