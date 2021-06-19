################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KCRASH_VERSION = $(KF5_VERSION)
KF5_KCRASH_SITE = $(KF5_SITE)
KF5_KCRASH_SOURCE = kcrash-$(KF5_KCRASH_VERSION).tar.xz
KF5_KCRASH_LICENSE = LGPL-2.1
KF5_KCRASH_LICENSE_FILES = COPYING.LIB

KF5_KCRASH_DEPENDENCIES = kf5-extra-cmake-modules kf5-kwindowsystem
KF5_KCRASH_INSTALL_STAGING = YES

KF5_KCRASH_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KCRASH_CXXFLAGS += -latomic
endif

KF5_KCRASH_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KCRASH_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KCRASH_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
