#!/bin/bash
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"
export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"

# Make clean
export ORIG_CWD=$(pwd)
# . ./common.sh

DRIVE_P=E


# cd app
rm -rf build
rm -rf app/build

cd app

# west build -p always -b xiao_ble//zmk -- \
#   -DSHIELD="corne_dongle prospector_adapter" \
#   -DZMK_EXTRA_MODULES="D:/project/GitHub/zmk_0917_offical/prospector-zmk-module"

west build -p always -b xiao_ble//zmk -- \
  -DSHIELD="corne_dongle " \
  -DZMK_EXTRA_MODULES="D:/project/GitHub/zmk_0917_offical/prospector-zmk-module"