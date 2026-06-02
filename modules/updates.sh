#!/usr/bin/env bash
set -euo pipefail

echo "Configuring automatic updates..."

if systemctl is-enabled rpm-ostreed-automatic.timer &>/dev/null; then
    echo "Auto updates already enabled"
else
    sudo systemctl enable --now rpm-ostreed-automatic.timer
    echo "Auto updates enabled"
fi