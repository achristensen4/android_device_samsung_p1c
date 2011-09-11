# Copyright (C) 2010 The Android Open Source Project
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


# This file is the device-specific product definition file for
# crespo. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that crespo is not a fully open device. Some of the drivers
# aren't publicly available in all circumstances, which means that some
# of the hardware capabilities aren't present in builds where those
# drivers aren't available. Such cases are handled by having this file
# separated into two halves: this half here contains the parts that
# are available to everyone, while another half in the vendor/ hierarchy
# augments that set with the parts that are only relevant when all the
# associated drivers are available. Aspects that are irrelevant but
# harmless in no-driver builds should be kept here for simplicity and
# transparency. There are two variants of the half that deals with
# the unavailable drivers: one is directly checked into the unreleased
# vendor tree and is used by engineers who have access to it. The other
# is generated by setup-makefile.sh in the same directory as this files,
# and is used by people who have access to binary versions of the drivers
# but not to the original vendor tree. Be sure to update both.


# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/samsung/vzwtab/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
	device/samsung/vzwtab/prebuilt/etc/asound.conf:system/etc/asound.conf \
	device/samsung/vzwtab/egl.cfg:system/lib/egl/egl.cfg

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/vzwtab/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/vzwtab/prebuilt/usr/keylayout/p1_keyboard.kl:system/usr/keylayout/p1_keyboard.kl

# Generated kcm keymaps
PRODUCT_PACKAGES := \
       cypress-touchkey.kcm \
       s3c-keypad.kcm

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/aries-common/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
	device/samsung/vzwtab/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
	libSEC_OMX_Core.aries \
	libOMX.SEC.AVC.Decoder.aries \
	libOMX.SEC.M4V.Decoder.aries \
	libOMX.SEC.M4V.Encoder.aries \
	libOMX.SEC.AVC.Encoder.aries

# Libs
PRODUCT_PACKAGES += \
	libstagefrighthw
#	libcamera

# apns config file
PRODUCT_COPY_FILES += \
        device/samsung/vzwtab/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# 3G
PRODUCT_COPY_FILES += \
	device/samsung/vzwtab/prebuilt/bin/pppd_runner:system/bin/pppd_runner

# WiFi
PRODUCT_COPY_FILES += \
	device/samsung/vzwtab/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
        frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# extra stuff
PRODUCT_COPY_FILES += \
	device/samsung/vzwtab/prebuilt/xbin/bmlwrite:system/xbin/bmlwrite \
	device/samsung/vzwtab/prebuilt/xbin/ro:system/xbin/ro \
	device/samsung/vzwtab/prebuilt/xbin/rw:system/xbin/rw

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072

# Verizon cdma stuff
PRODUCT_PROPERTY_OVERRIDES += \
       ro.telephony.default_network=4 \
       ro.ril.def.agps.mode=2 \
       ro.ril.samsung_cdma=true \
       ro.cdma.home.operator.numeric=310004 \
       ro.cdma.home.operator.alpha=Verizon \
       ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
       ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
       ro.config.vc_call_vol_steps=15 \
       ro.cdma.otaspnumschema=SELC,3,00,07,80,87,88,99 \
       ro.telephony.call_ring.multiple=false \
       ro.telephony.call_ring.delay=3000 \
       ro.telephony.call_ring.absent=true \
       net.cdma.pppd.authtype=require-chap \
       net.cdma.pppd.user=user[SPACE]VerizonWireless \
       net.cdma.datalinkinterface=/dev/ttyCDMA0 \
       net.cdma.ppp.interface=ppp0 \
       net.connectivity.type=CDMA1 \
       net.interfaces.defaultroute=cdma \
       ro.telephony.ril_class=samsung \
       mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
       ro.sf.hwrotation=90

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=eth0 \
       wifi.supplicant_scan_interval=20 \
       dalvik.vm.heapsize=48m

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Screen density is actually considered a locale (since it is taken into account
# the the build-time selection of resources). The product definitions including
# this file must pay attention to the fact that the first entry in the final
# PRODUCT_LOCALES expansion must not be a density.
PRODUCT_LOCALES := hdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/vzwtab/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/vzwtab/vzwtab-vendor.mk)
