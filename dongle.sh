#!/bin/bash

# Set history file path
export HISTFILE=~/.bash_history_mx_kbd
# Make clean
export ORIG_CWD=$(pwd)
. ./common.sh
export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"
DRIVE_P=E


curr_folder=$(pwd)
echo "curr_folder_${curr_folder}"
clear

cd app || exit 1
#  rm -rf build
  # NOTE: Replace 'corne_dongle' with the actual shield name for your dongle if different
  SHIELD_TARGET="cornixqf_dongle" 
echo "Building for: $SHIELD_TARGET (Tag: $ARG_TAG)"



  FILE_SUFFIX="_dongle"
  west build -b nice_nano \
-S studio-rpc-usb-uart \
-S zmk-usb-logging \
-S nrf52840-nosd \
-- -DSHIELD=$SHIELD_TARGET -DCONFIG_ZMK_STUDIO=y


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
