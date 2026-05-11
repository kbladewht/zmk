/*
 * Copyright (c) 2020 The ZMK Contributors
 *
 * SPDX-License-Identifier: MIT
 */

#define DT_DRV_COMPAT zmk_behavior_to_esb

#include <zephyr/device.h>
#include <drivers/behavior.h>
#include <zephyr/logging/log.h>

#include <zmk/keymap.h>
#include <zmk/behavior.h>

LOG_MODULE_DECLARE(zmk, CONFIG_ZMK_LOG_LEVEL);

#if DT_HAS_COMPAT_STATUS_OKAY(DT_DRV_COMPAT)
struct behavior_to_config {
    bool esb_mode;
};
static int esb_binding_pressed(struct zmk_behavior_binding *binding,
                               struct zmk_behavior_binding_event event) {
    LOG_DBG("position %d layer %d", event.position, binding->param1);
    const struct behavior_to_config *cfg = zmk_behavior_get_binding(binding->behavior_dev)->config;

    LOG_INF("Change to esb %d \n", cfg->esb_mode);
    NRF_POWER->GPREGRET2 = 0xE5; // 代表转向esb
    extern FUNC_NORETURN void sys_reboot(int type);
    sys_reboot(0); // SYS_REBOOT_WARM 0
    return ZMK_BEHAVIOR_OPAQUE;
}

static int esb_binding_released(struct zmk_behavior_binding *binding,
                                struct zmk_behavior_binding_event event) {
    // LOG_DBG("2222 position %d layer %d\n", event.position, binding->param1);
    return ZMK_BEHAVIOR_OPAQUE;
}

static const struct behavior_driver_api behavior_esb_driver_api = {
    .binding_pressed = esb_binding_pressed,
    .binding_released = esb_binding_released,

};

#define ESB_INST(n)                                                                                \
    BEHAVIOR_DT_INST_DEFINE(n, NULL, NULL, NULL, NULL, POST_KERNEL,                                \
                            CONFIG_KERNEL_INIT_PRIORITY_DEFAULT, &behavior_esb_driver_api);

DT_INST_FOREACH_STATUS_OKAY(ESB_INST)

#endif /* DT_HAS_COMPAT_STATUS_OKAY(DT_DRV_COMPAT) */
