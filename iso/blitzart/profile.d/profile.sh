# blitzart profile for artools-iso
# This sets up the profile-specific variables

# Distribution info
PROFILE_NAME="blitzart"
PROFILE_TITLE="BlitzArt Linux"
PROFILE_DESCRIPTION="BlitzArt - Artix-based live ISO with blitz installer and dinit init"

# Repositories
export PROFILE_REPO_ARTIX="https://artixlinux.org/repo/artix"
export PROFILE_REPO_ARCH="https://geo.mirror.pkgbuild.com/archlinux"
export PROFILE_REPO_BLACKARCH="https://blackarch.org/repos/blackarch"
export PROFILE_REPO_CHAOTIC_AUR="https://chaos-kz.org/mirror/chaotic-aur"

# Init system
PROFILE_INIT="dinit"

# Filesystem config
PROFILE_FSTYPE_ROOT="btrfs"
PROFILE_FSTYPE_HOME="btrfs"
PROFILE_HOME_SUBVOL="@home"
PROFILE_ROOT_SUBVOL="@"

# GRUB customization
PROFILE_GRUB_DISTRIBUTOR="BlitzArt"

# OS release customization
PROFILE_OS_NAME="BlitzArt"
PROFILE_OS_PRETTY="BlitzArt Linux"
PROFILE_OS_ID="artix"
PROFILE_OS_ID_LIKE="arch"

# Package list (core packages included in the ISO)
PROFILE_PACKAGES=(
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

# System config
PROFILE_LOCALE="en_US.UTF-8"
PROFILE_KEYMAP="us"
PROFILE_TIMEZONE="UTC"
PROFILE_HOSTNAME="blitzart"

msg_profile() {
    printf 'Profile: %s (%s)\n' "$PROFILE_TITLE" "$PROFILE_NAME"
    printf 'Init: %s\n' "$PROFILE_INIT"
    printf 'Root fs: %s\n' "$PROFILE_FSTYPE_ROOT"
    printf 'Distributor: %s\n' "$PROFILE_GRUB_DISTRIBUTOR"
}