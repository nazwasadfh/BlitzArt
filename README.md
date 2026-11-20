# BlitzArt Linux

**Artix-based live ISO with blitz installer and dinit init**

## Features

- **Base:** Artix Linux (dinit init, not systemd)
- **Filesystem:** Btrfs root + optional `@home` subvolume
- **Snapshots:** snapper + grub-btrfs for full system rollback
- **Repositories:** artix, arch, blackarch, chaotic-aur
- **Toolbox:** blitz system management
- **Installer:** blitzinstall (archinstall-inspired)
- **Boot:** Boots to TTY (no GUI by default)

## Quick Start

### Build ISO

```bash
# Requires artools-iso
sudo pacman -S artools-iso

# Build the ISO
sudo ./build-iso
```

### Install

1. Boot from the live ISO (boot to TTY)
2. Run: `blitzinstall`
3. Follow the on-screen prompts
4. Reboot

## Structure

```
.
├── build-iso          # One-file ISO builder
├── blitz              # System toolbox (blitz)
├── README.md
├── LICENSE
├── .gitignore
└── iso/
    └── blitzart/      # artools-iso profile
        ├── profile.conf
        ├── profile.d/
        │   └── profile.sh
        ├── packages.d/
        │   └── blitzart.packages
        ├── scripts/
        │   ├── makeiso        # Copy new profile
        │   └── blitzinstall   # Installer
        └── airootfs/
            ├── etc/
            │   ├── os-release
            │   └── motd
            ├── root/
            │   └── post-install.sh
            ├── usr/
            │   ├── bin/
            │   │   └── blitzinstall
            │   └── local/bin/
            │       └── blitz
            └── skel/
                └── .zshrc (from dots repo)
```

## Requirements

- Artix Linux (or any Arch-based system)
- artools-iso: `pacman -S artools-iso`
- Network access during build

## BlitzArt Linux

A distribution based on Artix Linux with:
- Dinit init system
- Btrfs root filesystem with full snapshots
- Repositories: artix, arch, blackarch, chaotic-aur
- blitz system toolbox
- Boot to TTY (no GUI by default)