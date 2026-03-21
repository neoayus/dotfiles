# Arch Linux Installation Guide

This document serves as a guide for setting up Arch Linux and includes a list of explicitly installed packages with their purposes to replicate or troubleshoot the setup on another machine.

[Installing Arch the Hard Way](https://youtu.be/FxeriGuJKTM?si=3P1akvClK2gFw_RB)
- lvm installtion and encryption  
- skipped Swap Memory

[An Arch Linux Installation Guid](https://youtu.be/BUYFe5ejxfo?si=J0fteAP6ZNOXUMrn) 
- did initialize Swap Memory.

Using these two YT Tutorial as Reference, i wrote thee comamnds to run on fresh Arch ISO to to Install Arch next time on new machine. 
[Install Arch the Hard Way.](./TheHardWay.md)

## Mounting USB Devices 
- If There's a Problem on mounting an External USB Device like an Android, flash drive or Hardisk 
- https://youtu.be/utHUlE1d4SE?si=_5PQiIzLh5OHT240

>> and if that din't Help Follow These Steps. 
```
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
```

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

### Wayland/Tiling Window Manager
- **hyprland**: Wayland compositor.
- **waybar**: Status bar for Wayland.
- **wofi**: Application launcher for Wayland.
- **qtile**: Tiling window manager.

### Audio
- **pipewire**: Multimedia framework.
- **pipewire-pulse**: PulseAudio replacement.
- **pavucontrol**: Audio control panel.
- **pamixer**: Command-line audio mixer.
- **alsa-utils**: Advanced Linux Sound Architecture utilities.

### Microphpone 
Was having some problems with my mic, that is because i din't had the right drivers and softwares to control how it behaves, these packages helped me fix that.. 
- pipewire
- pipewire-alsa 
- pipewire-pulse 

then i ran this command `systemctl --user enable --now pipewire pipewire-pulse ` 
and adjust sum equalisers inside 'alsamixer' package and you are good to go :) PS: I forgot to save the configuration for alsomixer, here's how i did it using `sudo alsactl store ` 

### Development Tools
- **git**: Version control system.
- **nodejs**: JavaScript runtime.
- **npm**: Node.js package manager.
- **stow**: Symlink management for dotfiles.
- **tmux**: Terminal multiplexer.
- **zsh**: Shell for terminal.
- **yay**: AUR helper.

### Fonts
- **ttf-cascadia-code-nerd**: Nerd font for development.
- **ttf-font-awesome**: Icon fonts for UI design.

### Miscellaneous
- **htop**: Process viewer.
- **neofetch**: System information display.
- **starship**: Cross-shell prompt.
- **fastfetch**: Alternative to neofetch.
- **sushi**: File previewer for GNOME.
- **lxappearance**: GTK theme switcher.

## Custom YAY Packages 

- **cava**: Console-based audio visualizer for ALSA and PulseAudio.
- **hyprshot**: Screenshot tool designed for the Hyprland window manager.
- **yay**: AUR helper for managing packages from the Arch User Repository.

### Video Acceleration (NVIDIA)
- **libva-vdpau-driver-shadow-nvidia**: Compatibility layer for VA-API and VDPAU using NVIDIA drivers for hardware-accelerated video playback.
- **libva-vdpau-driver-shadow-nvidia-debug**: Debug version of the NVIDIA VA-API/VDPAU compatibility driver.
