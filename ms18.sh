#!/bin/bash
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
export SCRIPT_DIR
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"
export Zephyr_DIR="$SCRIPT_DIR/zephyr/share/zephyr-package/cmake"
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"
# ln -sf /usr/bin/python3 /usr/local/bin/python
# Make clean
export ORIG_CWD="$SCRIPT_DIR"
cd "$SCRIPT_DIR" || exit 1
. ./common.sh

DRIVE_P=E

curr_folder=$(pwd)
echo "curr_folder_${curr_folder}"
clear

cd app || exit 1
  rm -rf build
  # -S nrf52833-nosd 
    SHIELD_TARGET="oled" 
    FILE_SUFFIX="_oled"
pwd
echo "Building for: $SHIELD_TARGET "

 
west build -b kblade//zmk \
  -S zmk-usb-logging \
   -- -DSHIELD="prospector_ms18 corne_dongle" -DCONFIG_ZMK_BLE=y \
  -DCONFIG_PROSPECTOR_DISPLAY_LOG_PAGE=y \
  -DCONFIG_USB_DEVICE_PRODUCT=\"DongleProspector\" \
  -DCONFIG_LOG_DEFAULT_LEVEL=2 \
  -DZMK_EXTRA_MODULES="$ORIG_CWD/prospector-zmk-module"


SRC_FILE="build/zephyr/zmk.uf2"
# Generate filename with keyword, e.g., flash_left.uf2, flash_right.uf2, flash_dongle.uf2
DEST_FILE="${DRIVE_P}:/flash${FILE_SUFFIX}.uf2"
DEST_FILE2="../flash${FILE_SUFFIX}_833.uf2"


echo "Copying $SRC_FILE to /c/Users/dellht/Downloads/zmk_${FILE_SUFFIX}.uf2"
cp "$SRC_FILE" "/c/Users/dellht/Downloads/zmk_${FILE_SUFFIX}_ms18_$(date +%H%M).uf2"

polling_check
echo "Copying $SRC_FILE to $DEST_FILE"
cp "$SRC_FILE" "$DEST_FILE"