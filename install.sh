#!/bin/bash
set -e

cd "$(dirname "$0")"

DOTFILES_DIR="$HOME/dotfiles"
PACKAGES_DIR="$DOTFILES_DIR/packages"

mkdir -p "$PACKAGES_DIR"
touch "$PACKAGES_DIR/pacman.txt"
touch "$PACKAGES_DIR/aur.txt"
touch "$PACKAGES_DIR/flatpak.txt"
touch "$PACKAGES_DIR/stow.txt"

echo "Dotfiles directory: $DOTFILES_DIR"
echo "Starting installation..."

echo "Upading Pacman database..."
sudo pacman -Sy --noconfirm  
# ------------------------
# Pacman packages
# ------------------------
echo "Checking pacman packages..."
while read -r pkg; do
    [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
    if pacman -Qi "$pkg" &> /dev/null; then
        echo "[PACMAN] $pkg already installed"
    else
        echo "[PACMAN] Installing $pkg..."
        sudo pacman -S --noconfirm "$pkg"
    fi
done < "$PACKAGES_DIR/pacman.txt"


# ------------------------
# Install yay if missing
# ------------------------
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    pushd /tmp/yay
    makepkg -si --noconfirm
    popd 
    rm -rf /tmp/yay
else
    echo "yay already installed"
fi


# ------------------------
# AUR packages
# ------------------------
echo "Checking AUR packages..."
while read -r pkg; do
    [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
    if pacman -Qi "$pkg" &> /dev/null; then
        echo "[AUR] $pkg already installed"
    else
        echo "[AUR] Installing $pkg..."
        yay -S --noconfirm "$pkg"
    fi
done < "$PACKAGES_DIR/aur.txt"


# ------------------------
# Flatpak
# ------------------------
if ! command -v flatpak &> /dev/null; then
    echo "Installing flatpak..."
    sudo pacman -S --noconfirm flatpak
else
    echo "flatpak already installed"
fi

# Ensure flathub repo exists
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo



# ------------------------
# Flatpak apps
# ------------------------
echo "Checking Flatpak apps..."
while read -r pkg; do
    [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
    if flatpak info "$pkg" &> /dev/null; then
        echo "[FLATPAK] $pkg already installed"
    else
        echo "[FLATPAK] Installing $pkg..."
        flatpak install -y flathub "$pkg"
    fi
done < "$PACKAGES_DIR/flatpak.txt"


# ------------------------
# Generate stow list
# ------------------------
echo "Generating stow list..."
> "$PACKAGES_DIR/stow.txt"

for item in "$DOTFILES_DIR"/*/; do
    name=$(basename "$item")

    if [[ "$name" != "packages" &&
          "$name" != "scripts" &&
          "$name" != ".git" ]]; then
        echo "$name" >> "$PACKAGES_DIR/stow.txt"
    fi
done


# ------------------------
# Stow dotfiles safely
# ------------------------
echo "Stowing dotfiles..."
cd "$DOTFILES_DIR" 
while read -r dir; do
    [[ -z "$dir" ]] && continue
    echo "Stowing $dir"
    stow "$dir" || echo "Skipped $dir (conflict exists)"

done < "$PACKAGES_DIR/stow.txt"


echo "Dotfiles setup complete!"
echo "System setup complete."
echo "You may want to reboot or relogin."
