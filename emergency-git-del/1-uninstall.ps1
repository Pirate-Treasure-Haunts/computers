# --- 1. Uninstall GitHub Desktop, Git, and Gpg4win ---

# Use Get-Package to find and pipe packages to the uninstaller.
# The names below are common install names for these applications.

Write-Host "--- 1. Starting Application Uninstallation ---" -ForegroundColor Cyan

# 1.1. GitHub Desktop Uninstallation
# GitHub Desktop often uses a custom uninstall string, but Get-Package is a good first attempt.
Get-Package -Name 'GitHub Desktop' | Uninstall-Package -Force -ErrorAction SilentlyContinue | Out-Null
Write-Host "GitHub Desktop uninstallation command sent." -ForegroundColor Yellow

# 1.2. Git for Windows Uninstallation
Get-Package -Name 'Git' | Uninstall-Package -Force -ErrorAction SilentlyContinue | Out-Null
Write-Host "Git for Windows uninstallation command sent." -ForegroundColor Yellow

# 1.3. Gpg4win/GnuPG Uninstallation
Get-Package -Name 'Gpg4win*' | Uninstall-Package -Force -ErrorAction SilentlyContinue | Out-Null
Write-Host "Gpg4win/GnuPG uninstallation command sent." -ForegroundColor Yellow

Start-Sleep -Seconds 5