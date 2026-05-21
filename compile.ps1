# ============================================================
#  Script de compilation LaTeX — Grenier Commun
#  Usage : clic-droit sur compile.ps1 → "Exécuter avec PowerShell"
#  Ou depuis le terminal VS Code (Ctrl+`) : .\compile.ps1
# ============================================================

$MIKTEX = "C:\Users\HP PRO\AppData\Local\Programs\MiKTeX\miktex\bin\x64"
$TEX    = "rapport_grenier_commun_complet"

Write-Host "=== GRENIER COMMUN — Compilation LaTeX ===" -ForegroundColor Green

# Vérifie que pdflatex existe
if (-not (Test-Path "$MIKTEX\pdflatex.exe")) {
    Write-Host "ERREUR: pdflatex.exe introuvable dans $MIKTEX" -ForegroundColor Red
    exit 1
}

# Étape 0 : mise à jour MiKTeX (recommandée par les logs)
Write-Host "`n[0/4] Mise à jour paquets MiKTeX..." -ForegroundColor Cyan
& "$MIKTEX\mpm.exe" --update 2>$null
Write-Host "      Terminé (ignorez les avertissements mineurs)" -ForegroundColor Gray

# Étape 1 : pdflatex (1ère passe — résout les includes et génère .aux)
Write-Host "`n[1/4] pdflatex - 1ère passe..." -ForegroundColor Cyan
& "$MIKTEX\pdflatex.exe" `
    -synctex=1 `
    -interaction=nonstopmode `
    -file-line-error `
    "$TEX.tex"

if ($LASTEXITCODE -ne 0) {
    Write-Host "      AVERTISSEMENT: sortie non-zéro ($LASTEXITCODE) — vérifiez $TEX.log" -ForegroundColor Yellow
}

# Étape 2 : biber (bibliographie)
Write-Host "`n[2/4] biber — bibliographie..." -ForegroundColor Cyan
& "$MIKTEX\biber.exe" "$TEX"

if ($LASTEXITCODE -ne 0) {
    Write-Host "      AVERTISSEMENT: biber sortie non-zéro ($LASTEXITCODE)" -ForegroundColor Yellow
}

# Étape 3 : pdflatex (2ème passe — intègre la bibliographie)
Write-Host "`n[3/4] pdflatex - 2ème passe..." -ForegroundColor Cyan
& "$MIKTEX\pdflatex.exe" `
    -synctex=1 `
    -interaction=nonstopmode `
    -file-line-error `
    "$TEX.tex"

# Étape 4 : pdflatex (3ème passe — résout les références croisées)
Write-Host "`n[4/4] pdflatex - 3ème passe..." -ForegroundColor Cyan
& "$MIKTEX\pdflatex.exe" `
    -synctex=1 `
    -interaction=nonstopmode `
    -file-line-error `
    "$TEX.tex"

# Résultat
if (Test-Path "$TEX.pdf") {
    $size = [math]::Round((Get-Item "$TEX.pdf").Length / 1MB, 2)
    Write-Host "`n=== SUCCÈS : $TEX.pdf ($size MB) ===" -ForegroundColor Green
    # Ouvre le PDF automatiquement
    Start-Process "$TEX.pdf"
} else {
    Write-Host "`n=== ECHEC : le PDF n'a pas été généré ===" -ForegroundColor Red
    Write-Host "Consultez $TEX.log pour les erreurs détaillées." -ForegroundColor Yellow
    Write-Host "Cherchez les lignes commençant par '!' dans le log." -ForegroundColor Yellow
}
