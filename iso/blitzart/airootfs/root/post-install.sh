#!/usr/bin/env bash
# post-install.sh - runs inside chroot after base installation
# Sets up blitz, snapper, and other system tools

set -euo pipefail

msg() { printf '%s\n' "$*"; }

# Copy blitzinstall to live system
if [[ -f /usr/bin/blitzinstall ]]; then
    rm -f /usr/bin/blitzinstall
fi

cp /usr/local/bin/blitzinstall /usr/bin/blitzinstall
chmod +x /usr/bin/blitzinstall

# Configure snapper for root
if command -v snapper >/dev/null 2>&1; then
    msg "Configuring snapper for root subvolume"
    snapper -c root create-config / || true
    snapper -c root create --description "Initial installation" --cleanup-algorithm number || true
fi

# Regenerate GRUB config inside chroot
if command -v grub-mkconfig >/dev/null 2>&1; then
    msg "Regenerating GRUB config"
    grub-mkconfig -o /boot/grub/grub.cfg
fi

msg "post-install.sh complete"