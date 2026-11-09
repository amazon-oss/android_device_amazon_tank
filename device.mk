#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Characteristics
PRODUCT_CHARACTERISTICS := tv,nosdcard

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapmaxfree=2m \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heaptargetutilization=0.75

# HWUI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.layer_cache_size=31 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.texture_cache_size=45

# Inherit from mt8127-common
$(call inherit-product, device/amazon/mt8127-common/mt8127.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/tank/tank-vendor.mk)
