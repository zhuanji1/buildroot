################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KXMLGUI_VERSION = $(KF5_VERSION)
KF5_KXMLGUI_SITE = $(KF5_SITE)
KF5_KXMLGUI_SOURCE = kxmlgui-$(KF5_KXMLGUI_VERSION).tar.xz
KF5_KXMLGUI_LICENSE = LGPL-2.1
KF5_KXMLGUI_LICENSE_FILES = COPYING.LIB

KF5_KXMLGUI_DEPENDENCIES = kf5-extra-cmake-modules kf5-ktextwidgets kf5-kglobalaccel openssl kf5-kcompletion kf5-kguiaddons kf5-karchive kf5-kservice kf5-kdbusaddons
KF5_KXMLGUI_INSTALL_STAGING = YES

KF5_KXMLGUI_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KXMLGUI_CXXFLAGS += -latomic
endif

KF5_KXMLGUI_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KXMLGUI_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KXMLGUI_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
