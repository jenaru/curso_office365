# 🚀 Instrucciones para Subir a GitHub

## 📋 Pasos para Publicar tu Proyecto

### 1. 🌐 Crear Repositorio en GitHub

1. Ve a [GitHub.com](https://github.com) e inicia sesión
2. Haz clic en **"New repository"** (botón verde)
3. Configura tu repositorio:

   - **Repository name**: `curso-microsoft-365` (o el nombre que prefieras)
   - **Description**: `📚 Plataforma educativa profesional para Microsoft 365 Administration`
   - **Visibility**: Elige Public o Private según prefieras
   - **❌ NO marques** "Add a README file" (ya tienes uno)
   - **❌ NO marques** "Add .gitignore" (ya tienes uno)
   - **❌ NO marques** "Choose a license" (ya tienes MIT)

4. Haz clic en **"Create repository"**

### 2. 📡 Conectar tu Proyecto Local

Copia y ejecuta estos comandos **uno por uno** en tu terminal PowerShell:

```powershell
# 1. Agregar el repositorio remoto (REEMPLAZA 'TU-USUARIO' por tu usuario de GitHub)
git remote add origin https://github.com/jenaru/curso_office365.git

# 2. Subir tu código al repositorio
git push -u origin master
```

### 3. ✅ Verificar que Todo Está Correcto

Después de ejecutar los comandos:

1. **Refresca tu página de GitHub** - deberías ver todos tus archivos
2. **Verifica que NO están las carpetas**: `data/` y `output/`
3. **Confirma que SÍ están**:
   - ✅ `HTML/` (tu aplicación web)
   - ✅ `markdown/` (contenido fuente)
   - ✅ `README.md` (documentación)
   - ✅ `.gitignore` (configuración)

### 4. 🌐 Activar GitHub Pages (Opcional)

Para que tu sitio web sea accesible online:

1. En tu repositorio de GitHub, ve a **Settings**
2. Scroll down hasta **"Pages"** en el menú lateral
3. En **"Source"** selecciona: **"Deploy from a branch"**
4. En **"Branch"** selecciona: **"master"**
5. En **"Folder"** selecciona: **"/ (root)"**
6. Haz clic en **"Save"**

Tu sitio estará disponible en: `https://TU-USUARIO.github.io/curso-microsoft-365/HTML/`

## 🔧 Comandos de Ejemplo Completos

**Reemplaza `TU-USUARIO` con tu nombre de usuario real de GitHub:**

```powershell
# Conectar con tu repositorio
git remote add origin https://github.com/TU-USUARIO/curso-microsoft-365.git

# Subir el proyecto
git push -u origin master
```

## 📊 Lo que se Subirá a GitHub

### ✅ **Archivos que SÍ se suben (82 archivos):**

- 📁 `HTML/` - Tu aplicación web completa (25 páginas + CSS + JS)
- 📁 `markdown/` - Contenido fuente en Markdown (25 archivos)
- 📁 `.github/` - Configuración de GitHub Copilot
- 📄 `README.md` - Documentación principal
- 📄 `.gitignore` - Configuración de archivos ignorados
- 📄 `NAVEGACION.md` - Documentación de navegación
- 📄 `update-pages.ps1` - Script de actualización

### ❌ **Archivos que NO se suben (ignorados):**

- 📁 `data/` - Videos del curso (archivos grandes .mp4)
- 📁 `output/` - Audio extraído (archivos .mp3)
- 📁 `node_modules/` - Dependencias de Node.js
- 📄 `*.log` - Archivos de log temporales

## 🎯 Ventajas de esta Configuración

1. **📦 Repositorio Limpio**: Solo código y documentación, sin archivos multimedia pesados
2. **⚡ Clonación Rápida**: Otros usuarios pueden descargar rápidamente el proyecto
3. **🔄 Versionado Eficiente**: Git maneja bien archivos de texto, no binarios grandes
4. **💰 Sin Límites**: GitHub tiene límites de tamaño, videos grandes los evitamos
5. **👥 Colaboración**: Otros desarrolladores pueden contribuir fácilmente

## 🚨 ¿Problemas? Soluciones Comunes

### Error: "remote origin already exists"

```powershell
git remote remove origin
git remote add origin https://github.com/TU-USUARIO/curso-microsoft-365.git
```

### Error: "repository not found"

- Verifica que el nombre del repositorio sea correcto
- Asegúrate de que el repositorio existe en GitHub
- Revisa tu nombre de usuario

### Error: "permission denied"

- Configura tu autenticación de GitHub
- Usa Personal Access Token en lugar de contraseña

### Configurar autenticación (si es necesario):

```powershell
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
```

## 🎉 ¡Listo!

Una vez completados estos pasos, tu **Curso Microsoft 365** estará disponible en GitHub para:

- 👥 **Compartir** con colegas y estudiantes
- 🤝 **Colaborar** con otros desarrolladores
- 📱 **Acceder** desde cualquier dispositivo via GitHub Pages
- 🔄 **Versionar** futuras actualizaciones
- ⭐ **Recibir** reconocimiento de la comunidad

**¡Tu proyecto profesional ya está listo para el mundo! 🌟**
