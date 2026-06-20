# Copyright (c) 2020-2023 The ZMK Contributors
# SPDX-License-Identifier: MIT

zephyr_library_amend()
zephyr_library_sources_ifdef(CONFIG_ZMK_KSCAN_GPIO_DRIVER kscan_gpio.c)

message("555555:==== ${CONFIG_ZMK_QF_595}")

if(CONFIG_ZMK_QF_595)
    message("44444456:==== using kscan_gpio_matrix_595.c")
    zephyr_library_sources(kscan_gpio_matrix_595.c)
else()
    message("44444489:==== using kscan_gpio_matrix_zmk.c")
    zephyr_library_sources(kscan_gpio_matrix.c)
endif()


zephyr_library_sources_ifdef(CONFIG_ZMK_KSCAN_GPIO_CHARLIEPLEX kscan_gpio_charlieplex.c)
zephyr_library_sources_ifdef(CONFIG_ZMK_KSCAN_GPIO_DIRECT kscan_gpio_direct.c)
zephyr_library_sources_ifdef(CONFIG_ZMK_KSCAN_GPIO_DEMUX kscan_gpio_demux.c)
zephyr_library_sources_ifdef(CONFIG_ZMK_KSCAN_MOCK_DRIVER kscan_mock.c)
zephyr_library_sources_ifdef(CONFIG_ZMK_KSCAN_COMPOSITE_DRIVER kscan_composite.c)
