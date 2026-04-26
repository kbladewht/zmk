#!/bin/bash

# Set history file path
export HISTFILE=~/.bash_history_mx_kbd
# Make clean
export ORIG_CWD=$(pwd)
. ./common.sh

DRIVE_P=F

# Accept first argument as shield identifier or custom tag (e.g., L, R, D)
ARG_TAG=$1


curr_folder=$(pwd)
echo "curr_folder_${curr_folder}"
clear

cd app || exit 1
 rm -rf build

echo "Building for: $SHIELD_TARGET (Tag: $ARG_TAG)"

# Determine build target and output filename suffix based on argument
if [ "$ARG_TAG" == "L" ]; then
    SHIELD_TARGET="corne_left"
    FILE_SUFFIX="_left"
    west build -b nice_nano \
  -S studio-rpc-usb-uart \
  -S zmk-usb-logging \
  -- -DSHIELD=$SHIELD_TARGET -DCONFIG_ZMK_STUDIO=y
elif [ "$ARG_TAG" == "D" ]; then
    # NOTE: Replace 'corne_dongle' with the actual shield name for your dongle if different
    SHIELD_TARGET="corne_dongled" 
    FILE_SUFFIX="_dongle"
else
    # Default to Right if no argument or argument is not L or D
    SHIELD_TARGET="corne_right"
    FILE_SUFFIX="_right"
    west build -b nice_nano \
  -S zmk-usb-logging \
  -- -DSHIELD=$SHIELD_TARGET
fi



polling_check


SRC_FILE="build/zephyr/zmk.uf2"
# Generate filename with keyword, e.g., flash_left.uf2, flash_right.uf2, flash_dongle.uf2
DEST_FILE="${DRIVE_P}:/flash${FILE_SUFFIX}.uf2"
DEST_FILE2="../../flash${FILE_SUFFIX}.uf2"

echo "Copying $SRC_FILE to $DEST_FILE"
cp "$SRC_FILE" "$DEST_FILE"

echo "Copying $SRC_FILE to $DEST_FILE2"
cp "$SRC_FILE" "$DEST_FILE2"
