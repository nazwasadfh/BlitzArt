# blitzart profile for artools-iso
# This sets up the profile-specific variables consumed by buildiso

# Distribution info
profile_name="blitzart"
profile_title="BlitzArt Linux"
profile_description="BlitzArt - Artix-based live ISO with blitz installer and dinit init"

# Init system
profile_init="dinit"

# Live session configuration (consumed by buildiso during chroot setup)
autologin="yes"
hostname="blitzart"
username="blitzart"
password="blitzart"
addgroups="wheel"
services_live=(NetworkManager)
services=(NetworkManager)

# Filesystem config
fstype_root="btrfs"
fstype_home="btrfs"
home_subvol="@home"
root_subvol="@"

# GRUB customization
grub_distributor="BlitzArt"

# OS release customization
os_name="BlitzArt"
os_pretty="BlitzArt Linux"
os_id="artix"
os_id_like="arch"

# Package list (core packages included in the ISO)
profile_packages=(
    base
    base-devel
    linux
    linux-firmware
    intel-ucode
    amd-ucode
    dinit
    dinit-geninitrd
    dinit-openrc
    grub
    grub-btrfs
    btrfs-progs
    snapper
    snapper-tmpfiles
    networkmanager
    efibootmgr
    dosfstools
    eza
    ugrep
    tree
    fastfetch
    starship
    mcfly
    zoxide
    fzf
    bat
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-history-substring-search
    oh-my-zsh
    git
    nano
    vim
    curl
    wget
)

msg_profile() {
    printf 'Profile: %s (%s)\n' "$profile_title" "$profile_name"
    printf 'Init: %s\n' "$profile_init"
    printf 'Root fs: %s\n' "$fstype_root"
    printf 'Distributor: %s\n' "$grub_distributor"
}
