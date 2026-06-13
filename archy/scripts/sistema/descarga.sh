#!/bin/bash

# ── descarga rapida con aria2c ─────────────────────────────────

# instalar aria2 si no está
if ! command -v aria2c &>/dev/null; then
    echo ">>> aria2 no encontrado, instalando..."
    sudo pacman -S --noconfirm aria2
fi

echo ""
echo "============================================"
echo "  📥 Descarga rápida (aria2c)"
echo "============================================"
echo ""
echo "Pega el link de descarga:"
read -r url

if [ -z "$url" ]; then
    echo "no has introducido ningún link"
    read -p "pulsa enter para continuar..."
    exit 1
fi

echo ""
echo "Nombre del archivo (deja vacío para automático):"
read -r nombre

echo ""
echo ">>> iniciando descarga..."
echo ""

if [ -n "$nombre" ]; then
    aria2c -x 16 -s 16 --console-log-level=notice -o "$nombre" "$url"
else
    aria2c -x 16 -s 16 --console-log-level=notice "$url"
fi

echo ""
if [ $? -eq 0 ]; then
    echo "✅ descarga completada"
else
    echo "❌ algo salió mal con la descarga"
fi

echo ""
read -p "pulsa enter para continuar..."
