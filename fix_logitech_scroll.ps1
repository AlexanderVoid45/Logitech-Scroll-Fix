$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) { exit }
$regPath = "HKCU:\Software\Logitech\Gaming Software\Global Settings"
if (-not (Test-Path $regPath)) { New-Item -Path $regPath -Force | Out-Null }
Set-ItemProperty -Path $regPath -Name "SmoothScrolling" -Value 0 -Type DWord -ErrorAction SilentlyContinue
Set-ItemProperty -Path $regPath -Name "SmartScrolling" -Value 0 -Type DWord -ErrorAction SilentlyContinue
$altPaths = @("HKCU:\Software\Logitech\LogiOptionsPlus", "HKCU:\Software\Logitech\LogiOptions", "HKLM:\SOFTWARE\Logitech\Gaming Software\Global Settings")
foreach ($path in $altPaths) {
    if (Test-Path $path) {
        Set-ItemProperty -Path $path -Name "SmoothScrolling" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        Set-ItemProperty -Path $path -Name "SmartScrolling" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        Set-ItemProperty -Path $path -Name "EnableSmoothScrolling" -Value 0 -Type DWord -ErrorAction SilentlyContinue
        Set-ItemProperty -Path $path -Name "EnableSmartScrolling" -Value 0 -Type DWord -ErrorAction SilentlyContinue
    }
}
$mousePath = "HKCU:\Control Panel\Mouse"
if (Test-Path $mousePath) {
    Set-ItemProperty -Path $mousePath -Name "WheelScrollLines" -Value 1 -Type DWord -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $mousePath -Name "WheelScrollPixels" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $mousePath -Name "WheelScrollChars" -ErrorAction SilentlyContinue
} else {
    New-Item -Path $mousePath -Force | Out-Null
    Set-ItemProperty -Path $mousePath -Name "WheelScrollLines" -Value 1 -Type DWord -ErrorAction SilentlyContinue
}
$desktopPath = "HKCU:\Control Panel\Desktop"
if (Test-Path $desktopPath) {
    Set-ItemProperty -Path $desktopPath -Name "WheelScrollLines" -Value "1" -Type String -ErrorAction SilentlyContinue
    Set-ItemProperty -Path $desktopPath -Name "SmoothScroll" -Value "0" -Type String -ErrorAction SilentlyContinue
}
