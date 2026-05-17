#!/bin/bash

# Make clean
export ORIG_CWD=$(pwd)
. ./common.sh
export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"
DRIVE_P=E

# Accept first argument as shield identifier or custom tag (e.g., L, R, D)
ARG_TAG=$1


curr_folder=$(pwd)
echo "curr_folder_${curr_folder}"
clear

cd app || exit 1
 rm -rf build

echo "Building for: $SHIELD_TARGET (Tag: $ARG_TAG)"


    # NOTE: Replace 'corne_dongle' with the actual shield name for your dongle if different
    SHIELD_TARGET="corne_left" 
    FILE_SUFFIX="_dongle"
    west build -b nice_nano_k \
  -S studio-rpc-usb-uart \
  -S zmk-usb-logging \
  -S nrf52833-nosd \
  -- -DSHIELD=$SHIELD_TARGET -DCONFIG_ZMK_STUDIO=y



#   -S zmk-usb-logging \


SRC_FILE="build/zephyr/zmk.uf2"
# Generate filename with keyword, e.g., flash_left.uf2, flash_right.uf2, flash_dongle.uf2
DEST_FILE="${DRIVE_P}:/flash${FILE_SUFFIX}.uf2"
DEST_FILE2="../flash${FILE_SUFFIX}_833.uf2"


echo "Copying $SRC_FILE to $DEST_FILE2"
cp "$SRC_FILE" "$DEST_FILE2"

polling_check
echo "Copying $SRC_FILE to $DEST_FILE"
cp "$SRC_FILE" "$DEST_FILE"