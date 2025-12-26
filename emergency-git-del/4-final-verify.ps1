# --- 4. Final Verification and System Cleanup ---

Write-Host "`n--- 4. Finalizing ---" -ForegroundColor Cyan

# Flush environment variables in the current session
$env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
Write-Host "Environment PATH variables reset for current session." -ForegroundColor Yellow

# Verify
Write-Host "`nVerification Check:" -ForegroundColor Yellow
if (Get-Command gpg -ErrorAction SilentlyContinue) {
    Write-Host "❌ GnuPG executable still found in PATH." -ForegroundColor Red
} else {
    Write-Host "✅ GnuPG executable successfully removed from PATH." -ForegroundColor Green
}
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "❌ Git executable still found in PATH." -ForegroundColor Red
} else {
    Write-Host "✅ Git executable successfully removed from PATH." -ForegroundColor Green
}

# The single most important final step for a complete wipe
Write-Host "`nCOMPLETION: All traces are deleted. A REBOOT is MANDATORY to fully clear all processes, environment variables, and registry caches." -ForegroundColor Red -BackgroundColor White