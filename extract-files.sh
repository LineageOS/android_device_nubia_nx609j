#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
    # Patch blobs for VNDK
    vendor/lib/hw/camera.msm8998.so)
        "${PATCHELF}" --remove-needed "libgui.so" "${2}"
        "${PATCHELF}" --remove-needed "libandroid.so" "${2}"
        "${PATCHELF}" --remove-needed "android.hidl.base@1.0.so" "${2}"
        ;;
    vendor/lib/libnubia_effect.so | vendor/lib64/libnubia_effect.so)
        "${PATCHELF}" --remove-needed "libgui.so" "${2}"
        ;;
    vendor/lib/libNubiaImageAlgorithm.so)
        "${PATCHELF}" --remove-needed  "libjnigraphics.so" "${2}"
        "${PATCHELF}" --remove-needed  "libnativehelper.so" "${2}"
        "${PATCHELF}" --add-needed "libui_shim.so" "${2}"
        "${PATCHELF}" --add-needed "libNubiaImageAlgorithm_shim.so" "${2}"
        ;;
    vendor/lib/libarcsoft_picauto.so)
        "${PATCHELF}" --remove-needed "libandroid.so" "${2}"
        ;;
    vendor/lib64/libgf_hal.so)
        "${PATCHELF}" --remove-needed "libpowermanager.so" "${2}"
        ;;
    vendor/lib64/libgoodixfingerprintd_binder.so)
        "${PATCHELF}" --add-needed "libbinder_shim.so" "${2}"
        ;;
    vendor/lib64/android.hardware.gatekeeper@1.0.so | vendor/lib64/vendor.goodix.hardware.fingerprint@1.0.so)
        "${PATCHELF}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
        ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

# Required!
export DEVICE=nx609j
export DEVICE_COMMON=msm8998-common
export VENDOR=nubia

export DEVICE_BRINGUP_YEAR=2017

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
