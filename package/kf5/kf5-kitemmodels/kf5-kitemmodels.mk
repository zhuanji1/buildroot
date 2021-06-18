################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KITEMMODELS_VERSION = $(KF5_VERSION)
KF5_KITEMMODELS_SITE = $(KF5_SITE)
KF5_KITEMMODELS_SOURCE = kitemmodels-$(KF5_KITEMMODELS_VERSION).tar.xz
KF5_KITEMMODELS_LICENSE = LGPL-2.1
KF5_KITEMMODELS_LICENSE_FILES = COPYING.LIB

KF5_KITEMMODELS_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KITEMMODELS_INSTALL_STAGING = YES

KF5_KITEMMODELS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KITEMMODELS_CXXFLAGS += -latomic
endif

KF5_KITEMMODELS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KITEMMODELS_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KITEMMODELS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
