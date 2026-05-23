#!/bin/bash

echo ">>> Instalando dependencias (Java)..."
sudo pacman -S --needed jre-openjdk --noconfirm

echo ">>> Instalando TLauncher..."
yay -S --noconfirm --needed --answerclean All --answerdiff None tlauncher-bin
echo ">>> TLauncher instalado"
