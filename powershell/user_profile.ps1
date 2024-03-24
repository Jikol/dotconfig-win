# Simple Functions
function Clear-Console { clear }
function Invoke-External-Ls { bash -c "exa --icons $args" }
function Invoke-External-Ll { bash -c "exa -l --icons" }
function Invoke-External-La { bash -c "exa -la --icons" }
function Invoke-Wsl-Tmux { wsl exec tmux new-session -A -s main }
function Invoke-EmptyFile { echo $null >> $args }
function Execute-Batch-File { Start-Process "$args" -NoNewWindow }
function Invoke-Svg-Convert { inkscape -o $args[1] -w $args[2] -h $args[2] $args[0] }
function Invoke-Profile-Reload { . $env:USERPROFILE\.config\powershell\user_profile.ps1 }

# Procedural Functions
function Execute-Wsl-Nautilus { 
    $null = Remove-Job -state Completed;
    Start-Job { & wsl --exec nautilus } 
}
function Invoke-New-Wsl {
    $distro_name = $args[0]
    $path = $args[1]
    $directory = Split-Path -Path (Get-Location) -Leaf
    wsl --import $distro_name $distro_name $path;
    wsl -d $distro_name bash -c "bash /mnt/d/$directory/init.sh";
    wsl --terminate $distro_name;
}
function Invoke-Remove-Wsl { 
    $confr = Read-Host "Opravdu chcete odstranit $args distribuci? (y/n)"
    if ($confr -eq "y") {
        wsl --unregister $args
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
Set-Alias l wsl
Set-Alias sudo gsudo
Set-Alias vim nvim
Set-Alias ip ipconfig
Set-Alias htop ntop

# Functions Alias
Set-Alias ll Invoke-External-Ll
Set-Alias ls Invoke-External-Ls
Set-Alias la Invoke-External-La
Set-Alias touch Invoke-EmptyFile
Set-Alias batch Execute-Batch-File
Set-Alias li Invoke-Wsl-Tmux
Set-Alias lg Execute-Wsl-Nautilus
Set-Alias linit Invoke-New-Wsl
Set-Alias lrm Invoke-Remove-Wsl
Set-Alias ink Invoke-Svg-Convert
Set-Alias rld Invoke-Profile-Reload

# Program Alias
Set-Alias less "$env:USERPROFILE\scoop\apps\git\current\usr\bin\less.exe"
Set-Alias which "$env:USERPROFILE\scoop\apps\git\current\usr\bin\which.exe"
Set-Alias tail "$env:USERPROFILE\scoop\apps\git\current\usr\bin\tail.exe"
Set-Alias mkdir "$env:USERPROFILE\scoop\apps\git\current\usr\bin\mkdir.exe"

# Environment Variables
Set-Variable "CONFIG_VIM" "$env:USERPROFILE\AppData\Local\nvim\init.vim"
Set-Variable "CONFIG_POWERSHELL" "$env:USERPROFILE\.config\powershell\user_profile.ps1"

# Autocompletions
Invoke-Expression -Command "$env:USERPROFILE\.config\powershell\task.ps1"

# Entrypoint
Clear-Console
