#!/bin/bash

# Exit on error
set -e

# Check if running as root
if [ "$(id -u)" != "0" ]; then
    echo "Please run as root!"
    exit 1
fi

# Define paths
CURSOR_PATH="$HOME/Library/Application Support/Cursor"
STORAGE_PATH="$CURSOR_PATH/User/globalStorage/storage.json"
BACKUP_PATH="$CURSOR_PATH/User/globalStorage/backups"

# Create backup directory
mkdir -p "$BACKUP_PATH"

# Backup original storage.json
if [ -f "$STORAGE_PATH" ]; then
    cp "$STORAGE_PATH" "$BACKUP_PATH/storage.json.backup_$(date +%Y%m%d_%H%M%S)"
fi

# Generate new UUIDs
NEW_MACHINE_ID=$(uuidgen)
NEW_MAC_MACHINE_ID=$(uuidgen)
NEW_DEV_DEVICE_ID=$(uuidgen)
NEW_SQM_ID=$(uuidgen)

# Create or update storage.json
cat > "$STORAGE_PATH" << EOF
{
    "telemetry.machineId": "$NEW_MACHINE_ID",
    "telemetry.macMachineId": "$NEW_MAC_MACHINE_ID",
    "telemetry.devDeviceId": "$NEW_DEV_DEVICE_ID",
    "telemetry.sqmId": "$NEW_SQM_ID"
}
EOF

echo "Successfully reset Cursor IDs!"
