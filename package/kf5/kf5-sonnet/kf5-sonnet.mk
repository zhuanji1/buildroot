################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_SONNET_VERSION = $(KF5_VERSION)
KF5_SONNET_SITE = $(KF5_SITE)
KF5_SONNET_SOURCE = sonnet-$(KF5_SONNET_VERSION).tar.xz
KF5_SONNET_LICENSE = LGPL-2.1
KF5_SONNET_LICENSE_FILES = COPYING.LIB

KF5_SONNET_DEPENDENCIES = kf5-extra-cmake-modules
KF5_SONNET_INSTALL_STAGING = YES

KF5_SONNET_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_SONNET_CXXFLAGS += -latomic
endif

KF5_SONNET_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_SONNET_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_SONNET_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
