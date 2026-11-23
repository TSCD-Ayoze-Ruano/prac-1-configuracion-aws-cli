Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  VERIFICACION DE ENTORNO AWS CLI" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

$Region = aws configure get region 2>$null
if (-not $Region) { $Region = "NO CONFIGURADA" }
Write-Host "[*] Region activa: $Region"

$OutputFormat = aws configure get output 2>$null
if (-not $OutputFormat) { $OutputFormat = "NO CONFIGURADO" }
Write-Host "[*] Formato de salida: $OutputFormat"

Write-Host "[*] Comprobando identidad y credenciales..."

$RawOutput = aws sts get-caller-identity --output json 2>&1

if ($LASTEXITCODE -eq 0) {
    $Identity = $RawOutput | Out-String | ConvertFrom-Json
    Write-Host "[OK] Autenticacion correcta." -ForegroundColor Green
    Write-Host "     Account ID: $($Identity.Account)"
    Write-Host "     ARN:        $($Identity.Arn)"
}
else {
    Write-Host "[ERROR] Fallo en la autenticacion de AWS." -ForegroundColor Red
    Write-Host "Detalle devuelto por AWS CLI:" -ForegroundColor Yellow
    Write-Host ($RawOutput | Out-String) -ForegroundColor DarkYellow
}

Write-Host "========================================" -ForegroundColor Cyan