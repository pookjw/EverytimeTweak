TARGET := iphone:clang
export ARCHS=arm64 arm64e
PACKAGE_VERSION=1.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = EverytimeTweakCCModule

$(BUNDLE_NAME)_BUNDLE_EXTENSION = bundle
$(BUNDLE_NAME)_CFLAGS +=  -fobjc-arc -I$(THEOS_PROJECT_DIR)/headers
$(BUNDLE_NAME)_LIBRARIES = rocketbootstrap
$(BUNDLE_NAME)_FILES = $(wildcard sources/ViewControllers/*.m) $(wildcard sources/Model/*.m)
$(BUNDLE_NAME)_LDFLAGS += $(THEOS_PROJECT_DIR)/Frameworks/ControlCenterUIKit.tbd
$(BUNDLE_NAME)_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
