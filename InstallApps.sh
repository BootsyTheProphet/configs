#!/bin/bash

# Update system
echo "Updating system..."
sudo pacman -Syu --noconfirm

# Install essential utilities
echo "Installing essential utilities..."
sudo pacman -S --noconfirm \
    git \
    lazygit \
    wget \
    curl \
    trash-cli \
    neovim \
    yazi \
    p7zip \
    htop \
    neomutt \
    newsboat \
    rtorrent \
    openvpn \
    kitty \
    zellij \
    fzf \
    zoxide \
    fastfetch \
    stow \
    bat \
    tealdeer \
    starship \
    snapper

# Install Hyperland
echo "Installing Hyperland..."
sudo pacman -S --noconfirm \
    hyprland \
    rofi-wayland \
    waybar

# Install development tools
echo "Installing development tools..."
sudo pacman -S --noconfirm \
    base-devel \
    gcc \
    make \
    python \
    python-pip \
    nodejs \
    npm \
    podman \
    distrobox

# Install graphical applications
echo "Installing graphical applications..."
sudo pacman -S --noconfirm flatpak
flatpak install -y flathub io.github.flattool.Warehouse
flatpak install -y flathub org.mozilla.firefox
flatpak install -y flathub org.freecad.FreeCAD
flatpak install -y flathub org.kicad.KiCad
flatpak install -y flathub org.godotengine.Godot
flatpak install -y flathub com.valvesoftware.Steam

echo "Installing hacking tools..."
flatpak install -y flathub org.zaproxy.ZAP
flatpak install -y flathub org.wireshark.Wireshark
flatpak install -y flathub org.ghidra_sre.Ghidra

# Install media tools
echo "Installing media tools..."
sudo pacman -S --noconfirm \
    ffmpeg \
    vlc
flatpak install -y flathub fr.handbrake.ghb
flatpak install -y flathub org.kde.kdenlive
flatpak install -y flathub org.blender.Blender
flatpak install -y flathub fm.reaper.Reaper
flatpak install -y flathub org.gimp.GIMP
flatpak install -y flathub org.inkscape.Inkscape
flatpak install -y flathub io.github.JaGoLi.ytdl_gui


# Install font packages
echo "Installing font packages..."
sudo pacman -S --noconfirm \
    ttf-dejavu \
    ttf-liberation \
    ttf-font-nerd \
    ttf-ubuntu-font-family

# Install other useful utilities
echo "Installing other useful utilities..."
sudo pacman -S --noconfirm \
    gparted \
    #geany

# Enable snapd (if needed)
#echo "Enabling snapd..."
#sudo systemctl enable --now snapd.socket

# Cleanup
echo "Cleaning up unused packages..."
sudo pacman -Rns $(pacman -Qdtq) --noconfirm

# Finish
echo "Installation complete!"
