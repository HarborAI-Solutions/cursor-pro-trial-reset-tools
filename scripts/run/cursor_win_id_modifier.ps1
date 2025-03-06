# Windows PowerShell script for Cursor ID modification
$ErrorActionPreference = 'Stop'

# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run as Administrator!"
    exit 1
}

# Define paths
$cursorPath = "$env:APPDATA\Cursor"
$storagePath = "$cursorPath\User\globalStorage\storage.json"
$backupPath = "$cursorPath\User\globalStorage\backups"

# Create backup directory if it doesn't exist
if (-not (Test-Path $backupPath)) {
    New-Item -ItemType Directory -Path $backupPath | Out-Null
}

# Backup original storage.json
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
if (Test-Path $storagePath) {
    Copy-Item $storagePath "$backupPath\storage.json.backup_$timestamp"
}

# Generate new GUIDs
$newMachineId = [guid]::NewGuid().ToString()
$newMacMachineId = [guid]::NewGuid().ToString()
$newDevDeviceId = [guid]::NewGuid().ToString()
$newSqmId = [guid]::NewGuid().ToString()

# Create or update storage.json
$storageContent = @{
    "telemetry.machineId" = $newMachineId
    "telemetry.macMachineId" = $newMacMachineId
    "telemetry.devDeviceId" = $newDevDeviceId
    "telemetry.sqmId" = $newSqmId
} | ConvertTo-Json

Set-Content -Path $storagePath -Value $storageContent

Write-Host "Successfully reset Cursor IDs!"
