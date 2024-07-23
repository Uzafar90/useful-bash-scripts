#!/bin/bash

# Function to execute a command and check its status
execute_command() {
    local COMMAND="$1"
    echo "Executing: $COMMAND"
    if eval "$COMMAND"; then
        echo "Success: $COMMAND"
    else
        echo "Error: $COMMAND"
        exit 1
    fi
}

# Update the package list
execute_command "sudo apt-get update"

# Upgrade all installed packages to their latest versions
execute_command "sudo apt-get upgrade -y"

# Perform a distribution upgrade
execute_command "sudo apt-get dist-upgrade -y"

# Remove unnecessary packages
execute_command "sudo apt-get autoremove -y"

# Clean up the local repository of retrieved package files
execute_command "sudo apt-get clean"

# Install additional packages
execute_command "sudo apt install neofetch screenfetch btop htop nano wget curl -y"

echo "Update complete!"
exit 0