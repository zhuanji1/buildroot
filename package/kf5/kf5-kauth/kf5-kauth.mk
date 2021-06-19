################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KAUTH_VERSION = $(KF5_VERSION)
KF5_KAUTH_SITE = $(KF5_SITE)
KF5_KAUTH_SOURCE = kauth-$(KF5_KAUTH_VERSION).tar.xz
KF5_KAUTH_LICENSE = LGPL-2.1
KF5_KAUTH_LICENSE_FILES = COPYING.LIB

KF5_KAUTH_DEPENDENCIES = kf5-extra-cmake-modules kf5-kcoreaddons
KF5_KAUTH_INSTALL_STAGING = YES

KF5_KAUTH_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KAUTH_CXXFLAGS += -latomic
endif

KF5_KAUTH_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KAUTH_CXXFLAGS)" -DKAUTH_HELPER_BACKEND_NAME="FAKE"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KAUTH_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
