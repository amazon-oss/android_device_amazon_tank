#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Characteristics
PRODUCT_CHARACTERISTICS := tv,nosdcard

# Inherit from mt8127-common
$(call inherit-product, device/amazon/mt8127-common/mt8127.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/tank/tank-vendor.mk)
