#!/usr/bin/env bash

run_module() {
    local module_file="$1"

    echo ""
    echo "=============================="
    echo "Running: $(basename "$module_file")"
    echo "=============================="

    if [[ -f "$module_file" ]]; then
        bash "$module_file"
    else
        echo "Module not found: $module_file"
        exit 1
    fi
}

set_gsetting() {
    local schema="$1"
    local key="$2"
    local value="$3"

    if [[ "$(gsettings get "$schema" "$key")" != "$value" ]]; then
        gsettings set "$schema" "$key" "$value"
        echo "Set $schema $key"
    fi
}