################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KGUIADDONS_VERSION = $(KF5_VERSION)
KF5_KGUIADDONS_SITE = $(KF5_SITE)
KF5_KGUIADDONS_SOURCE = kguiaddons-$(KF5_KGUIADDONS_VERSION).tar.xz
KF5_KGUIADDONS_LICENSE = LGPL-2.1
KF5_KGUIADDONS_LICENSE_FILES = COPYING.LIB

KF5_KGUIADDONS_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KGUIADDONS_INSTALL_STAGING = YES

KF5_KGUIADDONS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KGUIADDONS_CXXFLAGS += -latomic
endif

KF5_KGUIADDONS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KGUIADDONS_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KGUIADDONS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
