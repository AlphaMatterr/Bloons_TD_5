GO_EASY_ON_ME = 1
include theos/makefiles/common.mk
ARCHS = armv7 arm64

TWEAK_NAME = bloonstd5
bloonstd5_FILES = Tweak.xm
bloonstd5_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
