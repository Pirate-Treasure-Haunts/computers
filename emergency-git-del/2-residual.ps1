# --- 2. Deleting Residual Folders (The 'Traces') ---

Write-Host "`n--- 2. Deleting Residual Folders (Permanent Data Loss!) ---" -ForegroundColor Cyan

# Variables for common paths
$user_profile = "$env:USERPROFILE"
$appdata_local = "$env:LOCALAPPDATA"
$appdata_roaming = "$env:APPDATA"
$program_files = "${env:ProgramFiles(x86)}"

# 2.1. GnuPG User Home Directory (Contains all keys - PRIVATE and PUBLIC)
Remove-Item -Path "$user_profile\.gnupg" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Deleted GnuPG User Home: C:\Users\$env:USERNAME\.gnupg" -ForegroundColor Green

# 2.2. GnuPG Program Files Directory (Leftover binaries, typically for Gpg4win)
Remove-Item -Path "$program_files\GnuPG" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Deleted GnuPG Program Files: $program_files\GnuPG" -ForegroundColor Green

# 2.3. GitHub Desktop Folders
Remove-Item -Path "$appdata_local\GitHubDesktop" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$appdata_roaming\GitHub Desktop" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Deleted GitHub Desktop AppData (Local and Roaming)." -ForegroundColor Green

# 2.4. Git User Configuration
Remove-Item -Path "$user_profile\.gitconfig" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$user_profile\.ssh" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Deleted Git config (.gitconfig) and .ssh folder." -ForegroundColor Green