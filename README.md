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
# Requires artools (provides buildiso)
sudo pacman -S artools

# Build the ISO (one command, runs even on fresh Artix)
sudo ./build-iso
```

The script stages an artools profile under `~/artools-workspace/iso-profiles/blitzart/`:
- `Packages-Root` — packages for the live and installed system
- `live-overlay/` — files delivered to live ISO (configs, `blitz`, `blitzinstall`)
- `root-overlay/` — files delivered to installed system

and runs:

```bash
buildiso -p blitzart -i dinit -t ./out
```

The finished ISO lands in `./out/blitzart/`.

### Install

1. Boot z live ISO (boot do TTY)
2. Uruchom: `blitzinstall`
3. Postępuj zgodnie z monitami
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
    └── blitzart/      # artools profile sources
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
- artools: `pacman -S artools`
- Network access during build

## BlitzArt Linux

A distribution based on Artix Linux with:
- Dinit init system
- Btrfs root filesystem with full snapshots
- Repositories: artix, arch, blackarch, chaotic-aur
- blitz system toolbox
- Boot to TTY (no GUI by default)