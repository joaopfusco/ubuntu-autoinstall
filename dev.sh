#!/bin/bash

set -e

# Atualiza repositórios
apt-get update

# Instala dependências básicas
apt-get install -y software-properties-common dirmngr gpg lsb-release unzip

# Instalando o Google Chrome
echo "Instalando Google Chrome..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i ./google-chrome-stable_current_amd64.deb
apt-get install -f -y
rm google-chrome-stable_current_amd64.deb
