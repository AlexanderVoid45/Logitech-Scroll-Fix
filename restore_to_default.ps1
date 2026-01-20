$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) { exit }
$regPath = "HKCU:\Software\Logitech\Gaming Software\Global Settings"
if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name "SmoothScrolling" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $regPath -Name "SmartScrolling" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $regPath -Name "WheelScrollLines" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $regPath -Name "ScrollLines" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $regPath -Name "ScrollPixels" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $regPath -Name "WheelScrollPixels" -ErrorAction SilentlyContinue
}
$altPaths = @("HKCU:\Software\Logitech\LogiOptionsPlus", "HKCU:\Software\Logitech\LogiOptions", "HKLM:\SOFTWARE\Logitech\Gaming Software\Global Settings")
foreach ($path in $altPaths) {
    if (Test-Path $path) {
        Remove-ItemProperty -Path $path -Name "SmoothScrolling" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $path -Name "SmartScrolling" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $path -Name "EnableSmoothScrolling" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $path -Name "EnableSmartScrolling" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $path -Name "WheelScrollLines" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $path -Name "ScrollLines" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $path -Name "ScrollPixels" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $path -Name "WheelScrollPixels" -ErrorAction SilentlyContinue
    }
}
$mousePath = "HKCU:\Control Panel\Mouse"
if (Test-Path $mousePath) {
    Set-ItemProperty -Path $mousePath -Name "WheelScrollLines" -Value 3 -Type DWord -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $mousePath -Name "WheelScrollPixels" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $mousePath -Name "MouseSpeed" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $mousePath -Name "MouseThreshold1" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $mousePath -Name "MouseThreshold2" -ErrorAction SilentlyContinue
}
$desktopPath = "HKCU:\Control Panel\Desktop"
if (Test-Path $desktopPath) {
    Set-ItemProperty -Path $desktopPath -Name "WheelScrollLines" -Value "3" -Type String -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $desktopPath -Name "SmoothScroll" -ErrorAction SilentlyContinue
}

