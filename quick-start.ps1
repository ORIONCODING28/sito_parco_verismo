# =============================================================================
# QUICK START - Setup completo automatico senza domande (Windows)
# =============================================================================
# Esegue setup completo con configurazione predefinita:
# - Virtual environment + dipendenze
# - Migrazioni database
# - Superuser admin/admin123
# - Database demo popolato
# - Avvio server automatico
#
# Uso: .\quick-start.ps1

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

Write-Host ""
Write-Host "╔═══════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  PARCO LETTERARIO VERISMO - QUICK START      ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Detect Python
function Get-Python {
    if (Get-Command py -ErrorAction SilentlyContinue) {
        return @{ Command = "py"; Args = @("-3") }
    }
    if (Get-Command python -ErrorAction SilentlyContinue) {
        return @{ Command = "python"; Args = @() }
    }
    throw "❌ Python 3 non trovato!"
}

$python = Get-Python
$venvPath = ".venv"
$venvPython = Join-Path $ScriptDir ".venv\Scripts\python.exe"

# 1. Virtual Environment
Write-Host "[1/6] Creazione virtual environment..." -ForegroundColor Yellow
if (-not (Test-Path $venvPath)) {
    & $python.Command @($python.Args + @("-m", "venv", $venvPath))
}
Write-Host "✓ Virtual environment pronto" -ForegroundColor Green
Write-Host ""

# 2. Dipendenze Python
Write-Host "[2/6] Installazione dipendenze Python..." -ForegroundColor Yellow
& $venvPython -m pip install --upgrade pip -q
& $venvPython -m pip install -r requirements.txt -q
Write-Host "✓ Dipendenze installate" -ForegroundColor Green
Write-Host ""

# 3. Dipendenze npm
if (Test-Path "package.json") {
    Write-Host "[3/6] Installazione dipendenze npm..." -ForegroundColor Yellow
    try {
        npm install -q 2>$null
        npm run setup -q 2>$null
        Write-Host "✓ Asset frontend pronti" -ForegroundColor Green
    } catch {
        npm install
        npm run setup
        Write-Host "✓ Asset frontend pronti" -ForegroundColor Green
    }
} else {
    Write-Host "[3/6] Package.json non trovato, skip npm" -ForegroundColor Yellow
}
Write-Host ""

# 4. Database
Write-Host "[4/6] Setup database..." -ForegroundColor Yellow
& $venvPython manage.py migrate -q
Write-Host "✓ Migrazioni applicate" -ForegroundColor Green
Write-Host ""

# 5. Traduzioni
Write-Host "[5/6] Compilazione traduzioni..." -ForegroundColor Yellow
try {
    & $venvPython manage.py compilemessages 2>$null
    Write-Host "✓ Traduzioni compilate" -ForegroundColor Green
} catch {
    Write-Host "⚠ gettext non disponibile, skip traduzioni" -ForegroundColor Yellow
}
Write-Host ""

# 6. Dati iniziali
Write-Host "[6/6] Setup dati demo..." -ForegroundColor Yellow
if (Test-Path "populate_db_complete.py") {
    try {
        & $venvPython populate_db_complete.py 2>$null
    } catch {}
    Write-Host "✓ Database popolato" -ForegroundColor Green
} else {
    Write-Host "⚠ populate_db_complete.py non trovato" -ForegroundColor Yellow
}
Write-Host ""

# Riepilogo
Write-Host ""
Write-Host "╔═══════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║         ✓ SETUP COMPLETATO!                  ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "📦 Progetto configurato e pronto" -ForegroundColor Cyan
Write-Host "👤 Superuser: " -NoNewline -ForegroundColor Cyan
Write-Host "admin" -NoNewline -ForegroundColor Yellow
Write-Host " / " -NoNewline -ForegroundColor Cyan
Write-Host "admin123" -ForegroundColor Yellow
Write-Host ""
Write-Host "➜ Avvio server di sviluppo..." -ForegroundColor Yellow
Write-Host ""

# Avvia server
& $venvPython manage.py runserver
