#!/bin/bash
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"
export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"

# export MY_ZMK_DEV_DIR="D:/project/GitHub/zmk_gitee"

export NRF_MODULE_DIRS="../zmk-feature-split-esb/nrf"
export NRFXLIB_MODULE_DIRS="../zmk-feature-split-esb/nrfxlib"
export ZMK_ESB_MODULE_DIRS="../zmk-feature-split-esb"
# export ZMK_MODULE_DIRS="${ZMK_ESB_MODULE_DIRS}"
# export ZMK_ESB_MODULE_DIRS="D:/project/GitHub/zmkesb/zmk-feature-split-esb"
# export NRF_MODULE_DIRS="nrf"
# export NRFXLIB_MODULE_DIRS="nrfxlib"
# export ZMK_MODULE_DIRS="${ZMK_ESB_MODULE_DIRS};${NRF_MODULE_DIRS};${NRFXLIB_MODULE_DIRS}"
# export SHIELD="donki36_left"

export SHIELD="p42_right"
export BOARD="nice_nano_k"
# export ZMK_CONFIG_DIR="/d/project/GitHub/zmkesb/zmk-config/config"
export ZMK_CONFIG_DIR="../zmk-config"

# cd app
rm -rf build
rm -rf app/build

west build -s app -d "build/${SHIELD}" -b nice_nano_k -S zmk-usb-logging -- \
  -DSHIELD="${SHIELD}" -DZMK_CONFIG="../zmk-config" 
  #  -DBOARD_ROOT="/d/project/GitHub/zmkesb/zmk"


  # cp "/d/project/GitHub/zmkesb/zmk/zmkesb/zmk/build/zephyr/zmk.uf2"

# zmkesb\zmk\build\donki36_left\zephyr
cp "/d/project/GitHub/zmkesb/zmk/build/p42_right/zephyr/zmk.uf2" "E:/flash.uf2"