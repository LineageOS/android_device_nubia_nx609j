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

# Inherit from common msm8998-common
include device/nubia/msm8998-common/BoardConfigCommon.mk

DEVICE_PATH := device/nubia/nx609j

# OTA Assert
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := NX609J,nx609j

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := lineageos_nx609j_defconfig

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_VENDORIMAGE_PARTITION_SIZE := 838860800

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/vendor/etc/fstab.qcom

# Security patch level
VENDOR_SECURITY_PATCH := 2021-03-01

# Tap-to-wake
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/soc/c179000.i2c/i2c-5/5-004b/input/input1/wake_gesture"

# Display
TARGET_SCREEN_DENSITY := 420

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# inherit from the proprietary version
include vendor/nubia/nx609j/BoardConfigVendor.mk
