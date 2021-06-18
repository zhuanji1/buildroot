################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KICONTHEMES_VERSION = $(KF5_VERSION)
KF5_KICONTHEMES_SITE = $(KF5_SITE)
KF5_KICONTHEMES_SOURCE = kiconthemes-$(KF5_KICONTHEMES_VERSION).tar.xz
KF5_KICONTHEMES_LICENSE = LGPL-2.1
KF5_KICONTHEMES_LICENSE_FILES = COPYING.LIB

KF5_KICONTHEMES_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KICONTHEMES_INSTALL_STAGING = YES

KF5_KICONTHEMES_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KICONTHEMES_CXXFLAGS += -latomic
endif

KF5_KICONTHEMES_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KICONTHEMES_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KICONTHEMES_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
