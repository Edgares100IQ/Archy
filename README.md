<p align="center">
  <pre align="center">
                      ████████
                  ████████████████
              ████████████████████████
            ████████████████████████████
          ████████████████████████████████
        ████████████████████████████████████
        ████████████████████████████████████
        ██████      ████████████      ██████
        ██████      ████████████      ██████
        ██████      ████████████      ██████
        ████████████████████████████████████
        ████████████████████████████████████
        ██████    ████████████████    ██████
    ███████████                      ███████████
  ████████████████████████████████████████████████
████████████████████████████████████████████████████████
████████████████████████████████████████████████████████
██████████    ████████████████████████████    ██████████
██████████      ████████████████████████      ██████████
██████████      ████████████████████████      ██████████
              ██████            ██████
              ██████            ██████
          ████████████        ████████████
          ████████████        ████████████
          ████████████        ████████████
  </pre>
</p>

<h1 align="center">Archy</h1>
<p align="center">Post-instalador interactivo para Arch Linux</p>

---

Acabas de instalar Arch Linux. Ahora toca lo tedioso: instalar yay, configurar el entorno, buscar los paquetes uno por uno, acordarte de qué flags necesita cada cosa...

Archy se encarga de todo eso. Abres el menú, eliges lo que quieres, y te vas a hacer otra cosa.

## Instalación

```bash
bash <(curl -s https://raw.githubusercontent.com/Edgares100IQ/archlinux-scripts/main/install-archy.sh)
```

Eso es todo. A partir de ahí ejecutas `archy` desde cualquier terminal.

## Qué hace

Archy tiene dos modos:

**Instalación predeterminada** — eliges dotfiles, navegador, editor y launcher, y Archy monta todo el entorno de cero sin que tengas que tocar nada más. Instala el sistema base, audio, Hyprland, SDDM con su tema, fuentes, wallpaper y el software extra.

**Instalación personalizada** — vas eligiendo programa por programa lo que quieres instalar. Puedes volver al menú y seguir instalando cosas sin que se cierre.

## Lo que puedes instalar

| Categoría | Opciones |
|---|---|
| Entorno | end-4 dotfiles (Hyprland) |
| Navegador | Firefox, Chromium, Brave, Opera, Tor Browser, Zen Browser |
| Editor de código | VSCodium, Windsurf, Antigravity |
| Launcher de juegos | Steam, Heroic Games Launcher, ambos |

## Lo que instala la predeterminada

Además de lo que elijas, la instalación predeterminada incluye:

- Actualización del sistema y keyring
- Paquetes base: `gcc`, `cmake`, `git`, `rust`, `go`, `base-devel`...
- Apps: LibreOffice, GIMP, Discord, Blender
- Fuentes: Noto, DejaVu, Fira Sans, Monocraft
- Audio: PipeWire, WirePlumber, PavuControl, Cava, Playerctl
- Entorno Hyprland con dots-hyprland (end-4)
- SDDM + tema SilentSDDM
- Software extra: Upscayl, Wine, nwg-displays
- Limpieza de WMs y DMs anteriores
- Fondo de pantalla personalizado
- Optimización de makepkg para builds más rápidos

## Estructura

```
~/.local/share/archy/
  archy.sh
  scripts/
    navegadores/    firefox.sh · chromium.sh · brave.sh · opera.sh · tor.sh · zen.sh
    editores/       vscodium.sh · windsurf.sh · antigravity.sh
    launchers/      steam.sh · heroic.sh
    end4_completo.sh
```

Cada script funciona de forma independiente. Si algo falla solo falla ese, el resto no se ve afectado.

## Requisitos

- Arch Linux
- Conexión a internet
- `git` instalado

> Archy instala `yay` automáticamente si no lo tienes.

---

<p align="center">hecho para no perder el tiempo</p>
