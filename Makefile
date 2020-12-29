TARGET := iphone:clang
INSTALL_TARGET_PROCESSES = everytime SpringBoard
export ARCHS=arm64 arm64e
PACKAGE_VERSION=1.1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = EverytimeTweak

$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_LIBRARIES = rocketbootstrap
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -I$(THEOS_PROJECT_DIR)/headers

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += EverytimeTweakCCModule
include $(THEOS_MAKE_PATH)/aggregate.mk