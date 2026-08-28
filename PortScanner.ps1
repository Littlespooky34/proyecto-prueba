param([string]$TargetIP = "127.0.0.1")
$Ports = @(21, 22, 80, 135, 139, 443, 445, 3389)
Write-Host "Iniciando escaneo de puertos TCP en $TargetIP..." -ForegroundColor Cyan
foreach ($Port in $Ports) {
    $Result = Test-NetConnection -ComputerName $TargetIP -Port $Port -WarningAction SilentlyContinue
    if ($Result.TcpTestSucceeded) {
        Write-Host "[+] Puerto $Port : ABIERTO" -ForegroundColor Green
    } else {
        Write-Host "[-] Puerto $Port : Cerrado" -ForegroundColor Red
    }
}