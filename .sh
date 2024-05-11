#!/bin/bash

# Define the software package name
software_package="Kelubiasstuff"

# Function to install on Linux
install_on_linux() {
    # Check if the system is running Debian-based distribution
    if [ -f /etc/debian_version ]; then
        sudo apt update
        sudo apt install -y $software_package
    # Check if the system is running Red Hat-based distribution
    elif [ -f /etc/redhat-release ]; then
        sudo yum update -y
        sudo yum install -y $software_package
    # Check if the system is running Arch Linux
    elif [ -f /etc/arch-release ]; then
        sudo pacman -Syu --noconfirm
        sudo pacman -S --noconfirm $software_package
    else
        echo "Unsupported Linux distribution. Manual installation required."
        exit 1
    fi
}

# Function to install on macOS
install_on_macos() {
    brew update
    brew install $software_package
}

# Function to install on Windows
install_on_windows() {
    # Insert Windows installation command here (e.g., Chocolatey)
    echo "Installation on Windows is not yet supported."
}

# Check the current operating system
if [ "$(uname)" == "Linux" ]; then
    install_on_linux
elif [ "$(uname)" == "Darwin" ]; then
    install_on_macos
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ] || [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    install_on_windows
else
    echo "Unsupported operating system. Manual installation required."
    exit 1
fi

echo "Installation of $software_package completed successfully!"
