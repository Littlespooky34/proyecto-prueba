# =======================================================
# NetScanner PS (Fast Multithreaded) - Descubrimiento Rapido
# =======================================================
param(
    [string]$Subnet = "192.168.1"
)

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host " [?] Iniciando escaneo ultra rapido en: $Subnet.0/24" -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan

# Disparar hilos paralelos para las 254 IPs
$Jobs = 1..254 | ForEach-Object -Parallel {
    $IP = "$($using:Subnet).$_"
    
    # Test-Connection ultrarrapido (1 paquete, 100ms timeout)
    if (Test-Connection -TargetName $IP -Count 1 -TimeoutSeconds 1 -Quiet) {
        
        try {
            $HostName = [System.Net.Dns]::GetHostEntry($IP).HostName
        } catch {
            $HostName = "$IP"
        }

        [PSCustomObject]@{
            IP       = $IP
            HostName = $HostName
        }
    }
} -ThrottleLimit 50 # 50 hilos simultaneos

# Procesar resultados y extraer MACs desde la tabla ARP local
$Dispositivos = foreach ($Target in $Jobs) {
    $IP = $Target.IP
    $HostName = $Target.HostName
    
    $MAC = "Sin registro ARP"
    $ArpOutput = arp -a $IP | Out-String
    if ($ArpOutput -match "([0-9a-f]{2}[-:][0-9a-f]{2}[-:][0-9a-f]{2}[-:][0-9a-f]{2}[-:][0-9a-f]{2}[-:][0-9a-f]{2})") {
        $MAC = $Matches[1].ToUpper()
    }

    Write-Host "[+] Activo: $IP `| Host: $HostName `| MAC: $MAC" -ForegroundColor Green
    
    [PSCustomObject]@{
        IP       = $IP
        HostName = $HostName
        MAC      = $MAC
    }
}

Write-Host "-------------------------------------------------------" -ForegroundColor Yellow
Write-Host "[i] Resumen: Se encontraron $($Dispositivos.Count) dispositivos activos." -ForegroundColor Yellow

