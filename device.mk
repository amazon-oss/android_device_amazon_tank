#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mt8127-common
$(call inherit-product, device/amazon/mt8127-common/mt8127.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/tank/tank-vendor.mk)
