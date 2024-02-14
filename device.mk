# Copyright 2014 The Android Open Source Project
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

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=420

# Brightness
SOONG_CONFIG_qtidisplay_brightness := true

# Device characteristics
DEVICE_CHARACTERISTICS += hfr

# Device path
DEVICE_PATH := device/motorola/yume/rootdir

# Model
PRODUCT_MODEL := moto g stylus 5g 2023

# NFC
TARGET_USES_NXP_NFC := true

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/sm6450-common/platform.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/yume/yume-vendor.mk)

BOOT_KERNEL_MODULES := $(sort \
    $(strip $(shell cat device/motorola/yume/modules.load.recovery)) \
    $(strip $(shell cat device/motorola/yume/modules.load.ramdisk)))
