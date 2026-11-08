#!/bin/bash
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        bin/amzn_dha_hmac)
            add_needed libcrypto_shim.so "${2}"
            ;;
        bin/amzn_dha_tool)
            # Read the EVP_PKEY type at its BoringSSL offset
            sigscan "80 46 00 68" "80 46 40 68" "${2}"
            sigscan "07 46 00 68" "07 46 40 68" "${2}"
            # Read the RSA exponent at its BoringSSL offset
            sigscan "82 46 00 28 e9 d0 40 69" "82 46 00 28 e9 d0 80 68" "${2}"
            sigscan "05 46 00 28 eb d0 40 69" "05 46 00 28 eb d0 80 68" "${2}"
            # Read the RSA modulus at its BoringSSL offset
            sigscan "da f8 10 00" "da f8 04 00" "${2}"
            add_needed libcrypto_shim.so "${2}"
            ;;
        bin/mdp_server|lib/libdpframework.so|lib/libqservice.so)
            add_needed libbinder_shim.so "${2}"
            ;;
        lib/hw/audio.btle.default.so)
            # Allocate the Nougat sized audio_stream_in
            sigscan "64 58 44 21 25 60" "64 58 48 21" "${2}"
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
        lib/libMtkOmxVdec.so)
            add_needed libui_shim.so "${2}"
            ;;
        lib/libMtkOmxVenc.so)
            # Allocate the Nougat sized GraphicBuffer
            sigscan "07 af 80 20 d9 b1" "07 af 88 20" "${2}"
            add_needed libui_shim.so "${2}"
            ;;
        usr/keylayout/*.kl)
            # Map key labels that Nougat does not know
            sed -i -E \
                -e '/^key\s+[0-9]+\s+SHOP\b/d' \
                -e 's/^(key\s+[0-9]+\s+)APP_([1-4])\b/\1BUTTON_\2/' \
                -e 's/^(key\s+[0-9]+\s+)APP_5\b/\1BUTTON_MODE/' \
                -e 's/^(key\s+[0-9]+\s+)HASH\b/\1POUND/' \
                -e 's/^(key\s+[0-9]+\s+)LIVE_TV\b/\1TV/' \
                -e 's/^(key\s+[0-9]+\s+)RECENTS\b/\1APP_SWITCH/' \
                "${2}"
            ;;
        vendor/lib/mediadrm/libwvdrmengine.so)
            # Load DecryptCTR for OEMCrypto v9 libraries as well
            sigscan "c4 f8 c4 00 00 28 40 f0 9d 81" "c4 f8 c4 00 00 28 40 f0 eb 80" "${2}"
            # Resolve sp_report_race through libutils_shim
            add_needed libutils_shim.so "${2}"
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
