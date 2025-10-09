# Script para refactorizar todas las páginas HTML y extraer CSS a archivos externos
# Ejecutar desde la carpeta raíz del proyecto HTML

param(
    [string]$PagesPath = "pages",
    [switch]$DryRun = $false
)

Write-Host "🎨 Script de Refactorización CSS para Curso 365" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan

# Verificar que existen las carpetas necesarias
if (!(Test-Path $PagesPath)) {
    Write-Error "No se encontró la carpeta de páginas: $PagesPath"
    exit 1
}

if (!(Test-Path "css")) {
    Write-Error "No se encontró la carpeta css. Ejecute el script desde la carpeta HTML/"
    exit 1
}

# Mapeo de páginas a temas CSS
$PageThemeMapping = @{
    # SharePoint
    "resumen_sharepoint.html" = "sharepoint"
    "arquitectura_contenedores.html" = "sharepoint" 
    "intranet.html" = "sharepoint"
    "sitio_comunicacion.html" = "sharepoint"
    "sitio_colaboracion.html" = "sharepoint"
    "adm_sharepoint.html" = "sharepoint"
    
    # Exchange/Correo
    "adm_exchange.html" = "exchange"
    "flujo_correo.html" = "exchange"
    "reglas_coreo.html" = "exchange"
    "dominios_remotos_aceptados.html" = "exchange"
    "conectores.html" = "exchange"
    "uso_compartido.html" = "exchange"
    "salas.html" = "exchange"
    
    # Administración
    "agregar_dominios.html" = "administracion"
    "soporte_tecnico.html" = "administracion"
    
    # Identidad
    "usuario_invitado.html" = "identidad"
    "usuarios_mail.html" = "identidad"
    "grupos.html" = "identidad"
    "usuarios_activos.html" = "identidad"
    
    # Seguridad
    "roles.html" = "seguridad"
    
    # Licenciamiento
    "asignacion_licencias.html" = "licenciamiento"
    
    # Arquitectura
    "resumen_general.html" = "arquitectura"
    "resumenD1.html" = "arquitectura"
}

# Obtener todas las páginas HTML
$htmlFiles = Get-ChildItem -Path $PagesPath -Filter "*.html"

Write-Host "📁 Encontradas $($htmlFiles.Count) páginas HTML" -ForegroundColor Green

foreach ($file in $htmlFiles) {
    $fileName = $file.Name
    $theme = $PageThemeMapping[$fileName]
    
    if (!$theme) {
        Write-Warning "⚠️  No se encontró tema para $fileName - usando 'administracion' por defecto"
        $theme = "administracion"
    }
    
    Write-Host "🔄 Procesando: $fileName (tema: $theme)" -ForegroundColor Yellow
    
    if ($DryRun) {
        Write-Host "   [DRY RUN] Se aplicaría tema: $theme" -ForegroundColor Gray
        continue
    }
    
    # Leer el contenido del archivo
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    # Verificar si ya está refactorizado
    if ($content -match 'pages-base\.css') {
        Write-Host "   ✅ Ya refactorizado - saltando" -ForegroundColor Green
        continue
    }
    
    # Patrón para encontrar el bloque <style>...</style>
    $stylePattern = '(?s)<style>.*?</style>'
    
    if ($content -match $stylePattern) {
        # Crear el nuevo head con CSS externos
        $newHead = @"
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Estilos externos -->
    <link rel="stylesheet" href="../css/pages-base.css">
    <link rel="stylesheet" href="../css/themes/$theme.css">
"@
        
        # Reemplazar el bloque style con los enlaces externos
        $newContent = $content -replace $stylePattern, $newHead
        
        # Guardar el archivo modificado
        $newContent | Out-File -FilePath $file.FullName -Encoding UTF8
        
        Write-Host "   ✅ Refactorizado exitosamente" -ForegroundColor Green
    } else {
        Write-Warning "   ⚠️  No se encontró bloque <style> en $fileName"
    }
}

Write-Host "`n🎉 Refactorización completada!" -ForegroundColor Cyan
Write-Host "📊 Resumen:" -ForegroundColor Cyan
Write-Host "   - Páginas procesadas: $($htmlFiles.Count)" -ForegroundColor White
Write-Host "   - CSS base: pages-base.css" -ForegroundColor White  
Write-Host "   - Temas disponibles: $($PageThemeMapping.Values | Sort-Object -Unique | Join-String -Separator ', ')" -ForegroundColor White

Write-Host "`n💡 Para revertir cambios, usa git checkout si tienes control de versiones" -ForegroundColor Yellow
Write-Host "💡 Para probar: abre cualquier página desde el navegador" -ForegroundColor Yellow