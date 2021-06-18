################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KCODECS_VERSION = $(KF5_VERSION)
KF5_KCODECS_SITE = $(KF5_SITE)
KF5_KCODECS_SOURCE = kcodecs-$(KF5_KCODECS_VERSION).tar.xz
KF5_KCODECS_LICENSE = LGPL-2.1
KF5_KCODECS_LICENSE_FILES = COPYING.LIB

KF5_KCODECS_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KCODECS_INSTALL_STAGING = YES

KF5_KCODECS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KCODECS_CXXFLAGS += -latomic
endif

KF5_KCODECS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KCODECS_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KCODECS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
