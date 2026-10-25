#!/bin/bash
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"
# ln -sf /usr/bin/python3 /usr/local/bin/python
# Make clean
export ORIG_CWD=$(pwd)
. ./common.sh

DRIVE_P=E

curr_folder=$(pwd)
echo "curr_folder_${curr_folder}"
clear

cd app || exit 1
  rm -rf build
  # -S nrf52833-nosd 
    SHIELD_TARGET="corne_left" 
    FILE_SUFFIX="_corne_left"
pwd
echo "Building for: $SHIELD_TARGET "


  # -S zmk-usb-logging \
  #-DCONFIG_ZMK_BLE=n 进制蓝牙方便开发速度
west build -b nice_nano_k \
   -- -DSHIELD=corne_left -DCONFIG_ZMK_BLE=y
  

SRC_FILE="build/zephyr/zmk.uf2"
# Generate filename with keyword, e.g., flash_left.uf2, flash_right.uf2, flash_dongle.uf2
DEST_FILE="${DRIVE_P}:/flash${FILE_SUFFIX}.uf2"
DEST_FILE2="../flash${FILE_SUFFIX}_833.uf2"


# echo "Copying $SRC_FILE to $DEST_FILE2"
# cp "$SRC_FILE" "$DEST_FILE2"
echo "Copying $SRC_FILE to /c/Users/dellht/Downloads/zmk_${FILE_SUFFIX}.uf2"
cp "$SRC_FILE" "/c/Users/dellht/Downloads/zmk_${FILE_SUFFIX}.uf2"

polling_check
echo "Copying $SRC_FILE to $DEST_FILE"
cp "$SRC_FILE" "$DEST_FILE"