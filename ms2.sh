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


  # BIG=""
 
if ! west build -b kblade//zmk \
  -S zmk-usb-logging \
   -- -DSHIELD="prospector_ms2 corne_dongle" -DCONFIG_ZMK_BLE=y \
  -DKEYBOARD=pilot/npad -DKEYMAP=corne_dongle \
  -DCONFIG_PROSPECTOR_DISPLAY_LOG_PAGE=y \
  -DCONFIG_USB_DEVICE_PRODUCT=\"DongleProspector\" \
  -DCONFIG_LOG_DEFAULT_LEVEL=2 \
  $BIG \
  -DZMK_EXTRA_MODULES="$ORIG_CWD/prospector-zmk-module"; then
  echo "West build failed; skipping UF2 copy and device polling." >&2
  exit 1
fi
  
