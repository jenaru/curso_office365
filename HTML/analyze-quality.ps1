# Script de análisis de calidad del proyecto
# Ejecutar desde la carpeta raíz del proyecto

param(
    [switch]$Detailed = $false,
    [switch]$FixIssues = $false
)

Write-Host "🔍 ANÁLISIS DE CALIDAD - Curso Microsoft 365" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# Función para contar líneas de código
function Get-LineCount {
    param([string]$Path, [string[]]$Extensions)
    $totalLines = 0
    $fileCount = 0
    
    foreach ($ext in $Extensions) {
        $files = Get-ChildItem -Path $Path -Filter "*.$ext" -Recurse -ErrorAction SilentlyContinue
        foreach ($file in $files) {
            $lines = (Get-Content $file.FullName | Measure-Object -Line).Lines
            $totalLines += $lines
            $fileCount++
            if ($Detailed) {
                Write-Host "   📄 $($file.Name): $lines líneas" -ForegroundColor Gray
            }
        }
    }
    
    return @{
        Files = $fileCount
        Lines = $totalLines
    }
}

# Función para analizar CSS
function Test-CSSQuality {
    Write-Host "`n🎨 ANÁLISIS CSS" -ForegroundColor Yellow
    Write-Host "===============" -ForegroundColor Yellow
    
    $cssPath = "css"
    if (!(Test-Path $cssPath)) {
        Write-Host "❌ No se encontró carpeta CSS" -ForegroundColor Red
        return
    }
    
    $cssStats = Get-LineCount -Path $cssPath -Extensions @("css")
    Write-Host "📊 CSS: $($cssStats.Files) archivos, $($cssStats.Lines) líneas" -ForegroundColor Green
    
    # Analizar modularidad
    $cssFiles = Get-ChildItem $cssPath -Filter "*.css"
    $themeFiles = $cssFiles | Where-Object { $_.Name -like "*-theme.css" }
    
    Write-Host "📁 Archivos CSS:" -ForegroundColor Cyan
    Write-Host "   Base: pages-base.css" -ForegroundColor Green
    Write-Host "   Temas: $($themeFiles.Count) archivos" -ForegroundColor Green
    
    if ($Detailed) {
        $themeFiles | ForEach-Object {
            $size = [math]::Round((Get-Item $_.FullName).Length / 1KB, 2)
            Write-Host "     • $($_.Name) ($size KB)" -ForegroundColor Gray
        }
    }
    
    # Verificar duplicación
    $duplicateCheck = @()
    $cssFiles | ForEach-Object {
        $content = Get-Content $_.FullName -Raw
        if ($content -match "\.document-container" -and $_.Name -ne "pages-base.css") {
            $duplicateCheck += $_.Name
        }
    }
    
    if ($duplicateCheck.Count -gt 0) {
        Write-Host "⚠️  Posibles duplicaciones en: $($duplicateCheck -join ', ')" -ForegroundColor Yellow
    } else {
        Write-Host "✅ No se detectaron duplicaciones CSS" -ForegroundColor Green
    }
}

# Función para analizar JavaScript
function Test-JSQuality {
    Write-Host "`n⚡ ANÁLISIS JAVASCRIPT" -ForegroundColor Yellow
    Write-Host "======================" -ForegroundColor Yellow
    
    $jsPath = "js"
    if (!(Test-Path $jsPath)) {
        Write-Host "❌ No se encontró carpeta JS" -ForegroundColor Red
        return
    }
    
    $jsStats = Get-LineCount -Path $jsPath -Extensions @("js")
    Write-Host "📊 JavaScript: $($jsStats.Files) archivos, $($jsStats.Lines) líneas" -ForegroundColor Green
    
    # Analizar archivos específicos
    $jsFiles = Get-ChildItem $jsPath -Filter "*.js"
    $jsFiles | ForEach-Object {
        $size = [math]::Round((Get-Item $_.FullName).Length / 1KB, 2)
        $lines = (Get-Content $_.FullName | Measure-Object -Line).Lines
        
        switch ($_.Name) {
            "index.js" {
                Write-Host "   📄 $($_.Name): $lines líneas ($size KB) - Sistema de navegación ✅" -ForegroundColor Green
            }
            "back-button.js" {
                Write-Host "   📄 $($_.Name): $lines líneas ($size KB) - Navegación automática ✅" -ForegroundColor Green
            }
            default {
                Write-Host "   📄 $($_.Name): $lines líneas ($size KB) - Verificar uso" -ForegroundColor Yellow
            }
        }
    }
    
    # Verificar configuración de páginas
    if (Test-Path "js/index.js") {
        $indexContent = Get-Content "js/index.js" -Raw
        $pageMatches = [regex]::Matches($indexContent, '\{[^}]*file:\s*["`'']([^"`'']+)["`'']')
        $registeredPages = $pageMatches | ForEach-Object { $_.Groups[1].Value }
        
        Write-Host "`n📋 Páginas registradas: $($registeredPages.Count)" -ForegroundColor Cyan
        
        if ($Detailed) {
            $registeredPages | ForEach-Object {
                $exists = Test-Path "pages/$_"
                $status = if ($exists) { "✅" } else { "❌" }
                Write-Host "     $status $_" -ForegroundColor $(if ($exists) { "Green" } else { "Red" })
            }
        }
    }
}

# Función para analizar HTML
function Test-HTMLQuality {
    Write-Host "`n📄 ANÁLISIS HTML" -ForegroundColor Yellow
    Write-Host "=================" -ForegroundColor Yellow
    
    $htmlStats = Get-LineCount -Path "." -Extensions @("html")
    Write-Host "📊 HTML: $($htmlStats.Files) archivos, $($htmlStats.Lines) líneas" -ForegroundColor Green
    
    # Analizar páginas
    if (Test-Path "pages") {
        $pageFiles = Get-ChildItem "pages" -Filter "*.html"
        Write-Host "📁 Páginas en /pages: $($pageFiles.Count)" -ForegroundColor Cyan
        
        # Verificar estructura estándar
        $standardComponents = @(
            "back-button.js",
            "Tailwind CSS",
            "dark theme"
        )
        
        $analysisResults = @()
        
        $pageFiles | ForEach-Object {
            $content = Get-Content $_.FullName -Raw
            $analysis = @{
                Name = $_.Name
                HasBackButton = $content -match "back-button\.js"
                HasTailwind = $content -match "tailwindcss"
                HasDarkTheme = $content -match "bg-gray-900|dark:"
                Size = [math]::Round((Get-Item $_.FullName).Length / 1KB, 2)
            }
            $analysisResults += $analysis
        }
        
        # Estadísticas de conformidad
        $withBackButton = ($analysisResults | Where-Object { $_.HasBackButton }).Count
        $withTailwind = ($analysisResults | Where-Object { $_.HasTailwind }).Count
        $withDarkTheme = ($analysisResults | Where-Object { $_.HasDarkTheme }).Count
        
        Write-Host "`n📊 Conformidad con estándares:" -ForegroundColor Cyan
        Write-Host "   🔙 Back Button: $withBackButton/$($pageFiles.Count) ($(($withBackButton/$pageFiles.Count*100).ToString('F1'))%)" -ForegroundColor $(if ($withBackButton -eq $pageFiles.Count) { "Green" } else { "Yellow" })
        Write-Host "   🎨 Tailwind CSS: $withTailwind/$($pageFiles.Count) ($(($withTailwind/$pageFiles.Count*100).ToString('F1'))%)" -ForegroundColor $(if ($withTailwind -eq $pageFiles.Count) { "Green" } else { "Yellow" })
        Write-Host "   🌙 Dark Theme: $withDarkTheme/$($pageFiles.Count) ($(($withDarkTheme/$pageFiles.Count*100).ToString('F1'))%)" -ForegroundColor $(if ($withDarkTheme -eq $pageFiles.Count) { "Green" } else { "Yellow" })
        
        if ($Detailed) {
            Write-Host "`n📄 Detalle por página:" -ForegroundColor Cyan
            $analysisResults | ForEach-Object {
                $status = ""
                $status += if ($_.HasBackButton) { "🔙" } else { "❌" }
                $status += if ($_.HasTailwind) { "🎨" } else { "❌" }
                $status += if ($_.HasDarkTheme) { "🌙" } else { "❌" }
                
                Write-Host "     $status $($_.Name) ($($_.Size) KB)" -ForegroundColor Gray
            }
        }
    }
}

# Función para verificar configuración profesional
function Test-ProfessionalSetup {
    Write-Host "`n🚀 CONFIGURACIÓN PROFESIONAL" -ForegroundColor Yellow
    Write-Host "=============================" -ForegroundColor Yellow
    
    $configFiles = @{
        "package.json" = "Configuración Node.js"
        ".eslintrc.json" = "Configuración ESLint"
        ".prettierrc.json" = "Configuración Prettier"
        "vite.config.js" = "Configuración Vite"
        ".gitignore" = "Configuración Git"
        "README.md" = "Documentación"
        "LICENSE" = "Licencia"
    }
    
    $configFiles.GetEnumerator() | ForEach-Object {
        $exists = Test-Path $_.Key
        $status = if ($exists) { "✅" } else { "❌" }
        $color = if ($exists) { "Green" } else { "Red" }
        
        Write-Host "   $status $($_.Key) - $($_.Value)" -ForegroundColor $color
    }
    
    # Verificar si npm está disponible
    try {
        $npmVersion = npm --version 2>$null
        if ($npmVersion) {
            Write-Host "   ✅ npm disponible (v$npmVersion)" -ForegroundColor Green
        } else {
            Write-Host "   ❌ npm no disponible" -ForegroundColor Red
        }
    } catch {
        Write-Host "   ❌ npm no disponible" -ForegroundColor Red
    }
}

# Función para calcular métricas generales
function Get-ProjectMetrics {
    Write-Host "`n📊 MÉTRICAS DEL PROYECTO" -ForegroundColor Yellow
    Write-Host "=========================" -ForegroundColor Yellow
    
    # Tamaño total
    $totalSize = 0
    Get-ChildItem -Recurse -File | ForEach-Object {
        $totalSize += $_.Length
    }
    
    $totalSizeMB = [math]::Round($totalSize / 1MB, 2)
    
    # Distribución por tipo
    $extensions = @{}
    Get-ChildItem -Recurse -File | ForEach-Object {
        $ext = $_.Extension.ToLower()
        if (!$extensions.ContainsKey($ext)) {
            $extensions[$ext] = @{ Count = 0; Size = 0 }
        }
        $extensions[$ext].Count++
        $extensions[$ext].Size += $_.Length
    }
    
    Write-Host "📦 Tamaño total: $totalSizeMB MB" -ForegroundColor Cyan
    Write-Host "📁 Distribución por tipo:" -ForegroundColor Cyan
    
    $extensions.GetEnumerator() | Sort-Object { $_.Value.Size } -Descending | ForEach-Object {
        $sizeMB = [math]::Round($_.Value.Size / 1MB, 2)
        $percentage = [math]::Round(($_.Value.Size / $totalSize) * 100, 1)
        Write-Host "   $($_.Key): $($_.Value.Count) archivos, $sizeMB MB ($percentage%)" -ForegroundColor Gray
    }
}

# Ejecutar análisis
Write-Host "🔍 Iniciando análisis completo del proyecto..." -ForegroundColor White

Test-CSSQuality
Test-JSQuality
Test-HTMLQuality
Test-ProfessionalSetup
Get-ProjectMetrics

# Recomendaciones finales
Write-Host "`n💡 RECOMENDACIONES" -ForegroundColor Yellow
Write-Host "==================" -ForegroundColor Yellow

$recommendations = @()

# Verificar si necesita profesionalización
if (!(Test-Path "package.json")) {
    $recommendations += "🚀 Ejecutar script de profesionalización"
}

# Verificar optimizaciones
if ((Get-ChildItem -Filter "*.html" -Recurse | Measure-Object).Count -gt 20) {
    $recommendations += "⚡ Implementar lazy loading de imágenes"
}

# Verificar accesibilidad
$recommendations += "♿ Agregar atributos de accesibilidad (alt, aria-label)"
$recommendations += "🔍 Implementar schema markup para SEO"
$recommendations += "📱 Verificar responsive design en móviles"

if ($recommendations.Count -eq 0) {
    Write-Host "🎉 ¡El proyecto cumple con todos los estándares!" -ForegroundColor Green
} else {
    $recommendations | ForEach-Object {
        Write-Host "   $_" -ForegroundColor White
    }
}

Write-Host "`n✅ Análisis completado!" -ForegroundColor Green