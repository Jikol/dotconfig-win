# Simple Functions
function Clear-Console { clear }
function Invoke-Wsl-Ls { wsl exec exa --icons }
function Invoke-Wsl-Ll { wsl exec exa -l --icons }
function Invoke-Wsl-La { wsl exec exa -la --icons }
function Invoke-Wsl-Dev { wsl exec tmux new-session -A -s dev }
function Invoke-Wsl-Conf { wsl exec tmux new-session -A -s conf }

# Wrapper Functions
function Invoke-Ssh-Wrapper {
    param ([string]$command)
    if ($command -eq "ls") {
        & "$env:USERPROFILE\.config\powershell\ls_ssh.ps1"  
    } else {
        ssh $command
    }
}

# Prompt
Import-Module posh-git
oh-my-posh init pwsh --config $env:USERPROFILE\.config\omp\fluent.json | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+h'

# Simple Alias
Set-Alias sudo gsudo
Set-Alias vim nvim
Set-Alias ip ipconfig

# Functions Alias
Set-Alias ll Invoke-Wsl-Ll
Set-Alias ls Invoke-Wsl-Ls
Set-Alias la Invoke-Wsl-La
Set-Alias dev Invoke-Wsl-Dev
Set-Alias conf Invoke-Wsl-Conf
Set-Alias ssh Invoke-Ssh-Wrapper

# Program Alias
Set-Alias less "$env:USERPROFILE\scoop\apps\git\current\usr\bin\less.exe"
Set-Alias which "$env:USERPROFILE\scoop\apps\git\current\usr\bin\which.exe"
Set-Alias tail "$env:USERPROFILE\scoop\apps\git\current\usr\bin\tail.exe"
Set-Alias mkdir "$env:USERPROFILE\scoop\apps\git\current\usr\bin\mkdir.exe"
Set-Alias rm "$env:USERPROFILE\scoop\apps\git\current\usr\bin\rm.exe" 
Set-Alias touch "$env:USERPROFILE\scoop\apps\git\current\usr\bin\touch.exe" 

# Environment Variables
Set-Variable "CONFIG_VIM" "$env:USERPROFILE\AppData\Local\nvim\init.vim"
Set-Variable "CONFIG_POWERSHELL" "$env:USERPROFILE\.config\powershell\user_profile.ps1"

# Autocompletions
Invoke-Expression -Command "$env:USERPROFILE\.config\powershell\task.ps1"

# Entrypoint
Clear-Console
