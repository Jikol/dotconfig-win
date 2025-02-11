# Functions
function ls { wsl exec exa --icons }
function ll { wsl exec exa -l --icons }
function la { wsl exec exa -la --icons }
function l { wsl exec tmux new-session -A -s main }
function .. { cd .. }
function rld { . $PROFILE }

# Aliases
Set-Alias sudo gsudo
Set-Alias vim nvim
Set-Alias ip ipconfig
Set-Alias cat bat

# Modules
Import-Module -Name Microsoft.WinGet.CommandNotFound

# Variables
Set-Variable "PROFILE" "$HOME\.config\pwsh\profile.ps1"
Set-Variable "CONFIG_POWERSHELL" "$HOME\.config\pwsh\profile.ps1"
Set-Variable "CONFIG_VIM" "$HOME\AppData\Local\nvim\init.vim"

# Prompt
oh-my-posh init pwsh --config $HOME\.config\omp\fluent.json | iex

# Entrypoint
clear
