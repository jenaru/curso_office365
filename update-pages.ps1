# update-pages.ps1
# Script para actualizar todas las páginas HTML y añadir el script del botón automático

$pagesFolder = ".\HTML\pages"
$backButtonScript = '    <!-- Script para botón de volver -->
    <script src="../js/back-button.js"></script>'

# Obtener todas las páginas HTML
$htmlFiles = Get-ChildItem -Path $pagesFolder -Filter "*.html"

foreach ($file in $htmlFiles) {
    Write-Host "Procesando: $($file.Name)"
    
    $content = Get-Content -Path $file.FullName -Raw
    
    # 1. Añadir el script si no existe
    if ($content -notmatch "back-button\.js") {
        $content = $content -replace '(\s*<script src="https://cdn\.tailwindcss\.com"></script>)', "`$1`n$backButtonScript"
        Write-Host "  ✓ Script añadido"
    }
    
    # 2. Remover botones hardcodeados existentes
    $buttonPattern = '(?s)<button[^>]*onclick="window\.location\.href=\.\./index\.html"[^>]*>.*?</button>\s*'
    if ($content -match $buttonPattern) {
        $content = $content -replace $buttonPattern, ""
        Write-Host "  ✓ Botón hardcodeado removido"
    }
    
    # Guardar el archivo actualizado
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
}

Write-Host "`nActualización completada. Todas las páginas ahora usan el botón automático."