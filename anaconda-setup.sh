#!/bin/bash


# Download and install Miniconda (a lightweight version of Anaconda)

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh

bash ~/miniconda.sh -b -p ~/miniconda

rm ~/miniconda.sh


# Add conda to the system PATH

echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc


# Activate the conda base environment

conda init

conda create --name qlora python=3.9 -y

conda activate qlora 
