// index.js - Sistema de navegación y filtros para el curso de Office 365

const pages = [
  {
    title: 'Resumen General',
    file: 'resumen_general.html',
    description: 'Resumen General del curso',
    image: '📊',
    tag: 'arquitectura'
  },
  {
    title: 'Agregar Dominios',
    file: 'agregar_dominios.html',
    description: 'Cómo agregar y configurar dominios personalizados en M365',
    image: '🌐',
    tag: 'administracion'
  },
  {
    title: 'Asignacion de Licencias',
    file: 'asignacion_licencias.html',
    description: 'Cómo asignar licencias a usuarios',
    image: '🎫',
    tag: 'licenciamiento'
  },
  {
    title: 'Usuario Invitado',
    file: 'usuario_invitado.html',
    description: '¿Que es un usuario invitado?',
    image: '👤',
    tag: 'identidad'
  },

  {
    title: 'Matriz de Identidades',
    file: 'usuarios_mail.html',
    description:
      'Comparativa de usuarios, invitados y contactos en Microsoft 365',
    image: '👥',
    tag: 'identidad'
  },
  {
    title: 'Tipos de Grupos',
    file: 'grupos.html',
    description: 'Tipos de grupos y destinatarios en Microsoft 365',
    image: '👫',
    tag: 'identidad'
  },
  {
    title: 'Roles y Permisos',
    file: 'roles.html',
    description: 'Roles de administración y granularidad de permisos en M365',
    image: '🔐',
    tag: 'seguridad'
  },
  {
    title: 'Buzones de Recursos',
    file: 'salas.html',
    description: 'Gestión de salas y equipamiento en Exchange Online',
    image: '🏢',
    tag: 'correo'
  },
  {
    title: 'Soporte Técnico',
    file: 'soporte_tecnico.html',
    description: 'Gestión de incidencias y soporte técnico en M365',
    image: '🛠️',
    tag: 'administracion'
  },
  {
    title: 'Usuarios Activos',
    file: 'usuarios_activos.html',
    description:
      'Gestión de usuarios activos, licencias y delegación en Azure AD',
    image: '🧑‍💼',
    tag: 'identidad'
  },
  {
    title: 'Administración de Exchange',
    file: 'adm_exchange.html',
    description:
      'Centro de Administración de Exchange - Destinatarios, flujo de correo y seguridad',
    image: '📧',
    tag: 'correo'
  },
  {
    title: 'Flujo de Correo',
    file: 'flujo_correo.html',
    description:
      'Seguimiento de mensajes, reglas de transporte y configuración de conectores',
    image: '🔀',
    tag: 'correo'
  },
  {
    title: 'Reglas de Transporte',
    file: 'reglas_coreo.html',
    description:
      'Automatización y aplicación de políticas al flujo de correo con reglas',
    image: '⚙️',
    tag: 'correo'
  },
  {
    title: 'Dominios Aceptados y Remotos',
    file: 'dominios_remotos_aceptados.html',
    description:
      'Configuración de dominios autoritativos, de retransmisión y dominios remotos en Exchange',
    image: '🌐',
    tag: 'correo'
  },
  {
    title: 'Conectores de Correo',
    file: 'conectores.html',
    description:
      'Configuración de conectores inbound y outbound para rutas específicas de correo',
    image: '🔗',
    tag: 'correo'
  },
  {
    title: 'Uso Compartido',
    file: 'uso_compartido.html',
    description:
      'Compartición federada e individual de calendarios en Exchange Online',
    image: '📅',
    tag: 'correo'
  },
  {
    title: 'SharePoint Moderno',
    file: 'resumen_sharepoint.html',
    description:
      'Evolución de SharePoint clásico a moderno, sitios de colaboración y arquitectura',
    image: '📚',
    tag: 'sharepoint'
  },
  {
    title: 'Arquitectura de Contenedores de SharePoint',
    file: 'arquitectura_contenedores.html',
    description:
      'Filosofía moderna de contenedores: Teams, Grupos M365, permisos y gobernanza',
    image: '🏗️',
    tag: 'sharepoint'
  },
  {
    title: 'Diseño de Intranets',
    file: 'intranet.html',
    description:
      'Estrategias para crear intranets modernas con SharePoint: navegación, hub sites y audiencias',
    image: '🌐',
    tag: 'sharepoint'
  },
  {
    title: 'Sitios de Comunicación',
    file: 'sitio_comunicacion.html',
    description:
      'Núcleo de la intranet moderna: difusión one-to-many, permisos y personalización visual',
    image: '📢',
    tag: 'sharepoint'
  },
  {
    title: 'Sitios de Colaboración',
    file: 'sitio_colaboracion.html',
    description:
      'Piedra angular del trabajo en equipo: Teams, Grupos M365 y participación activa',
    image: '🤝',
    tag: 'sharepoint'
  },
  {
    title: 'Administración de SharePoint',
    file: 'adm_sharepoint.html',
    description:
      'Centro de administración: gobernanza, políticas globales y gestión de sitios activos',
    image: '⚙️',
    tag: 'sharepoint'
  },
  {
    title: 'Administración de Teams',
    file: 'adm_teams.html',
    description:
      'Centro de Administración de Teams: gobierno, directivas, aplicaciones y colaboración externa',
    image: '👥',
    tag: 'teams'
  },
  {
    title: 'Directivas de Reunión Teams',
    file: 'directivas_reunion.html',
    description:
      'Configuraciones recomendadas para directivas de reunión: seguridad, grabaciones y mejores prácticas',
    image: '🎯',
    tag: 'teams'
  },
  {
    title: 'Directivas de Mensajería Teams',
    file: 'directivas_mensajeria.html',
    description:
      'Configuraciones de chat y comunicación: memes, mensajes de voz, etiquetas y roles por perfil de usuario',
    image: '💬',
    tag: 'teams'
  }
];

// Colores para cada categoría
const tagColors = {
  arquitectura: '#6366f1',
  licenciamiento: '#f59e0b',
  identidad: '#10b981',
  administracion: '#3b82f6',
  seguridad: '#ef4444',
  correo: '#8b5cf6',
  sharepoint: '#0ea5e9',
  teams: '#6264A7'
};

// Obtener tags únicos
function getUniqueTags() {
  const tags = pages.map(page => page.tag);
  return [...new Set(tags)].sort();
}

// Filtrar páginas por tag
function filterPagesByTag(tag = null) {
  if (!tag || tag === 'todos') {
    return pages;
  }
  return pages.filter(page => page.tag === tag);
}

// Renderizar menú de tarjetas
function renderMenu(filteredPages = pages) {
  const menu = document.getElementById('menu');
  if (!menu) return;

  menu.innerHTML = '';

  filteredPages.forEach(page => {
    const card = document.createElement('div');
    card.className = 'card';

    card.innerHTML = `
      <div 
        class="emoji-icon" 
        style="
          font-size: 36; 
          text-align: center; 
          margin: 10px 0;
          transition: all 0.3s ease;
          cursor: pointer;
        "
        onmouseover="this.style.transform='scale(1.2) rotate(10deg)'; this.style.filter='brightness(1.2)'"
        onmouseout="this.style.transform='scale(1) rotate(0deg)'; this.style.filter='brightness(1)'"
      >
        ${page.image}
      </div>
      <h3>${page.title}</h3>
      <p>${page.description}</p>
      <button 
        onclick="window.location.href='pages/${page.file}'"
        style="
          margin-top: 10px;
          padding: 10px 20px;
          border: none;
          background: #0078d4;
          color: #fff;
          border-radius: 6px;
          cursor: pointer;
          font-weight: 600;
          font-size: 14px;
          transition: all 0.3s ease;
          box-shadow: 0 2px 4px rgba(0, 120, 212, 0.2);
        "
        onmouseover="this.style.background='#106ebe'; this.style.transform='translateY(-2px)'; this.style.boxShadow='0 4px 12px rgba(0, 120, 212, 0.3)'"
        onmouseout="this.style.background='#0078d4'; this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 4px rgba(0, 120, 212, 0.2)'"
      >
        Ver página
      </button>
      <div 
        class="tag-badge" 
        style="
          background-color: ${tagColors[page.tag] || '#6b7280'}; 
          color: white; 
          padding: 6px 12px; 
          border-radius: 12px; 
          font-size: 11px; 
          font-weight: 600; 
          margin: 8px auto; 
          display: block; 
          text-transform: capitalize; 
          text-align: center; 
          width: fit-content;
          cursor: pointer;
          transition: all 0.3s ease;
          border: 2px solid transparent;
        "
        onclick="filterByTag('${page.tag}', this)"
        onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 2px 8px rgba(0,0,0,0.2)'; this.style.borderColor='rgba(255,255,255,0.3)'"
        onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='none'; this.style.borderColor='transparent'"
        title="Filtrar por ${page.tag}"
      >
        ${page.tag}
      </div>
    `;

    menu.appendChild(card);
  });
}

// Renderizar filtros de tags
function renderTagFilters() {
  const filterContainer = document.getElementById('tag-filters');
  if (!filterContainer) return;

  const tags = getUniqueTags();

  // Botón "Todos"
  filterContainer.innerHTML = `
    <button class="filter-btn active" onclick="filterByTag('todos', this)">Todos</button>
  `;

  // Botones de categorías
  tags.forEach(tag => {
    const filterBtn = document.createElement('button');
    filterBtn.className = 'filter-btn';
    filterBtn.style.borderColor = tagColors[tag];
    filterBtn.textContent = tag.charAt(0).toUpperCase() + tag.slice(1);
    filterBtn.onclick = () => filterByTag(tag, filterBtn);
    filterContainer.appendChild(filterBtn);
  });
}

// Filtrar por tag y actualizar UI
function filterByTag(tag, buttonElement) {
  // Actualizar botones activos en la barra de filtros
  document.querySelectorAll('.filter-btn').forEach(btn => {
    btn.classList.remove('active');
  });

  // Buscar y activar el botón correspondiente en la barra de filtros
  const filterButtons = document.querySelectorAll('.filter-btn');
  filterButtons.forEach(btn => {
    if (
      (tag === 'todos' && btn.textContent === 'Todos') ||
      (tag !== 'todos' && btn.textContent.toLowerCase() === tag)
    ) {
      btn.classList.add('active');
    }
  });

  // Si el elemento clickeado no es un botón de filtro, manejar manualmente
  if (buttonElement && buttonElement.classList.contains('filter-btn')) {
    buttonElement.classList.add('active');
  }

  // Filtrar y renderizar páginas
  const filteredPages = filterPagesByTag(tag);
  renderMenu(filteredPages);
}

// Función para cargar página (si se necesita)
function loadPage(pageFile) {
  fetch(`pages/${pageFile}`)
    .then(response => response.text())
    .then(html => {
      document.getElementById('content').innerHTML = html;
    })
    .catch(error => {
      console.error('Error cargando la página:', error);
    });
}

// Inicializar cuando el DOM esté listo
document.addEventListener('DOMContentLoaded', () => {
  renderMenu();
  renderTagFilters();
  loadThemePreference();
});

// ============== FUNCIONALIDAD DE MODO OSCURO/CLARO ==============

// Función para alternar entre modo oscuro y claro
function toggleTheme() {
  const body = document.body;
  const themeIcon = document.getElementById('theme-icon');
  const themeText = document.getElementById('theme-text');

  if (body.classList.contains('dark-mode')) {
    // Cambiar a modo claro
    body.classList.remove('dark-mode');
    themeIcon.textContent = '🌞';
    themeText.textContent = 'Modo Claro';
    localStorage.setItem('theme', 'light');
  } else {
    // Cambiar a modo oscuro
    body.classList.add('dark-mode');
    themeIcon.textContent = '🌙';
    themeText.textContent = 'Modo Oscuro';
    localStorage.setItem('theme', 'dark');
  }
}

// Función para cargar la preferencia de tema guardada
function loadThemePreference() {
  const savedTheme = localStorage.getItem('theme');
  const body = document.body;
  const themeIcon = document.getElementById('theme-icon');
  const themeText = document.getElementById('theme-text');

  // Si hay una preferencia guardada, aplicarla
  if (savedTheme === 'dark') {
    body.classList.add('dark-mode');
    themeIcon.textContent = '🌙';
    themeText.textContent = 'Modo Oscuro';
  } else {
    // Por defecto modo claro
    body.classList.remove('dark-mode');
    themeIcon.textContent = '🌞';
    themeText.textContent = 'Modo Claro';
  }

  // Si no hay preferencia guardada, detectar preferencia del sistema
  if (!savedTheme) {
    const prefersDark =
      window.matchMedia &&
      window.matchMedia('(prefers-color-scheme: dark)').matches;
    if (prefersDark) {
      body.classList.add('dark-mode');
      themeIcon.textContent = '🌙';
      themeText.textContent = 'Modo Oscuro';
      localStorage.setItem('theme', 'dark');
    } else {
      localStorage.setItem('theme', 'light');
    }
  }
}

// Escuchar cambios en la preferencia del sistema
if (window.matchMedia) {
  window
    .matchMedia('(prefers-color-scheme: dark)')
    .addEventListener('change', e => {
      // Solo aplicar si no hay preferencia manual guardada
      const savedTheme = localStorage.getItem('theme');
      if (!savedTheme) {
        const body = document.body;
        const themeIcon = document.getElementById('theme-icon');
        const themeText = document.getElementById('theme-text');

        if (e.matches) {
          body.classList.add('dark-mode');
          themeIcon.textContent = '🌙';
          themeText.textContent = 'Modo Oscuro';
        } else {
          body.classList.remove('dark-mode');
          themeIcon.textContent = '🌞';
          themeText.textContent = 'Modo Claro';
        }
      }
    });
}
