#!/bin/bash

# Instalador de archy

set -e

REPO_URL="https://github.com/Edgares100IQ/archlinux-scripts.git"
INSTALL_DIR="$HOME/.local/share/archy"
WRAPPER="/usr/local/bin/archy"
# si se llama desde update_archy, el repo ya está clonado en /tmp/archy_update
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ">>> Comprobando dependencias..."

# instalar yay si no está
if ! command -v yay &>/dev/null; then
    echo "    instalando yay..."
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
    rm -rf /tmp/yay
fi

# instalar chafa si no está
if ! command -v chafa &>/dev/null; then
    echo "    instalando chafa..."
    sudo pacman -S --needed --noconfirm chafa
fi

# instalar imagemagick si no está
if ! command -v magick &>/dev/null; then
    echo "    instalando imagemagick..."
    sudo pacman -S --needed --noconfirm imagemagick
fi

# si el script se ejecuta desde el propio repo clonado, usarlo directamente
if [ -f "$SCRIPT_PATH/archy/archy.sh" ]; then
    echo ">>> Instalando desde directorio local..."
    rm -rf "$INSTALL_DIR"
    cp -r "$SCRIPT_PATH" "$INSTALL_DIR"
else
    echo ">>> Clonando repositorio..."
    rm -rf "$INSTALL_DIR"
    git clone --depth 1 "$REPO_URL" "$INSTALL_DIR"
fi

echo ">>> Dando permisos..."
chmod +x "$INSTALL_DIR/archy/archy.sh"
find "$INSTALL_DIR/archy/scripts" -name "*.sh" -exec chmod +x {} \;

echo ">>> Creando comando global..."
sudo tee "$WRAPPER" > /dev/null << EOF
#!/bin/bash
bash "$INSTALL_DIR/archy/archy.sh"
EOF
sudo chmod +x "$WRAPPER"

echo ""
echo "✓ archy instalado correctamente"
echo "  ejecuta 'archy' desde cualquier terminal para empezar"
