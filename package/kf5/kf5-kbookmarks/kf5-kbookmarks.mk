################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KBOOKMARKS_VERSION = $(KF5_VERSION)
KF5_KBOOKMARKS_SITE = $(KF5_SITE)
KF5_KBOOKMARKS_SOURCE = kbookmarks-$(KF5_KBOOKMARKS_VERSION).tar.xz
KF5_KBOOKMARKS_LICENSE = LGPL-2.1
KF5_KBOOKMARKS_LICENSE_FILES = COPYING.LIB

KF5_KBOOKMARKS_DEPENDENCIES = kf5-extra-cmake-modules kf5-kconfig kf5-kcodecs kf5-kconfigwidgets kf5-kiconthemes kf5-kxmlgui
KF5_KBOOKMARKS_INSTALL_STAGING = YES

KF5_KBOOKMARKS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KBOOKMARKS_CXXFLAGS += -latomic
endif

KF5_KBOOKMARKS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KBOOKMARKS_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KBOOKMARKS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
