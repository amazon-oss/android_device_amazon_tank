#!/system/bin/sh
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

cat /proc/idme/bt_mac_addr | cut -c 1-12 | sed 's/../&:/g; s/:$//' > /data/misc/bluetooth/bdaddr
