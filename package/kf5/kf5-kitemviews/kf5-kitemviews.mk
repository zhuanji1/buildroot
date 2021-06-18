################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KITEMVIEWS_VERSION = $(KF5_VERSION)
KF5_KITEMVIEWS_SITE = $(KF5_SITE)
KF5_KITEMVIEWS_SOURCE = kitemviews-$(KF5_KITEMVIEWS_VERSION).tar.xz
KF5_KITEMVIEWS_LICENSE = LGPL-2.1
KF5_KITEMVIEWS_LICENSE_FILES = COPYING.LIB

KF5_KITEMVIEWS_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KITEMVIEWS_INSTALL_STAGING = YES

KF5_KITEMVIEWS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KITEMVIEWS_CXXFLAGS += -latomic
endif

KF5_KITEMVIEWS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KITEMVIEWS_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KITEMVIEWS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
