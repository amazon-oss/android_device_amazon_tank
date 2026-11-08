#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/amazon/tank

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/vnd_tank.txt
BOARD_HAVE_BLUETOOTH_BCM := true

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

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Wi-Fi
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_NAME := bcmdhd
WIFI_DRIVER_MODULE_PATH := /system/lib/modules/bcmdhd.ko
WIFI_DRIVER_OPERSTATE_PATH := /sys/class/net/wlan0/operstate

# Inherit from mt8127-common
include device/amazon/mt8127-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/amazon/tank/BoardConfigVendor.mk
