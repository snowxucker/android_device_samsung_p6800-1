#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := p6800
PRODUCT_MANUFACTURER := Samsung
PRODUCT_MODEL := GT-P6800
PRODUCT_NAME := cm_p6800
PRODUCT_RELEASE_NAME := GT-P6800

# Set product name and build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-P6800 BUILD_FINGERPRINT="samsung/GT-P6800/GT-P6800:4.0.4/IMM76D/XXLQ1:user/release-keys" PRIVATE_BUILD_DESC="GT-P6800-user 4.0.4 IMM76D XXLQ1 release-keys"

# Environmental configuration
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOARD_PLATFORM := exynos4
TARGET_FAMILY := p6800
TARGET_SOC := exynos4210
TARGET_BOOTLOADER_BOARD_NAME := smdk4210
TARGET_BOARD_INFO_FILE := device/samsung/p6800/board-info.txt

EXYNOS4_ENHANCEMENTS := true
EXYNOS4210_ENHANCEMENTS := true
COMMON_GLOBAL_CFLAGS += -DEXYNOS4_ENHANCEMENTS
COMMON_GLOBAL_CFLAGS += -DEXYNOS4210_ENHANCEMENTS
COMMON_GLOBAL_CFLAGS += -DEXYNOS4210_TABLET
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

DEVICE_PACKAGE_OVERLAYS += device/samsung/p6800/overlay
TARGET_SPECIFIC_HEADER_PATH += device/samsung/p6800/overlay/include

# Init
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/p6800
TARGET_KERNEL_MODULES := CLEAN_MODULES
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE :=
CLEAN_MODULES := arm-eabi-strip --strip-debug `find $(KERNEL_MODULES_OUT) -name *.ko`

# Filesystem
BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 872415232
BOARD_USERDATAIMAGE_PARTITION_SIZE := 14138998784
BOARD_FLASH_BLOCK_SIZE := 1024
TARGET_USERIMAGES_USE_EXT4 := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 12
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/s3c-usbgadget/gadget/lun%d/file"

# Graphics
BOARD_EGL_CFG := device/samsung/p6800/configs/egl.cfg
BOARD_EGL_NEEDS_LEGACY_FB := true
USE_OPENGL_RENDERER := true
ENABLE_WEBGL := true

# Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# HWComposer
BOARD_USES_HWCOMPOSER := true
BOARD_USE_SYSFS_VSYNC_NOTIFICATION := true
BOARD_USES_FIMGAPI := true

# TVOut
BOARD_USES_SKTEXTBOX := true

# OMX
BOARD_USE_SAMSUNG_COLORFORMAT := true
BOARD_NONBLOCK_MODE_PROCESS := true
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USES_MFC_FPS := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USE_TINYALSA_AUDIO := true
BOARD_USE_YAMAHA_MC1N2_AUDIO = true

# Camera
BOARD_USES_PROPRIETARY_LIBCAMERA := true
BOARD_USES_PROPRIETARY_LIBFIMC := true
BOARD_CAMERA_HAVE_ISO := true
COMMON_GLOBAL_CFLAGS += -DHAVE_ISO
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_CSR := true
TARGET_CUSTOM_BLUEDROID := device/samsung/p6800/bluetooth.c

# Wifi
BOARD_WLAN_DEVICE                := ath6kl
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/ath6kl.ko"
WIFI_DRIVER_MODULE_NAME          := ath6kl
WIFI_DRIVER_LOADER_DELAY         := 1000000
BOARD_HAVE_SAMSUNG_WIFI          := true

# Charging Mode (LPM)
BOARD_CHARGING_MODE_BOOTING_LPM := "/sys/class/power_supply/battery/batt_lp_charging"
BOARD_BATTERY_DEVICE_NAME := "battery"

# Recovery
TARGET_RECOVERY_INITRC := device/samsung/p6800/recovery.rc
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Many shipped smdk4210 devices have defective eMMC chips (VYL00M fwrev 0x19)
# Prevent usage of ERASE commands in recovery on these boards.
# This is redundant for our recovery since the kernel has MMC_CAP_ERASE
# disabled for mshci.c, however it makes nightly ZIPs safer to flash
# from kernels that still have MMC_CAP_ERASE enabled.
BOARD_SUPPRESS_EMMC_WIPE := true

# Releasetools
# TODO: use standard BOOTIMG_MK
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/p6800/bootimg.mk
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/samsung/p6800/releasetools/ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := device/samsung/p6800/releasetools/img_from_target_files
