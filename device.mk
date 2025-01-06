#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# ADB
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_PACKAGES += \
    libbt-vendor

# Boot animation
TARGET_SCREEN_HEIGHT := 1080
TARGET_SCREEN_WIDTH := 1920

# Characteristics
PRODUCT_CHARACTERISTICS := tv,nosdcard

# Charger
WITH_CM_CHARGER := false

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapmaxfree=2m \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heaptargetutilization=0.75

# DRM
PRODUCT_PACKAGES += \
    libcrypto_shim \
    libutils_shim

# Ethernet
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# HDMI-CEC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml

PRODUCT_PACKAGES += \
    hdmi_cec.mt8127

# Hearth
PRODUCT_PACKAGES += \
    Hearth

# HWUI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.layer_cache_size=31 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.texture_cache_size=45

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg

# Netflix
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/nrdp.modelgroup.xml:system/etc/permissions/nrdp.modelgroup.xml

# Power
PRODUCT_PACKAGES += \
    power.mt8127

# Rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/bin/init.btmac.sh:system/bin/init.btmac.sh \
    $(LOCAL_PATH)/rootdir/etc/init.device.rc:root/init.device.rc

# TV
PRODUCT_PACKAGES += \
    LineageCustomizer

# USB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Wi-Fi
PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    wpa_supplicant.conf

# Inherit from mt8127-common
$(call inherit-product, device/amazon/mt8127-common/mt8127.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/tank/tank-vendor.mk)

# Inherit the prebuilt ATV common apps
$(call inherit-product, vendor/google/atv/atv-common.mk)
