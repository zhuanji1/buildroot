################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KPARTS_VERSION = $(KF5_VERSION)
KF5_KPARTS_SITE = $(KF5_SITE)
KF5_KPARTS_SOURCE = kparts-$(KF5_KPARTS_VERSION).tar.xz
KF5_KPARTS_LICENSE = LGPL-2.1
KF5_KPARTS_LICENSE_FILES = COPYING.LIB

KF5_KPARTS_DEPENDENCIES = kf5-extra-cmake-modules kf5-kcoreaddons
KF5_KPARTS_INSTALL_STAGING = YES

KF5_KPARTS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KPARTS_CXXFLAGS += -latomic
endif

KF5_KPARTS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KPARTS_CXXFLAGS)" -DKPARTS_HELPER_BACKEND_NAME="FAKE"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KPARTS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
