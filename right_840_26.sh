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
SHIELD_TARGET="cornixqf_right"
echo "Building for: $SHIELD_TARGET (Tag: $ARG_TAG)"
# export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"
# Determine build target and output filename suffix based on argument

    # Default to Right if no argument or argument is not L or D
 
    FILE_SUFFIX="_right"
    west build -b nice_nano \
  -- -DSHIELD=$SHIELD_TARGET



#   -S zmk-usb-logging \
polling_check


SRC_FILE="build/zephyr/zmk.uf2"
# Generate filename with keyword, e.g., flash_left.uf2, flash_right.uf2, flash_dongle.uf2
DEST_FILE="${DRIVE_P}:/flash${FILE_SUFFIX}.uf2"
DEST_FILE2="../../flash${FILE_SUFFIX}.uf2"

echo "Copying $SRC_FILE to $DEST_FILE"
cp "$SRC_FILE" "$DEST_FILE"

echo "Copying $SRC_FILE to $DEST_FILE2"
cp "$SRC_FILE" "$DEST_FILE2"
