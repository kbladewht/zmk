#!/bin/bash
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"
export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"

# Make clean
export ORIG_CWD=$(pwd)
. ./common.sh

DRIVE_P=E


# export MY_ZMK_DEV_DIR="D:/project/GitHub/zmk_gitee"

export NRF_MODULE_DIRS="../zmk-feature-split-esb/nrf"
export NRFXLIB_MODULE_DIRS="../zmk-feature-split-esb/nrfxlib"
export ZMK_ESB_MODULE_DIRS="../zmk-feature-split-esb"

export SHIELD="p42_c"
export BOARD="nice_nano_k"
export ZMK_CONFIG_DIR="../zmk-config"

# cd app
rm -rf build
rm -rf app/build

# west build -s app -d "build/${SHIELD}" -b nice_nano_k -S zmk-usb-logging -- \
#   -DSHIELD="${SHIELD}" -DZMK_CONFIG="../zmk-config" 
  #  -DBOARD_ROOT="/d/project/GitHub/zmkesb/zmk"

west build -s app -d "build/${SHIELD}" -b nice_nano_k -- \
  -DSHIELD="${SHIELD}" -DZMK_CONFIG="../zmk-config" 

# west -v build
SRC_FILE="build/${SHIELD}/zephyr/zmk.uf2"
# Generate filename with keyword, e.g., flash_left.uf2, flash_right.uf2, flash_dongle.uf2
DEST_FILE="${DRIVE_P}:/flash_firmware.uf2"
echo "Copying $SRC_FILE to /c/Users/dellht/Downloads/zmk_${SHIELD}.uf2"
cp "$SRC_FILE" "/c/Users/dellht/Downloads/zmk_${SHIELD}.uf2"

  # cp "/d/project/GitHub/zmkesb/zmk/zmkesb/zmk/build/zephyr/zmk.uf2"
polling_check
echo "Copying $SRC_FILE to $DEST_FILE"
cp "$SRC_FILE" "$DEST_FILE"