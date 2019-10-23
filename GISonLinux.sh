#!/usr/bin/env bash
# ----------------------------- FONTES ----------------------------- #

URL_GOOGLE_EARTH_PRO="https://dl.google.com/dl/linux/direct/google-earth-pro-stable_7.3.2_amd64.deb"
URL_SPRING="http://www.dpi.inpe.br/spring/download/bin/linux/Spring5_5_5_Port_Ubuntu1604_x64.tar.gz"
URL_TERRAVIEW="http://www.dpi.inpe.br/terralib5/download/download.php?FileName=terralib-5.4.3-ubuntu-16.04.tar.gz"
URL_DRAFTSIGHT="http://www.draftsight.com/download-linux-ubuntu"


DIRETORIO_DOWNLOADS="$HOME/Downloads/GISonLinux"
# ------------------------------------------------------------------ #

# --------------------------- REQUISITOS --------------------------- #
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Atualizando o repositório ##
sudo apt update -y
# ------------------------------------------------------------------ #

# ------------------- EXECUTANDO PRÉ-REQUISITOS -------------------- #
sudo apt install snapd -y
sudo apt install flatpak
# ------------------------------------------------------------------ #

# ------------------- DOWNLOAD DE PROGRAMAS DEB -------------------- #
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_EARTH_PRO"        -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_DRAFTSIGHT"              -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

## Instalando programas do repositório APT##
sudo apt install saga -y
sudo apt install grass -y
sudo apt install hugin -y
sudo apt install gpsprune -y

##Instalando pacotes Flatpak ##
flatpak install flathub org.qgis.qgis -y
flatpak install flathub org.octave.Octave -y
flatpak install flathub org.openstreetmap.josm -y
flatpak install flathub net.oz9aec.Gpredict -y

##Instalando pacotes Snap ##
sudo snap install openmapper-desktop
sudo snap install gnss-sdr-next
# ------------------------------------------------------------------ #

# ------------------------ PÓS-INSTALAÇÃO -------------------------- #
## Finalização, atualização e limpeza do sistema ##
sudo apt update && sudo apt upgrade && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
# ------------------------------------------------------------------ #
