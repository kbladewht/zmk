#!/bin/bash
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"
export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"

export MY_ZMK_DEV_DIR="D:/project/GitHub/zmk_gitee"


export ZMK_ESB_MODULE_DIRS="D:/project/GitHub/zmkesb/zmk-feature-split-esb"
export NRF_MODULE_DIRS="D:/project/GitHub/zmkesb/zmk-feature-split-esb/nrf"
export NRFXLIB_MODULE_DIRS="D:/project/GitHub/zmkesb/zmk-feature-split-esb/nrfxlib"
export ZMK_MODULE_DIRS="${ZMK_ESB_MODULE_DIRS};${NRF_MODULE_DIRS};${NRFXLIB_MODULE_DIRS}"
export SHIELD="donki36_left"
# export ZMK_CONFIG_DIR="/d/project/GitHub/zmkesb/zmk-config/config"
export ZMK_CONFIG_DIR="../../zmk-config"

cd app
rm -rf build

west build -d "build/${SHIELD}" -b nice_nano_k -S zmk-usb-logging -- \
  -DZEPHYR_EXTRA_MODULES="${ZMK_MODULE_DIRS}" \
  -DSHIELD="${SHIELD}" -DBOARD_ROOT="/d/project/GitHub/zmkesb/zmk/app" \
  -DZMK_CONFIG="${ZMK_CONFIG_DIR}"