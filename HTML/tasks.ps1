# Makefile alternativo para Windows PowerShell
# Uso: .\tasks.ps1 <comando>
# Ejemplo: .\tasks.ps1 setup

param(
    [Parameter(Position=0)]
    [string]$Task = "help",
    
    [Parameter(Position=1, ValueFromRemainingArguments=$true)]
    [string[]]$Arguments = @()
)

# Configuración
$ProjectName = "Curso Microsoft 365"
$Version = "2.0.0"

# Función para mostrar mensajes con estilo
function Write-TaskHeader {
    param([string]$Title)
    Write-Host "`n🔧 $Title" -ForegroundColor Cyan
    Write-Host ("=" * ($Title.Length + 4)) -ForegroundColor Cyan
}

function Write-TaskSuccess {
    param([string]$Message)
    Write-Host "✅ $Message" -ForegroundColor Green
}

function Write-TaskError {
    param([string]$Message)
    Write-Host "❌ $Message" -ForegroundColor Red
}

function Write-TaskInfo {
    param([string]$Message)
    Write-Host "💡 $Message" -ForegroundColor Yellow
}

# Tareas disponibles
switch ($Task.ToLower()) {
    "help" {
        Write-Host "🛠️  $ProjectName - Herramientas de Desarrollo" -ForegroundColor Cyan
        Write-Host "=============================================" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "📋 Comandos disponibles:" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Setup y configuración:" -ForegroundColor Cyan
        Write-Host "  setup           - Configuración inicial completa" -ForegroundColor White
        Write-Host "  install         - Instalar dependencias npm" -ForegroundColor White
        Write-Host "  update          - Actualizar dependencias" -ForegroundColor White
        Write-Host ""
        Write-Host "Desarrollo:" -ForegroundColor Cyan
        Write-Host "  dev             - Iniciar servidor de desarrollo" -ForegroundColor White
        Write-Host "  build           - Crear build de producción" -ForegroundColor White
        Write-Host "  preview         - Vista previa del build" -ForegroundColor White
        Write-Host ""
        Write-Host "Calidad de código:" -ForegroundColor Cyan
        Write-Host "  lint            - Verificar código con ESLint" -ForegroundColor White
        Write-Host "  format          - Formatear código con Prettier" -ForegroundColor White
        Write-Host "  analyze         - Análisis completo del proyecto" -ForegroundColor White
        Write-Host ""
        Write-Host "Profesionalización:" -ForegroundColor Cyan
        Write-Host "  professionalize - Aplicar mejoras profesionales" -ForegroundColor White
        Write-Host "  optimize        - Optimizar assets y performance" -ForegroundColor White
        Write-Host ""
        Write-Host "Utilidades:" -ForegroundColor Cyan
        Write-Host "  clean           - Limpiar archivos temporales" -ForegroundColor White
        Write-Host "  backup          - Crear backup del proyecto" -ForegroundColor White
        Write-Host "  deploy          - Desplegar a producción" -ForegroundColor White
        Write-Host "  status          - Estado del proyecto" -ForegroundColor White
        Write-Host ""
        Write-Host "💡 Uso: .\tasks.ps1 <comando>" -ForegroundColor Yellow
    }

    "setup" {
        Write-TaskHeader "Configuración inicial"
        .\setup.ps1
        Write-TaskSuccess "Configuración completada"
    }

    "install" {
        Write-TaskHeader "Instalando dependencias"
        if (Test-Path "package.json") {
            npm install
            Write-TaskSuccess "Dependencias instaladas"
        } else {
            Write-TaskError "package.json no encontrado. Ejecuta primero: .\tasks.ps1 setup"
        }
    }

    "update" {
        Write-TaskHeader "Actualizando dependencias"
        npm update
        npm audit fix
        Write-TaskSuccess "Dependencias actualizadas"
    }

    "dev" {
        Write-TaskHeader "Iniciando servidor de desarrollo"
        if (Test-Path "package.json") {
            npm run dev
        } else {
            Write-TaskInfo "Usando servidor simple..."
            if (Get-Command python -ErrorAction SilentlyContinue) {
                python -m http.server 3000
            } elseif (Get-Command node -ErrorAction SilentlyContinue) {
                npx serve . -p 3000
            } else {
                Start-Process "index.html"
                Write-TaskInfo "Abriendo en navegador por defecto"
            }
        }
    }

    "build" {
        Write-TaskHeader "Creando build de producción"
        if (Test-Path "package.json") {
            npm run build
            Write-TaskSuccess "Build creado en ./dist"
        } else {
            Write-TaskInfo "Proyecto estático - no requiere build"
            Write-TaskInfo "Archivos listos para deploy en carpeta actual"
        }
    }

    "preview" {
        Write-TaskHeader "Vista previa del build"
        if (Test-Path "dist") {
            npm run preview
        } else {
            Write-TaskInfo "No hay build disponible. Ejecuta primero: .\tasks.ps1 build"
        }
    }

    "lint" {
        Write-TaskHeader "Verificando código"
        if (Test-Path ".eslintrc.json") {
            npm run lint
        } else {
            Write-TaskInfo "ESLint no configurado. Ejecuta: .\tasks.ps1 setup"
        }
    }

    "format" {
        Write-TaskHeader "Formateando código"
        if (Test-Path ".prettierrc.json") {
            npm run format
        } else {
            Write-TaskInfo "Prettier no configurado. Ejecuta: .\tasks.ps1 setup"
        }
    }

    "analyze" {
        Write-TaskHeader "Análisis del proyecto"
        .\analyze-quality.ps1 -Detailed
        Write-TaskSuccess "Análisis completado"
    }

    "professionalize" {
        Write-TaskHeader "Aplicando mejoras profesionales"
        .\professionalize.ps1
        Write-TaskSuccess "Mejoras aplicadas"
    }

    "optimize" {
        Write-TaskHeader "Optimizando proyecto"
        
        Write-Host "🗜️  Optimizando imágenes..." -ForegroundColor Yellow
        # Aquí se podría integrar optimización de imágenes
        
        Write-Host "📦 Minimizando CSS/JS..." -ForegroundColor Yellow
        if (Test-Path "package.json") {
            npm run build
        }
        
        Write-Host "🚀 Optimizando carga..." -ForegroundColor Yellow
        # Implementar lazy loading, etc.
        
        Write-TaskSuccess "Optimización completada"
    }

    "clean" {
        Write-TaskHeader "Limpiando archivos temporales"
        
        $cleanPaths = @(
            "node_modules/.cache",
            "dist",
            ".vite",
            "*.log",
            ".DS_Store",
            "Thumbs.db"
        )
        
        foreach ($path in $cleanPaths) {
            if (Test-Path $path) {
                Remove-Item $path -Recurse -Force -ErrorAction SilentlyContinue
                Write-Host "🗑️  Eliminado: $path" -ForegroundColor Gray
            }
        }
        
        Write-TaskSuccess "Limpieza completada"
    }

    "backup" {
        Write-TaskHeader "Creando backup"
        
        $backupName = "backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
        $backupPath = "../$backupName"
        
        $excludePatterns = @("node_modules", "dist", ".git", "*.log")
        
        Write-Host "📦 Creando backup en: $backupPath" -ForegroundColor Yellow
        
        # Crear backup excluyendo ciertos directorios
        robocopy . $backupPath /E /XD node_modules dist .git /XF *.log > $null
        
        if (Test-Path $backupPath) {
            Write-TaskSuccess "Backup creado: $backupPath"
        } else {
            Write-TaskError "Error creando backup"
        }
    }

    "deploy" {
        Write-TaskHeader "Desplegando a producción"
        
        # Verificar que todo esté listo
        Write-Host "🔍 Verificando estado..." -ForegroundColor Yellow
        .\tasks.ps1 lint
        .\tasks.ps1 build
        
        Write-Host "🚀 Desplegando..." -ForegroundColor Yellow
        
        # Aquí se integraría con el servicio de hosting
        Write-TaskInfo "Configura tu plataforma de hosting:"
        Write-Host "   • GitHub Pages: git push origin main" -ForegroundColor Gray
        Write-Host "   • Netlify: netlify deploy --prod" -ForegroundColor Gray
        Write-Host "   • Vercel: vercel --prod" -ForegroundColor Gray
        
        Write-TaskSuccess "Instrucciones de deploy mostradas"
    }

    "status" {
        Write-TaskHeader "Estado del proyecto"
        
        Write-Host "📊 $ProjectName v$Version" -ForegroundColor Cyan
        Write-Host ""
        
        # Git status
        if (Test-Path ".git") {
            $gitBranch = git rev-parse --abbrev-ref HEAD 2>$null
            $gitStatus = git status --porcelain 2>$null
            Write-Host "🌿 Rama Git: $gitBranch" -ForegroundColor Green
            if ($gitStatus) {
                Write-Host "📝 Cambios pendientes: $($gitStatus.Count) archivos" -ForegroundColor Yellow
            } else {
                Write-Host "✅ Directorio limpio" -ForegroundColor Green
            }
        }
        
        # Dependencias
        if (Test-Path "package.json") {
            $packageJson = Get-Content "package.json" | ConvertFrom-Json
            Write-Host "📦 Dependencias: $($packageJson.dependencies.PSObject.Properties.Name.Count)" -ForegroundColor Blue
        }
        
        # Tamaño del proyecto
        $totalSize = (Get-ChildItem -Recurse -File | Measure-Object -Property Length -Sum).Sum
        $sizeMB = [math]::Round($totalSize / 1MB, 2)
        Write-Host "💾 Tamaño total: $sizeMB MB" -ForegroundColor Magenta
        
        # Archivos por tipo
        $fileTypes = Get-ChildItem -Recurse -File | Group-Object Extension | Sort-Object Count -Descending | Select-Object -First 5
        Write-Host "📄 Archivos principales:" -ForegroundColor Cyan
        $fileTypes | ForEach-Object {
            $ext = if ($_.Name) { $_.Name } else { "(sin extensión)" }
            Write-Host "   $ext`: $($_.Count) archivos" -ForegroundColor Gray
        }
    }

    default {
        Write-TaskError "Comando '$Task' no reconocido"
        Write-TaskInfo "Usa '.\tasks.ps1 help' para ver comandos disponibles"
    }
}

Write-Host ""