TARGET := iphone:clang:latest:11.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MenuSupport
MenuSupport_FILES = Tweak.x
MenuSupport_CFLAGS = -fobjc-arc
MenuSupport_FRAMEWORKS = UIKit 

include $(THEOS_MAKE_PATH)/tweak.mk
