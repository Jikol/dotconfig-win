# Create symbolic links
function ln {
    param (
        [string]$Link,
        [string]$Target
    )
    if (Test-Path $Link) { Remove-Item $Link -Force -Recurse }
    New-Item -ItemType SymbolicLink -Path $Link -Target $Target | Out-Null
}

ln "$HOME\.ssh" "$HOME\.config\.ssh"
ln "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" "$HOME\.config\wt\settings.json"
ln "$HOME\Documents\PowerShell\profile.ps1" "$HOME\.config\pwsh\profile.ps1"

Write-Host "Symbolic links created!" -ForegroundColor Green

