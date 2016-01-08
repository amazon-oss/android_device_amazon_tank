#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/amazon/tank

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := tank

# Dexpreopt
WITH_DEXPREOPT := true
WITH_DEXPREOPT_PIC := true

# Kernel
TARGET_KERNEL_ADDITIONAL_CONFIG := tank.config

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 262144000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 901775360
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6583598080

# Inherit from mt8127-common
include device/amazon/mt8127-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/amazon/tank/BoardConfigVendor.mk
