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

$(call inherit-product, device/nubia/nx609j/full_nx609j.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_nx609j
PRODUCT_DEVICE := nx609j
PRODUCT_MANUFACTURER := nubia
PRODUCT_MODEL := NX609J

PRODUCT_GMS_CLIENTID_BASE := android-zte

PRODUCT_BRAND := nubia
TARGET_VENDOR := nubia
TARGET_VENDOR_PRODUCT_NAME := NX609J
TARGET_VENDOR_DEVICE_NAME := NX609J

PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=NX609J PRODUCT_NAME=NX609J

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="NX609J-user 8.1.0 OPM1.171019.011 eng.nubia.20190111.223500 release-keys"

BUILD_FINGERPRINT := nubia/NX609J/NX609J:8.1.0/OPM1.171019.011/eng.nubia.20190111.223500:user/release-keys
