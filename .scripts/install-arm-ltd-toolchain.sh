#!/bin/sh

set -e

#ARMLTD_TC_VER="8-2018-q4"
#ARMLTD_TC_VERDIR="8-2018q4"
#ARMLTD_TC_SEVERITY="major"
#ARMLTD_TC_OS="linux"
#ARMLTD_TC_ARCHIVE=".tar.bz2"
URL="https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/${ARMLTD_TC_VERDIR}/gcc-arm-none-eabi-${ARMLTD_TC_VER}-${ARMLTD_TC_SEVERITY}-${ARMLTD_TC_OS}${ARMLTD_TC_ARCHIVE}"
IMG="gcc-arm-none-eabi-${ARMLTD_TC_VER}-${ARMLTD_TC_SEVERITY}-${ARMLTD_TC_OS}${ARMLTD_TC_ARCHIVE}"

curl "${URL}" -o "${IMG}"

echo "extracting ${IMG} to /opt/arm"

case "${ARMLTD_TC_ARCHIVE}" in
	".tar.bz2")
		mkdir -p /opt/arm
		tar xpjf "${IMG}" -C /opt/arm
		;;
	*)
		echo "unknown archive format ${ARMLTD_TC_ARCHIVE}"
		exit 1
	;;
esac
