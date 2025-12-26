# --- 3. Deleting Registry Keys ---

Write-Host "`n--- 3. Deleting Registry Keys ---" -ForegroundColor Cyan

# 3.1. GnuPG Keys
# HKLM is typically for system-wide install info
Remove-Item -Path 'HKLM:\SOFTWARE\GNU\GnuPG' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path 'HKLM:\SOFTWARE\WOW6432Node\GNU\GnuPG' -Recurse -Force -ErrorAction SilentlyContinue
# HKCU is typically for user-specific settings
Remove-Item -Path 'HKCU:\SOFTWARE\GNU\GnuPG' -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Deleted GnuPG Registry Keys." -ForegroundColor Green

# 3.2. GitHub Desktop Keys
Remove-Item -Path 'HKCU:\Software\GitHub Desktop' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GitHub Desktop' -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Deleted GitHub Desktop Registry Keys." -ForegroundColor Green

# 3.3. Git Keys
Remove-Item -Path 'HKLM:\SOFTWARE\GitForWindows' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path 'HKLM:\SOFTWARE\WOW6432Node\GitForWindows' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{A920F0C0-F12D-4E15-9989-13ECB85A7E27}' -Recurse -Force -ErrorAction SilentlyContinue
# Note: The GUID for Git uninstallation varies, but this key is a common one.

# Removing Git Context Menu Entries (Git Bash Here, Git GUI Here)
# This is a common leftover annoyance.
$git_menu_paths = @(
    'HKCR:\Directory\shell\git_gui'
    'HKCR:\Directory\shell\git_shell'
    'HKCR:\Directory\Background\shell\git_gui'
    'HKCR:\Directory\Background\shell\git_shell'
)
$git_menu_paths | ForEach-Object { Remove-Item -Path $_ -Recurse -Force -ErrorAction SilentlyContinue }
Write-Host "Deleted Git and Git Context Menu Registry Keys." -ForegroundColor Green