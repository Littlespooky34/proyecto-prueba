# 🛡️ PortScanner PS

Script de auditoria de red defensiva desarrollado en PowerShell para la deteccion de puertos TCP abiertos en hosts locales y remotos.

## 🚀 Caracteristicas
- Deteccion rapida de puertos comunes (21, 22, 80, 135, 139, 443, 445, 3389).
- Formato de salida claro con colores segun el estado del puerto.
- Uso nativo del cmdlet Test-NetConnection (sin dependencias externas).

## 🛠️ Uso

### Escaneo basico en localhost (127.0.0.1):
.\PortScanner.ps1

### Escaneo a una IP especifica dentro de la red local:
.\PortScanner.ps1 -TargetIP 192.168.1.1
