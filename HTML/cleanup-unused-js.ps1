# Script para limpiar archivos JavaScript y componentes no utilizados
# Ejecutar desde la carpeta HTML/

param(
    [switch]$DryRun = $false,
    [switch]$KeepBackup = $true
)

Write-Host "🧹 Script de Limpieza de Archivos No Utilizados" -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan

if ($DryRun) {
    Write-Host "🔍 MODO DRY RUN - No se realizarán cambios reales" -ForegroundColor Yellow
}

# Lista de archivos identificados como no utilizados
$unusedJsFiles = @(
    "js/component-loader.js",
    "js/template-system.js"
)

$unusedComponents = @()

# El componente back-button.html está referenciado por archivos JS no utilizados
# pero no se usa directamente, así que también es candidato
$candidateComponents = @(
    "components/back-button.html"
)

Write-Host "`n📋 Archivos marcados para eliminación:" -ForegroundColor Red
Write-Host "=====================================" -ForegroundColor Red

Write-Host "`n📄 JavaScript files:" -ForegroundColor Yellow
$unusedJsFiles | ForEach-Object { 
    Write-Host "   ❌ $_" -ForegroundColor White 
}

Write-Host "`n📁 Componente candidato (referenciado solo por JS no utilizados):" -ForegroundColor Yellow
$candidateComponents | ForEach-Object { 
    Write-Host "   ⚠️  $_" -ForegroundColor White 
}

if ($DryRun) {
    Write-Host "`n[DRY RUN] Los siguientes archivos serían eliminados:" -ForegroundColor Gray
    ($unusedJsFiles + $candidateComponents) | ForEach-Object { 
        Write-Host "   - $_" -ForegroundColor Gray 
    }
    Write-Host "`n💡 Para ejecutar la limpieza real: .\cleanup-unused-js.ps1" -ForegroundColor Cyan
    return
}

# Confirmar acción
Write-Host "`n⚠️  ¿Estás seguro de que quieres eliminar estos archivos?" -ForegroundColor Yellow
Write-Host "   Esto no se puede deshacer fácilmente." -ForegroundColor Gray
$confirmation = Read-Host "   Escribe 'SI' para continuar"

if ($confirmation -ne "SI") {
    Write-Host "❌ Operación cancelada por el usuario." -ForegroundColor Red
    return
}

# Crear backup si se solicita
if ($KeepBackup) {
    $backupDir = "backup_unused_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
    Write-Host "`n💾 Creando backup en: $backupDir" -ForegroundColor Cyan
}

# Procesar archivos JS no utilizados
Write-Host "`n🗑️  Eliminando archivos JavaScript no utilizados..." -ForegroundColor Red
foreach ($file in $unusedJsFiles) {
    if (Test-Path $file) {
        if ($KeepBackup) {
            $backupPath = Join-Path $backupDir (Split-Path $file -Leaf)
            Copy-Item $file $backupPath
            Write-Host "   💾 Backup creado: $backupPath" -ForegroundColor Gray
        }
        
        Remove-Item $file -Force
        Write-Host "   ✅ Eliminado: $file" -ForegroundColor Green
    } else {
        Write-Host "   ⚠️  No encontrado: $file" -ForegroundColor Yellow
    }
}

# Procesar componentes candidatos
Write-Host "`n🗑️  Eliminando componentes no utilizados..." -ForegroundColor Red
foreach ($component in $candidateComponents) {
    if (Test-Path $component) {
        if ($KeepBackup) {
            $backupPath = Join-Path $backupDir ("components_" + (Split-Path $component -Leaf))
            Copy-Item $component $backupPath
            Write-Host "   💾 Backup creado: $backupPath" -ForegroundColor Gray
        }
        
        Remove-Item $component -Force
        Write-Host "   ✅ Eliminado: $component" -ForegroundColor Green
        
        # Verificar si la carpeta components quedó vacía
        if (Test-Path "components") {
            $remainingComponents = Get-ChildItem "components" -File
            if ($remainingComponents.Count -eq 0) {
                Write-Host "`n📁 La carpeta 'components' está vacía. ¿Eliminarla también?" -ForegroundColor Yellow
                $removeComponentsFolder = Read-Host "   Escribe 'SI' para eliminar la carpeta vacía"
                if ($removeComponentsFolder -eq "SI") {
                    Remove-Item "components" -Force
                    Write-Host "   ✅ Carpeta 'components' eliminada" -ForegroundColor Green
                }
            }
        }
    } else {
        Write-Host "   ⚠️  No encontrado: $component" -ForegroundColor Yellow
    }
}

# Actualizar documentación
Write-Host "`n📝 Actualizando documentación..." -ForegroundColor Cyan

# Leer el archivo README si existe
$readmeFiles = @("README.md", "README_FILTROS.md")
foreach ($readmeFile in $readmeFiles) {
    if (Test-Path $readmeFile) {
        Write-Host "   📄 Revisando: $readmeFile" -ForegroundColor Gray
        # Aquí podrías agregar lógica para actualizar la documentación automáticamente
    }
}

# Resumen final
Write-Host "`n🎉 LIMPIEZA COMPLETADA!" -ForegroundColor Green
Write-Host "======================" -ForegroundColor Green

Write-Host "`n📊 Archivos eliminados:" -ForegroundColor Cyan
($unusedJsFiles + $candidateComponents) | ForEach-Object { 
    Write-Host "   ✅ $_" -ForegroundColor White 
}

if ($KeepBackup) {
    Write-Host "`n💾 Backup disponible en: $backupDir" -ForegroundColor Cyan
    Write-Host "   Para restaurar archivos: Copy-Item `"$backupDir\*`" -Destination `".`" -Recurse -Force" -ForegroundColor Gray
}

Write-Host "`n🚀 Beneficios obtenidos:" -ForegroundColor Green
Write-Host "   - Proyecto más limpio y organizado" -ForegroundColor White
Write-Host "   - Menor confusión sobre qué archivos usar" -ForegroundColor White
Write-Host "   - Mejor mantenimiento del código" -ForegroundColor White
Write-Host "   - Reducción del tamaño del proyecto" -ForegroundColor White

Write-Host "`n💡 Próximos pasos recomendados:" -ForegroundColor Yellow
Write-Host "   1. Ejecutar .\analyze-js-usage.ps1 para verificar la limpieza" -ForegroundColor Gray
Write-Host "   2. Probar algunas páginas para asegurar que todo funciona" -ForegroundColor Gray
Write-Host "   3. Actualizar documentación si es necesario" -ForegroundColor Gray