#!/bin/bash
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE=tank
export DEVICE_COMMON=mt8127-common
export VENDOR=amazon

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
