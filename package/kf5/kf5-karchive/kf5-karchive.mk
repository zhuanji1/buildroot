################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KARCHIVE_VERSION = $(KF5_VERSION)
KF5_KARCHIVE_SITE = $(KF5_SITE)
KF5_KARCHIVE_SOURCE = karchive-$(KF5_KARCHIVE_VERSION).tar.xz
KF5_KARCHIVE_LICENSE = LGPL-2.1
KF5_KARCHIVE_LICENSE_FILES = COPYING.LIB

KF5_KARCHIVE_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KARCHIVE_INSTALL_STAGING = YES

KF5_KARCHIVE_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KARCHIVE_CXXFLAGS += -latomic
endif

KF5_KARCHIVE_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KARCHIVE_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KARCHIVE_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
