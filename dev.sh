#!/bin/bash

set -e

# Atualiza repositórios
sudo apt-get update

# Instala dependências básicas
sudo apt-get install -y software-properties-common dirmngr gpg lsb-release unzip build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# 🟦 Instala o Google Chrome
echo "Instalando Google Chrome..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# 🟪 Instala o ASDF
echo "Instalando ASDF..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
. "$HOME/.asdf/asdf.sh"

# 🐍 Instala Python 3.12 pelo ASDF
echo "Instalando plugin e Python 3.12..."
asdf plugin-add python https://github.com/danhper/asdf-python.git
asdf install python 3.12.0
asdf global python 3.12.0

# 🟩 Instala Node.js 22.3.0 pelo ASDF
echo "Instalando plugin e Node.js 22.3.0..."
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 22.3.0
asdf global nodejs 22.3.0

# 🟦 Instala .NET SDK 8.0.405 pelo ASDF
echo "Instalando plugin e .NET SDK 8.0.405..."
asdf plugin-add dotnet-core https://github.com/emersonsoares/asdf-dotnet-core.git
asdf install dotnet-core 8.0.405
asdf global dotnet-core 8.0.405

# 🧼 Limpeza
echo "Finalizando instalação..."
asdf reshim
echo "Instalação concluída com sucesso!"
