#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib/utils.sh"

echo "Configuring GNOME settings..."

if [[ -n "${DBUS_SESSION_BUS_ADDRESS:-}" ]]; then
    set_gsetting org.gnome.notifications show-banners false
    set_gsetting org.gnome.desktop.interface enable-hot-corners false
    set_gsetting org.gnome.desktop.screensaver lock-enabled false
    set_gsetting org.gnome.desktop.interface enable-animations false
    set_gsetting org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
    set_gsetting org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
    set_gsetting org.gnome.desktop.screensaver lock-enabled false
    set_gsetting org.gnome.desktop.session idle-delay 0
    set_gsetting org.gnome.desktop.interface color-scheme prefer-light
    set_gsetting org.gnome.desktop.interface clock-show-weekday true
    set_gsetting org.gnome.desktop.interface clock-show-date true
    set_gsetting org.gnome.desktop.interface enable-hot-corners false
    set_gsetting org.gnome.desktop.privacy remember-recent-files false
    set_gsetting org.gnome.desktop.privacy remember-app-usage false
    set_gsetting org.gnome.desktop.peripherals.touchpad tap-to-click true
    set_gsetting org.gnome.mutter overlay-key ''
    set_gsetting org.gnome.shell.keybindings toggle-overview "[]"
    set_gsetting org.gnome.shell.keybindings toggle-application-view "[]"
    set_gsetting org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
    set_gsetting org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"
else
    echo "Skipping GNOME settings (no session)"
fi