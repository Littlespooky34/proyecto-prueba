# Script básico de escaneo de puertos TCP
param (
    [string]$TargetIP = "127.0.0.1",
    [int[]]$Ports = @(21, 22, 80, 135, 139, 443, 445, 3389)
)

Write-Host "Iniciando escaneo en $TargetIP..." -ForegroundColor Cyan
Write-Host "----------------------------------------"

foreach ($Port in $Ports) {
    # Probar la conexión TCP al puerto
    $Result = Test-NetConnection -ComputerName $TargetIP -Port $Port -InformationLevel Quiet -WarningAction SilentlyContinue

    if ($Result) {
        Write-Host "[+] Puerto $Port : ABIERTO" -ForegroundColor Green
    } else {
        Write-Host "[-] Puerto $Port : Cerrado / Filtrado" -ForegroundColor Red
    }
}

Write-Host "----------------------------------------"
Write-Host "Escaneo completado." -ForegroundColor Cyan
