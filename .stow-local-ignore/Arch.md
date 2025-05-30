# Arch Linux Installation Guide

This document serves as a guide for setting up Arch Linux and includes a list of explicitly installed packages with their purposes to replicate or troubleshoot the setup on another machine.

# Linux Help : 
- **Installation :** https://youtu.be/mWl4P6DOt9M?si=4P0d_5a0TmS-KJKv
- **Mounting Problem :** https://youtu.be/utHUlE1d4SE?si=_5PQiIzLh5OHT240

>> if still facing problem witth that 
1. **Plug in your hard drive.**  
2. **Open Disks utility:**
   - Run in terminal: `sudo -E gnome-disks` *(if it doesn't open normally)*  
3. **Select your hard drive** from the left panel.  
4. **Click the gear icon** (⚙️ – additional partition options).  
5. Select **“Edit Mount Options…”**  
6. **Turn off** “User Session Defaults”.  
7. **Check** “Mount at system startup”.  
8. **Save** the changes.  
9. **Reboot** your system.


## Essential Packages
### System Utilities
- **alsa-utils**: For audio utilities.
- **amd-ucode**: AMD CPU microcode updates.
- **base**: Base system package.
- **base-devel**: Development tools like `make` and `gcc`.
- **brightnessctl**: Control screen brightness.
- **dosfstools**: Tools for FAT file systems.
- **efibootmgr**: Manage EFI boot entries.
- **mtools**: Command-line utilities for accessing DOS disks.
- **ntfs-3g**: NTFS file system support.
- **os-prober**: Detect other OS for GRUB.
- **smartmontools**: Monitor and manage hard drives.
- **tree**: Display directory structure in a tree format.
- **zram-generator**: Enable ZRAM for swap.

### Networking
- **iwd**: Wireless daemon for WiFi.
- **networkmanager**: Manage network connections.
- **network-manager-applet**: GUI for NetworkManager.
- **wireless_tools**: Tools for wireless networks.
- **bluez-utils**: Bluetooth Utilities 
- **blueman**: GUI Tool to connect to bluetooth 



### Bootloader
- **grub**: GRUB bootloader.
- **grub-customizer**: GUI for customizing GRUB.

## Desktop Environment and GUI Tools
### GNOME
- **gdm**: GNOME Display Manager.
- **gnome-shell**: GNOME desktop shell.
- **gnome-control-center**: GNOME settings manager.
- **gnome-tweaks**: Advanced settings for GNOME.
- **gnome-shell-extensions**: Extensions for GNOME.

### GNOME Applications
- **evince**: PDF viewer.
- **gnome-calculator**: Calculator application.
- **gnome-system-monitor**: Task manager.
- **gnome-terminal**: Terminal emulator.
- **nautilus**: File manager.

### Other Applications
- **baobab**: Disk usage analyzer.
- **epiphany**: GNOME web browser.
- **firefox**: Web browser.
- **kitty**: Terminal emulator.
- **neovim**: Text editor for development.
- **code**: Visual Studio Code editor.
- **vlc**: Media player.

## Wayland/Tiling Window Manager
- **hyprland**: Wayland compositor.
- **waybar**: Status bar for Wayland.
- **wofi**: Application launcher for Wayland.
- **qtile**: Tiling window manager.

## Audio
- **pipewire**: Multimedia framework.
- **pipewire-pulse**: PulseAudio replacement.
- **pavucontrol**: Audio control panel.
- **pamixer**: Command-line audio mixer.
- **alsa-utils**: Advanced Linux Sound Architecture utilities.

## Development Tools
- **git**: Version control system.
- **nodejs**: JavaScript runtime.
- **npm**: Node.js package manager.
- **stow**: Symlink management for dotfiles.
- **tmux**: Terminal multiplexer.
- **zsh**: Shell for terminal.
- **yay**: AUR helper.

## Fonts
- **ttf-cascadia-code-nerd**: Nerd font for development.
- **ttf-font-awesome**: Icon fonts for UI design.

## Miscellaneous
- **htop**: Process viewer.
- **neofetch**: System information display.
- **starship**: Cross-shell prompt.
- **fastfetch**: Alternative to neofetch.
- **sushi**: File previewer for GNOME.
- **lxappearance**: GTK theme switcher.

---

This guide provides a structured reference for your current Arch Linux setup. Modify and expand it as needed for future installations or configurations.

# Custom YAY Packages and Their Uses

This document lists the YAY packages I installed on my Arch system along with their purposes.

## Packages and Uses

### cava (0.10.3-2)
- **Purpose**: A console-based audio visualizer for Alsa and Pulseaudio. Used for visualizing audio in the terminal.

### cava-debug (0.10.3-2)
- **Purpose**: Debug version of Cava for development and debugging purposes.

### hyprshot (1.3.0-1)
- **Purpose**: A screenshot tool designed for the Hyprland window manager.

### libva-vdpau-driver-shadow-nvidia (0.7.4c-1)
- **Purpose**: A compatibility layer for VA-API and VDPAU using NVIDIA drivers. Facilitates hardware-accelerated video playback.

### libva-vdpau-driver-shadow-nvidia-debug (0.7.4c-1)
- **Purpose**: Debug version of the above driver for troubleshooting and development.

### yay (12.4.2-1)
- **Purpose**: A popular AUR helper to manage packages from the Arch User Repository (AUR).

### yay-debug (12.4.2-1)
- **Purpose**: Debug version of yay for debugging and development purposes.

## Notes
- Packages with the suffix `-debug` are typically used for development and debugging scenarios.
- The main packages are used for their core functionalities as described above.

---
This guide helps in tracking the purpose of each YAY package installed for easier system replication or troubleshooting.

## Spotify 
For Spotify Adblocker, i used : https://github.com/abba23/spotify-adblock-linux

## Microphpone 
Since i was having some problems with my mic, that is because i din't had the right drivers and softwares to control how it behaves, these packages helped me fix that.. 
- pipewire
- pipewire-alsa 
- pipewire-pulse 
- " then i ran this command `systemctl --user enable --now pipewire pipewire-pulse ` 
- and adjust sum equalisers inside 'alsamixer' package and you are good to go :) PS: I forgot to save the configuration for alsomixer, here's how i did it using `sudo alsactl store ` 
