#!/bin/bash
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"
export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"

# Make clean
export ORIG_CWD=$(pwd)
. ./common.sh

DRIVE_P=E
DRIVE_P=E


# cd app
rm -rf build
rm -rf app/build

cd app

# west build -p always -b xiao_ble//zmk -- \
#   -DSHIELD="corne_dongle prospector_adapter" \
#   -DZMK_EXTRA_MODULES="D:/project/GitHub/zmk_0917_offical/prospector-zmk-module"

west build -p always -b xiao_ble//zmk -- \
  -DSHIELD="corne_dongle prospector_adapter" \
  -DZMK_EXTRA_MODULES="D:/project/GitHub/zmk_0917_offical/prospector-zmk-module"

  cp "build/zephyr/zmk.uf2" "/c/Users/dellht/Downloads/receiver_oled_$(date +%H%M%S).uf2"

echo "Copy the uf2 file to /c/Users/dellht/Downloads/receiver_oled_$(date +%H%M%S).uf2"

SRC_FILE="build/zephyr/zmk.uf2"
# Generate filename with keyword, e.g., flash_left.uf2, flash_right.uf2, flash_dongle.uf2
DEST_FILE="${DRIVE_P}:/flash${FILE_SUFFIX}.uf2"
polling_check
echo "Copying $SRC_FILE to $DEST_FILE"
cp "$SRC_FILE" "$DEST_FILE"