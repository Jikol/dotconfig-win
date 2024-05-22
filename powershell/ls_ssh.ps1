# list-ssh-aliases.ps1
function List-SshAliases {
    # Define the path to the SSH config file
    $configPath = "$HOME/.ssh/config"

    # Read the config file
    $configLines = Get-Content -Path $configPath

    # Initialize variables
    $currentHost = ""
    $hostsAndHostnames = @()

    # Process each line in the config file
    foreach ($line in $configLines) {
        if ($line -match "^Host\s+(.+)$") {
            $currentHost = $matches[1]
        } elseif ($line -match "^\s*Hostname\s+(.+)$" -and $currentHost) {
            $hostname = $matches[1]
            $hostsAndHostnames += [PSCustomObject]@{
                Host = $currentHost
                Hostname = $hostname
            }
            $currentHost = ""
        }
    }

    # Output the results
    $hostsAndHostnames | Format-Table -AutoSize
}

# Call the function
List-SshAliases
