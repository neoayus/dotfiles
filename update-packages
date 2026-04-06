#!/bin/bash
set -e

DOTFILES_DIR="$HOME/dotfiles"
PACKAGES_DIR="$DOTFILES_DIR/packages"

echo "Starting system backup..."

mkdir -p "$PACKAGES_DIR"

# ------------------------
# Pacman packages
# ------------------------
echo "Backing up pacman packages..."
pacman -Qqe > "$PACKAGES_DIR/pacman.txt"

# ------------------------
# AUR packages
# ------------------------
echo "Backing up AUR packages..."
pacman -Qqm > "$PACKAGES_DIR/aur.txt"

# ------------------------
# Flatpak apps
# ------------------------
echo "Backing up Flatpak apps..."
flatpak list --app --columns=application > "$PACKAGES_DIR/flatpak.txt"

# ------------------------
# Generate stow list
# ------------------------
echo "Updating stow list..."
> "$PACKAGES_DIR/stow.txt"

for item in "$DOTFILES_DIR"/*/; do
    name=$(basename "$item")

    if [[ "$name" != "packages" &&
          "$name" != "scripts" &&
          "$name" != ".git" ]]; then
        echo "$name" >> "$PACKAGES_DIR/stow.txt"
    fi
done

echo "Backup complete!"
