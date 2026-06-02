#!/usr/bin/env bash
set -euo pipefail

echo "Configuring GNOME settings..."

# Only run if GNOME session exists
if [[ -n "${DBUS_SESSION_BUS_ADDRESS:-}" ]]; then
    current_value=$(gsettings get org.gnome.desktop.notifications show-banners)

    if [[ "$current_value" != "false" ]]; then
        gsettings set org.gnome.desktop.notifications show-banners false
        echo "Notifications disabled"
    else
        echo "Notifications already disabled"
    fi
else
    echo "Skipping GNOME settings (no session)"
fi