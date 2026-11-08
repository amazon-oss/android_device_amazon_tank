#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from device makefile.
$(call inherit-product, device/amazon/tank/device.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/atv/products/atv_base.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_tv.mk)

PRODUCT_NAME := lineage_tank
PRODUCT_DEVICE := tank
PRODUCT_MANUFACTURER := Amazon
PRODUCT_BRAND := Amazon
PRODUCT_MODEL := AFTT
