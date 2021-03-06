# Copyright 2014 The Android Open Source Project
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

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/ivy_dsds/overlay

PRODUCT_COPY_FILES := \
    device/sony/ivy_dsds/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/sony/ivy_dsds/rootdir/system/etc/BCM4356.hcd:system/etc/firmware/BCM43xx.hcd \
    device/sony/ivy_dsds/rootdir/system/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    device/sony/ivy_dsds/rootdir/system/etc/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf \
    device/sony/ivy_dsds/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    device/sony/ivy_dsds/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/sony/ivy_dsds/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    device/sony/ivy_dsds/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

# Device Init
PRODUCT_PACKAGES += \
    init.recovery.ivy \
    init.ivy \
    ueventd.ivy

# Lights
PRODUCT_PACKAGES += \
    lights.ivy

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.ivy

# NFC config
PRODUCT_PACKAGES += \
    nfc_nci.ivy

PRODUCT_AAPT_CONFIG := large
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=480 \
    ro.usb.pid_suffix=1C9 \
    persist.radio.mutlisim.config=dsds \
    persist.multisim.config=dsds \
    telephony.lteOnCdmaDevice=0 \
    ro.telephony.default_network=0,1

# Dalvik VM specific for devices with 2048 MB of RAM (While the E6533 has more RAM, this setting is recommended)
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/kitakami/platform.mk)
$(call inherit-product, vendor/sony/kitakami-ivy/ivy-vendor.mk)

# copy wlan firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4356/device-bcm.mk)

# Default.prop overrides to get adb working at boot
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1
