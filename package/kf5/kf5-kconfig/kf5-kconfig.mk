################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KCONFIG_VERSION = $(KF5_VERSION)
KF5_KCONFIG_SITE = $(KF5_SITE)
KF5_KCONFIG_SOURCE = kconfig-$(KF5_KCONFIG_VERSION).tar.xz
KF5_KCONFIG_LICENSE = LGPL-2.1
KF5_KCONFIG_LICENSE_FILES = COPYING.LIB

KF5_KCONFIG_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KCONFIG_INSTALL_STAGING = YES

KF5_KCONFIG_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KCONFIG_CXXFLAGS += -latomic
endif

KF5_KCONFIG_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KCONFIG_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KCONFIG_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
