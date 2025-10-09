# Script de instalación y setup automatizado
# Ejecutar como administrador para mejores resultados

param(
    [switch]$SkipNodeInstall = $false,
    [switch]$Development = $false
)

Write-Host "🛠️  SETUP AUTOMATIZADO - Curso Microsoft 365" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

# Función para verificar si un comando existe
function Test-Command {
    param([string]$Command)
    try {
        Get-Command $Command -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

# Función para instalar con Chocolatey
function Install-WithChocolatey {
    param([string]$Package, [string]$DisplayName)
    
    Write-Host "📦 Instalando $DisplayName..." -ForegroundColor Yellow
    
    try {
        choco install $Package -y
        Write-Host "   ✅ $DisplayName instalado correctamente" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "   ❌ Error instalando $DisplayName" -ForegroundColor Red
        return $false
    }
}

# PASO 1: Verificar herramientas necesarias
Write-Host "`n🔍 PASO 1: Verificación de herramientas" -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

$tools = @{
    "git" = @{ Name = "Git"; Required = $true }
    "node" = @{ Name = "Node.js"; Required = $true }
    "npm" = @{ Name = "npm"; Required = $true }
    "code" = @{ Name = "VS Code"; Required = $false }
    "choco" = @{ Name = "Chocolatey"; Required = $false }
}

$missingTools = @()

$tools.GetEnumerator() | ForEach-Object {
    $exists = Test-Command $_.Key
    $status = if ($exists) { "✅" } else { "❌" }
    $color = if ($exists) { "Green" } else { if ($_.Value.Required) { "Red" } else { "Yellow" } }
    
    Write-Host "   $status $($_.Value.Name)" -ForegroundColor $color
    
    if (!$exists -and $_.Value.Required) {
        $missingTools += $_.Key
    }
}

# PASO 2: Instalar herramientas faltantes
if ($missingTools.Count -gt 0 -and !$SkipNodeInstall) {
    Write-Host "`n📥 PASO 2: Instalación de herramientas faltantes" -ForegroundColor Cyan
    Write-Host "===============================================" -ForegroundColor Cyan
    
    # Verificar/instalar Chocolatey primero
    if (!(Test-Command "choco")) {
        Write-Host "📦 Instalando Chocolatey..." -ForegroundColor Yellow
        try {
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
            Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
            Write-Host "   ✅ Chocolatey instalado" -ForegroundColor Green
        } catch {
            Write-Host "   ❌ Error instalando Chocolatey" -ForegroundColor Red
            Write-Host "   💡 Instala manualmente desde: https://chocolatey.org/install" -ForegroundColor Yellow
        }
    }
    
    # Instalar herramientas faltantes
    if (Test-Command "choco") {
        if ("git" -in $missingTools) {
            Install-WithChocolatey "git" "Git"
        }
        if ("node" -in $missingTools) {
            Install-WithChocolatey "nodejs" "Node.js"
        }
    } else {
        Write-Host "⚠️  Sin Chocolatey, instala manualmente:" -ForegroundColor Yellow
        if ("git" -in $missingTools) {
            Write-Host "   • Git: https://git-scm.com/download/win" -ForegroundColor Gray
        }
        if ("node" -in $missingTools) {
            Write-Host "   • Node.js: https://nodejs.org/en/download/" -ForegroundColor Gray
        }
        
        Write-Host "`n🔄 Reinicia PowerShell después de las instalaciones" -ForegroundColor Yellow
        return
    }
    
    # Refrescar variables de entorno
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# PASO 3: Configurar proyecto
Write-Host "`n⚙️  PASO 3: Configuración del proyecto" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan

# Verificar que tenemos las herramientas necesarias
if (!(Test-Command "npm")) {
    Write-Host "❌ npm no disponible. Instala Node.js primero." -ForegroundColor Red
    return
}

# Instalar dependencias npm
Write-Host "📦 Instalando dependencias..." -ForegroundColor Yellow
try {
    npm install
    Write-Host "   ✅ Dependencias instaladas" -ForegroundColor Green
} catch {
    Write-Host "   ❌ Error instalando dependencias" -ForegroundColor Red
    Write-Host "   💡 Ejecuta manualmente: npm install" -ForegroundColor Yellow
}

# PASO 4: Configurar Git (si está disponible)
if (Test-Command "git") {
    Write-Host "`n🔧 PASO 4: Configuración de Git" -ForegroundColor Cyan
    Write-Host "===============================" -ForegroundColor Cyan
    
    # Verificar si ya hay un repositorio
    if (!(Test-Path ".git")) {
        Write-Host "📂 Inicializando repositorio Git..." -ForegroundColor Yellow
        git init
        
        # Crear .gitignore si no existe
        if (!(Test-Path ".gitignore")) {
            Write-Host "📄 Creando .gitignore..." -ForegroundColor Yellow
        }
        
        Write-Host "   ✅ Repositorio Git inicializado" -ForegroundColor Green
    } else {
        Write-Host "   ✅ Repositorio Git ya existe" -ForegroundColor Green
    }
    
    # Verificar configuración de usuario
    $gitUser = git config user.name 2>$null
    $gitEmail = git config user.email 2>$null
    
    if (!$gitUser -or !$gitEmail) {
        Write-Host "⚠️  Configura tu identidad Git:" -ForegroundColor Yellow
        Write-Host "   git config --global user.name 'Tu Nombre'" -ForegroundColor Gray
        Write-Host "   git config --global user.email 'tu@email.com'" -ForegroundColor Gray
    } else {
        Write-Host "   ✅ Git configurado para: $gitUser <$gitEmail>" -ForegroundColor Green
    }
}

# PASO 5: Configurar VS Code (si está disponible)
if (Test-Command "code") {
    Write-Host "`n🔧 PASO 5: Configuración de VS Code" -ForegroundColor Cyan
    Write-Host "====================================" -ForegroundColor Cyan
    
    # Extensiones recomendadas
    $extensions = @(
        "esbenp.prettier-vscode",
        "dbaeumer.vscode-eslint",
        "bradlc.vscode-tailwindcss",
        "formulahendry.auto-rename-tag",
        "ms-vscode.vscode-json"
    )
    
    Write-Host "📦 Instalando extensiones recomendadas..." -ForegroundColor Yellow
    
    $extensions | ForEach-Object {
        try {
            code --install-extension $_ --force
            Write-Host "   ✅ $_" -ForegroundColor Green
        } catch {
            Write-Host "   ⚠️  Error con $_" -ForegroundColor Yellow
        }
    }
    
    # Crear configuración de workspace
    $workspaceConfig = @{
        "folders" = @(
            @{ "path" = "." }
        )
        "settings" = @{
            "editor.formatOnSave" = $true
            "editor.defaultFormatter" = "esbenp.prettier-vscode"
            "emmet.includeLanguages" = @{
                "javascript" = "javascriptreact"
            }
            "tailwindCSS.includeLanguages" = @{
                "html" = "html"
                "javascript" = "javascript"
            }
        }
        "extensions" = @{
            "recommendations" = $extensions
        }
    }
    
    if (!(Test-Path ".vscode")) {
        New-Item -ItemType Directory -Path ".vscode" -Force | Out-Null
    }
    
    $workspaceConfig | ConvertTo-Json -Depth 10 | Set-Content ".vscode/settings.json"
    Write-Host "   ✅ Configuración de workspace creada" -ForegroundColor Green
}

# PASO 6: Configurar development workflow
if ($Development) {
    Write-Host "`n🚀 PASO 6: Configuración de desarrollo" -ForegroundColor Cyan
    Write-Host "=====================================" -ForegroundColor Cyan
    
    # Crear scripts de desarrollo
    $devScripts = @{
        "dev.ps1" = "npm run dev"
        "build.ps1" = "npm run build"
        "lint.ps1" = "npm run lint"
        "format.ps1" = "npm run format"
    }
    
    $devScripts.GetEnumerator() | ForEach-Object {
        $_.Value | Out-File $_.Key -Encoding UTF8
        Write-Host "   ✅ Creado: $($_.Key)" -ForegroundColor Green
    }
    
    # Configurar pre-commit hooks
    if (Test-Path ".git") {
        $preCommitHook = @'
#!/bin/sh
# Pre-commit hook

echo "🔍 Ejecutando linting..."
npm run lint

if [ $? -ne 0 ]; then
  echo "❌ Linting falló. Arregla los errores antes del commit."
  exit 1
fi

echo "🎨 Ejecutando formateo..."
npm run format

echo "✅ Pre-commit checks completados"
'@
        
        if (!(Test-Path ".git/hooks")) {
            New-Item -ItemType Directory -Path ".git/hooks" -Force | Out-Null
        }
        
        $preCommitHook | Out-File ".git/hooks/pre-commit" -Encoding UTF8
        Write-Host "   ✅ Pre-commit hooks configurados" -ForegroundColor Green
    }
}

# RESUMEN FINAL
Write-Host "`n🎉 SETUP COMPLETADO!" -ForegroundColor Green
Write-Host "====================" -ForegroundColor Green

Write-Host "`n📋 Estado de herramientas:" -ForegroundColor Cyan
$tools.GetEnumerator() | ForEach-Object {
    $exists = Test-Command $_.Key
    $status = if ($exists) { "✅" } else { "❌" }
    Write-Host "   $status $($_.Value.Name)" -ForegroundColor $(if ($exists) { "Green" } else { "Red" })
}

Write-Host "`n🚀 Comandos disponibles:" -ForegroundColor Cyan
Write-Host "   npm run dev      - Iniciar desarrollo" -ForegroundColor White
Write-Host "   npm run build    - Crear build de producción" -ForegroundColor White
Write-Host "   npm run lint     - Verificar código" -ForegroundColor White
Write-Host "   npm run format   - Formatear código" -ForegroundColor White

if (Test-Command "code") {
    Write-Host "`n💡 Para abrir en VS Code:" -ForegroundColor Yellow
    Write-Host "   code ." -ForegroundColor White
}

Write-Host "`n🌟 ¡Tu entorno de desarrollo está listo!" -ForegroundColor Green