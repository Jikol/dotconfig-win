# Create symbolic links
function rm-link {
    param (
        [string]$link
    )
    if (test-path $link) {
        remove-item $link -force -recurse
    }
}

$link = "$env:USERPROFILE\.utils"
rm-link -link $link
New-Item -ItemType SymbolicLink -Path $link -Target "$env:USERPROFILE\.config\.utils"

$link = "$env:USERPROFILE\.ssh"
rm-link -link $link
New-Item -ItemType SymbolicLink -Path $link -Target "$env:USERPROFILE\.config\.ssh"

