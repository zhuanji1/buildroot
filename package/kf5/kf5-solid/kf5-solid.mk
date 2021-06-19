################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_SOLID_VERSION = $(KF5_VERSION)
KF5_SOLID_SITE = $(KF5_SITE)
KF5_SOLID_SOURCE = solid-$(KF5_SOLID_VERSION).tar.xz
KF5_SOLID_LICENSE = LGPL-2.1
KF5_SOLID_LICENSE_FILES = COPYING.LIB

KF5_SOLID_DEPENDENCIES = kf5-extra-cmake-modules eudev
KF5_SOLID_INSTALL_STAGING = YES

KF5_SOLID_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_SOLID_CXXFLAGS += -latomic
endif

KF5_SOLID_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_SOLID_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_SOLID_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
