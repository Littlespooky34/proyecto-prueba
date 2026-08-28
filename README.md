# 🛡️ PowerShell Network & Systems Audit Toolkit

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B%20%7C%207%2B-blue?style=flat-square&logo=powershell)
![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=flat-square&logo=windows)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

Colección de herramientas nativas desarrolladas en **PowerShell** diseñadas para la auditoría de red local, análisis de servicios y administración defensiva de sistemas sin requerir dependencias de terceros.

---

## 🛠️ Herramientas del Toolkit

| Script | Tipo de Operación | Descripción Principal |
| :--- | :--- | :--- |
| **`PortScanner.ps1`** | Auditoría de Host | Identifica puertos TCP y servicios activos en una IP objetivo. |
| **`NetScanner.ps1`** | Reconocimiento | Mapea dispositivos activos, resoluciones DNS y direcciones MAC en la subred local. |

---

## 🚀 Requisitos de Ejecución

- **Sistema Operativo:** Windows 10 / 11 o Windows Server.
- **Entorno:** PowerShell 5.1 o PowerShell 7+.
- **Permisos:** Habilitar la ejecución de scripts locales en tu sesión:
  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process


📖 Guía de Uso
1. Escáner de Puertos TCP (PortScanner.ps1)
Inspecciona un host específico contra los puertos TCP más utilizados (21, 22, 80, 135, 139, 443, 445, 3389).

PowerShell
.\PortScanner.ps1 -TargetIP "127.0.0.1"
2. Descubrimiento Rápido de Subred (NetScanner.ps1)
Ejecuta un barrido en paralelo en la subred /24 seleccionada para obtener:

Estado del Host (ICMP Ping).

Nombre de Host (DNS Inverso).

Dirección Física (Tabla de caché ARP local).

PowerShell
.\NetScanner.ps1 -Subnet "192.168.1"
🔒 Descargo de Responsabilidad
Este proyecto ha sido desarrollado exclusivamente con fines educativos, de laboratorio personal y auditorías internas autorizadas.