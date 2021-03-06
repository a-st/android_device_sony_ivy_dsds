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

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/ivy_dsds/device.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# DSDS specific properties
PRODUCT_PROPERTY_OVERRIDES += \
	persist.radio.multisim.config=dsds \
	persist.multisim.config=dsds \
	telephony.lteOnCdmaDevice=0 \
	ro.telephony.default_network=0,1

# DSDS second ril start script
PRODUCT_COPY_FILES += \
	device/sony/kitakami/rootdir/init.class_main.sh:root/init.class_main.sh

PRODUCT_NAME := full_ivy_dsds
PRODUCT_DEVICE := ivy_dsds
PRODUCT_MODEL := E6533
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
