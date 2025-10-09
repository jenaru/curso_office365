# Script para verificar qué archivos JavaScript se están usando en el proyecto
# Ejecutar desde la carpeta HTML/

Write-Host "🔍 Análisis de Uso de Archivos JavaScript" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# Lista de archivos JS en la carpeta js/
$jsFiles = Get-ChildItem -Path "js" -Filter "*.js"
Write-Host "`n📁 Archivos JavaScript encontrados:" -ForegroundColor Green
$jsFiles | ForEach-Object { Write-Host "   - $($_.Name)" -ForegroundColor White }

# Verificar uso en archivos HTML
Write-Host "`n🔍 Verificando uso en archivos HTML..." -ForegroundColor Yellow

foreach ($jsFile in $jsFiles) {
    $fileName = $jsFile.Name
    Write-Host "`n📄 Analizando: $fileName" -ForegroundColor Cyan
    
    # Buscar referencias al archivo en todos los HTML
    $references = @()
    
    # Buscar en index.html
    $indexContent = Get-Content "index.html" -Raw -ErrorAction SilentlyContinue
    if ($indexContent -and $indexContent -match $fileName) {
        $references += "index.html"
    }
    
    # Buscar en páginas
    $pageFiles = Get-ChildItem -Path "pages" -Filter "*.html"
    foreach ($pageFile in $pageFiles) {
        $pageContent = Get-Content $pageFile.FullName -Raw -ErrorAction SilentlyContinue
        if ($pageContent -and $pageContent -match $fileName) {
            $references += "pages/$($pageFile.Name)"
        }
    }
    
    # Mostrar resultados
    if ($references.Count -gt 0) {
        Write-Host "   ✅ USADO en $($references.Count) archivo(s):" -ForegroundColor Green
        $references | ForEach-Object { Write-Host "      - $_" -ForegroundColor Gray }
    } else {
        Write-Host "   ❌ NO USADO - Candidato para eliminación" -ForegroundColor Red
    }
}

# Verificar componentes HTML
Write-Host "`n📁 Verificando componentes HTML..." -ForegroundColor Yellow

if (Test-Path "components") {
    $componentFiles = Get-ChildItem -Path "components" -Filter "*.html"
    
    foreach ($componentFile in $componentFiles) {
        $componentName = $componentFile.Name
        Write-Host "`n📄 Analizando componente: $componentName" -ForegroundColor Cyan
        
        # Buscar referencias en archivos JS
        $jsReferences = @()
        foreach ($jsFile in $jsFiles) {
            $jsContent = Get-Content $jsFile.FullName -Raw -ErrorAction SilentlyContinue
            if ($jsContent -and $jsContent -match $componentName) {
                $jsReferences += $jsFile.Name
            }
        }
        
        # Buscar referencias directas en HTML
        $htmlReferences = @()
        $allHtmlFiles = @(Get-ChildItem -Path "." -Filter "*.html") + @(Get-ChildItem -Path "pages" -Filter "*.html")
        foreach ($htmlFile in $allHtmlFiles) {
            $htmlContent = Get-Content $htmlFile.FullName -Raw -ErrorAction SilentlyContinue
            if ($htmlContent -and ($htmlContent -match $componentName -or $htmlContent -match "data-include")) {
                $htmlReferences += $htmlFile.Name
            }
        }
        
        if ($jsReferences.Count -gt 0 -or $htmlReferences.Count -gt 0) {
            Write-Host "   ✅ REFERENCIADO:" -ForegroundColor Green
            if ($jsReferences.Count -gt 0) {
                Write-Host "      📄 Por JS: $($jsReferences -join ', ')" -ForegroundColor Gray
            }
            if ($htmlReferences.Count -gt 0) {
                Write-Host "      🌐 Por HTML: $($htmlReferences -join ', ')" -ForegroundColor Gray
            }
        } else {
            Write-Host "   ❌ NO REFERENCIADO - Candidato para eliminación" -ForegroundColor Red
        }
    }
} else {
    Write-Host "   ⚠️  Carpeta 'components' no encontrada" -ForegroundColor Yellow
}

# Resumen final
Write-Host "`n📊 RESUMEN:" -ForegroundColor Cyan
Write-Host "==========" -ForegroundColor Cyan

# Contar archivos usados vs no usados
$usedJsFiles = @()
$unusedJsFiles = @()

foreach ($jsFile in $jsFiles) {
    $fileName = $jsFile.Name
    $isUsed = $false
    
    # Verificar en todos los archivos HTML
    $allHtmlFiles = @(Get-ChildItem -Path "." -Filter "*.html") + @(Get-ChildItem -Path "pages" -Filter "*.html")
    foreach ($htmlFile in $allHtmlFiles) {
        $htmlContent = Get-Content $htmlFile.FullName -Raw -ErrorAction SilentlyContinue
        if ($htmlContent -and $htmlContent -match $fileName) {
            $isUsed = $true
            break
        }
    }
    
    if ($isUsed) {
        $usedJsFiles += $fileName
    } else {
        $unusedJsFiles += $fileName
    }
}

Write-Host "✅ Archivos JS en uso: $($usedJsFiles.Count)" -ForegroundColor Green
$usedJsFiles | ForEach-Object { Write-Host "   - $_" -ForegroundColor White }

if ($unusedJsFiles.Count -gt 0) {
    Write-Host "`n❌ Archivos JS sin usar: $($unusedJsFiles.Count)" -ForegroundColor Red
    $unusedJsFiles | ForEach-Object { Write-Host "   - $_" -ForegroundColor White }
    
    Write-Host "`n💡 Recomendación:" -ForegroundColor Yellow
    Write-Host "   Considera eliminar los archivos no utilizados para mantener el proyecto limpio." -ForegroundColor Gray
} else {
    Write-Host "`n🎉 ¡Todos los archivos JavaScript están siendo utilizados!" -ForegroundColor Green
}

Write-Host "`n📝 Nota:" -ForegroundColor Cyan
Write-Host "   Este análisis se basa en referencias textuales. Archivos cargados dinámicamente" -ForegroundColor Gray
Write-Host "   podrían no detectarse correctamente." -ForegroundColor Gray