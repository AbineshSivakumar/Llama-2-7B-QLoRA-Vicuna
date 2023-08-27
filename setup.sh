#!/bin/bash

# Exit on error
set -e

# Check if Miniconda is already installed
if [ ! -d "$HOME/miniconda" ]; then
    echo "Installing Miniconda..."
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
    bash ~/miniconda.sh -b -p ~/miniconda
    rm ~/miniconda.sh
else
    echo "Miniconda is already installed."
fi

# Add Miniconda to PATH if it's not already there
if ! grep -q 'export PATH="$HOME/miniconda/bin:$PATH"' ~/.bashrc ; then
    echo "Adding Miniconda to PATH..."
    echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
else
    echo "Miniconda is already in PATH."
fi

# Initialize Conda for shell interaction (this is idempotent)
echo "Initializing Conda..."
conda init bash

# Create qlora environment if it doesn't exist
if ! conda info --envs | grep -q 'qlora'; then
    echo "Creating 'qlora' environment with Python 3.9..."
    conda create --name qlora python=3.9 -y
else
    echo "'qlora' environment already exists."
fi

# Activate the qlora environment
echo "Activating 'qlora' environment..."
conda activate qlora

# Install packages from requirements.txt if the file exists
if [ -f "requirements.txt" ]; then
    echo "Installing packages from requirements.txt..."
    pip install -r requirements.txt
else
    echo "requirements.txt not found."
fi

echo "Setup completed successfully."
