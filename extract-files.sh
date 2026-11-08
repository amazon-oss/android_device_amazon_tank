#!/bin/bash
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        bin/mdp_server|lib/libdpframework.so|lib/libqservice.so)
            add_needed libbinder_shim.so "${2}"
            ;;
        lib/hw/hwcomposer.mt8127.so)
            # Return the config index from getActiveConfig, not the HDMI mode
            sigscan "07 b5 49 b1 00 91 06 20 08 49 09 4a 09 4b 79 44" \
                "10 b5 09 48 78 44 09 49 79 44 ff f7 a1 ff 08 4a \
                7a 44 00 23 14 68 84 42 04 d0 14 32 01 33 0b 2b \
                f8 db 00 23 18 46 10 bd 9f 81 00 00 b7 81 00 00 \
                c8 c1 00 00" "${2}"
            ;;
        lib/libMali.so)
            # Grow the code segment over the stub below
            sigscan "d4 90 10 00 d4 90 10 00 05 00 00 00" "e4 90 10 00 e4 90 10 00" "${2}"
            # Branch to the stub when cancelling window buffers
            sigscan "3c c0 97 e5 14 e0 9c e5" "3c c0 97 e5 20 de 03 ea" "${2}"
            # Skip buffers whose handle is already gone
            sigscan "5c 00 00 00 01 00 00 00 02 00 00 00 04 00 00 00 \
                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" \
                "5c 00 00 00 01 00 00 00 02 00 00 00 04 00 00 00 \
                00 00 5c e3 1c 22 fc 0a 14 e0 9c e5 da 21 fc ea" "${2}"
            # Keep the dequeue limit when the swap interval changes
            sigscan "01 10 6c 00 08 10 87 e5" "01 10 6c 00 00 f0 20 e3" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=tank
export DEVICE_COMMON=mt8127-common
export VENDOR=amazon

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
