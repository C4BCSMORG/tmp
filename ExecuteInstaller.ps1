# Überprüfen, ob das Skript mit Administratorrechten ausgeführt wird
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    Write-Warning "Das Skript wird nicht mit Administratorrechten ausgeführt. Es wird nun mit Administratorrechten neu gestartet."
    
    # Skript als Administrator neu starten
    $newProcess = Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    
    # Beenden des aktuellen Prozesses
    Exit
}

# XPhone Server Installationsverzeichnis bestimmen
$InstallDirXphone = Get-Item -Path "HKLM:\SOFTWARE\C4B\XPhoneServer" | Get-ItemPropertyValue -Name "InstallDir"

# Bestimme das Installationsverzeichnis der aktuell installierten .Net Version
$frameworkPath = Get-Item -Path "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" | Get-ItemPropertyValue -Name "InstallPath"
$executable = "$($frameworkPath)InstallUtil.exe"

$installerDlls = @(
    "AtlasExeInstaller9.dll",
    "AtlasInstaller9.dll",
    "AtlasServiceInstaller9.dll"
)

# Überprüfe, ob InstallDirXphone am Ende einen Backslash hat
if (-not $InstallDirXphone.EndsWith("\")) {
    # Falls nicht, füge einen Backslash hinzu
    $InstallDirXphone += "\"
}

$count = 0
foreach ($dll in $installerDlls) {
    $count++
    $prozent = ($count / $installerDlls.Count)*100
    Write-Progress -Activity $dll -Status "Führe Installer aus" -PercentComplete $prozent
    &"$($executable)" "$($InstallDirXphone)$($dll)" > $null    
}

Write-Output "Alle Installer ausgeführt."