#
# Copyright (C) 2017 The LineageOS Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Inherit from msm8998-common
$(call inherit-product, device/nubia/msm8998-common/msm8998.mk)

# Individual audio configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml

# Bootanimation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0_32 \
    android.frameworks.displayservice@1.0.vendor \
    libNubiaImageAlgorithm_shim \
    libui_shim.vendor_32

# Display configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/display/qdcm_calib_data_jdi_td4310_1080_2160_5p99_video_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_jdi_td4310_1080_2160_5p99_video_dsi_panel.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# KeyHandler
PRODUCT_PACKAGES += \
    KeyHandler

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.nx609j

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/system-privapp-permissions-nubia.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-nubia.xml

# Ramdisk scripts
PRODUCT_PACKAGES += \
    fstab.qcom

PRODUCT_PACKAGES += \
    init.nubia.device.rc \
    init.nubia.touch.lcd.rc

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# VNDK
# Update this list with what each blob is actually for
# libstdc++: camera.msm8998
# libbinder_shim: libgoodixfingerprintd_binder.so
PRODUCT_PACKAGES += \
    libstdc++.vendor \
    libbinder_shim

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v29/arm64/arch-arm64-armv8-a/shared/vndk-sp/libbinderthreadstate.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libbinderthreadstate.so

# Wifi
PRODUCT_PACKAGES += \
    WifiOverlay_nx609j

# Get non-open-source specific aspects
$(call inherit-product, vendor/nubia/nx609j/nx609j-vendor.mk)
