#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/halium.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/xiaomi/raphael/raphael-vendor.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \

# Properties
-include $(LOCAL_PATH)/system_prop.mk

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml

# Camera motor
PRODUCT_PACKAGES += \
    libdng_sdk.vendor \
    libgui_vendor \
    vendor.lineage.camera.motor@1.0-service.xiaomi_raphael

# Display
PRODUCT_PACKAGES += \
    libvulkan

# Fingerprint
PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

#PRODUCT_PACKAGES += \
#    lineage.biometrics.fingerprint.inscreen@1.0-service.raphael

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# HotwordEnrollement
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:system/etc/permissions/privapp-permissions-hotword.xml

# Init
PRODUCT_PACKAGES += \
    init.mi_thermald.rc \
    init.qcom.rc

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/sm8150-tavil-snd-card_Button_Jack.kl:system/usr/keylayout/sm8150-tavil-snd-card_Button_Jack.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:system/etc/media_profiles_vendor.xml

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    com.nxp.nfc.nq \
    libnqnfc-nci \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
    NQNfcNci \
    SecureElement \
    Tag

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service

# WiFi Display
PRODUCT_PACKAGES += \
    libnl

# Ubuntu Touch
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ubuntu/70-android.rules:system/halium/lib/udev/rules.d/70-android.rules \
    $(LOCAL_PATH)/ubuntu/android.conf:system/halium/etc/ubuntu-touch-session.d/android.conf \
    $(LOCAL_PATH)/ubuntu/setupusb:system/halium/usr/share/usbinit/setupusb \
    $(LOCAL_PATH)/ubuntu/mtp-state.conf:system/halium/etc/init/mtp-state.conf \
    $(LOCAL_PATH)/ubuntu/mtp-server.conf:system/halium/usr/share/upstart/sessions/mtp-server.conf \
    $(LOCAL_PATH)/ubuntu/apparmor.d/local/usr.bin.media-hub-server:system/halium/etc/apparmor.d/local/usr.bin.media-hub-server \
    $(LOCAL_PATH)/ubuntu/apparmor.d/abstractions/base:system/halium/etc/apparmor.d/abstractions/base \
    $(LOCAL_PATH)/ubuntu/apparmor.d/hardware/graphics.d/apparmor-easyprof-ubuntu_android:system/halium/usr/share/apparmor/hardware/graphics.d/apparmor-easyprof-ubuntu_android \
    $(LOCAL_PATH)/ubuntu/apparmor.d/hardware/video.d/apparmor-easyprof-ubuntu_android:system/halium/usr/share/apparmor/hardware/video.d/apparmor-easyprof-ubuntu_android \
    $(LOCAL_PATH)/ubuntu/biometryd.conf:system/halium/etc/init/biometryd.conf

#    $(LOCAL_PATH)/ubuntu/ofono.override:system/halium/etc/init/ofono.override \
#    $(LOCAL_PATH)/ubuntu/timekeeper.conf:system/halium/etc/init/timekeeper.conf \
#    $(LOCAL_PATH)/ubuntu/config-default.xml:system/halium/usr/share/powerd/device_configs/config-default.xml

PRODUCT_PACKAGES += \
   charger_res_images

PRODUCT_PROPERTY_OVERRIDES += \
    ril.num_slots=2
#    ro.t-o.quirk.forcesink=sink.primary_output \
#    ro.t-o.quirk.forcesource=source.primary_input \
