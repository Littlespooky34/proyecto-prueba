param([string]$Subnet = "192.168.1")
Write-Host "Iniciando escaneo ultra rapido en: $Subnet.0/24..." -ForegroundColor Cyan
1..254 | ForEach-Object -Parallel {
    $IP = "$($using:Subnet).$_"
    if (Test-Connection -TargetName $IP -Count 1 -TimeoutSeconds 1 -Quiet) {
        try { $HostName = [System.Net.Dns]::GetHostEntry($IP).HostName } catch { $HostName = "$IP" }
        [PSCustomObject]@{ IP = $IP; HostName = $HostName }
    }
} -ThrottleLimit 50 | ForEach-Object {
    $IP = $_.IP
    $HostName = $_.HostName
    $MAC = "Sin registro ARP"
    $ArpOutput = arp -a $IP | Out-String
    if ($ArpOutput -match "([0-9a-f]{2}[-:][0-9a-f]{2}[-:][0-9a-f]{2}[-:][0-9a-f]{2}[-:][0-9a-f]{2}[-:][0-9a-f]{2})") {
        $MAC = $Matches[1].ToUpper()
    }
    Write-Host "[+] Activo: $IP | Host: $HostName | MAC: $MAC" -ForegroundColor Green
}