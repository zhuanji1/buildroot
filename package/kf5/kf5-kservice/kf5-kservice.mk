################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KSERVICE_VERSION = $(KF5_VERSION)
KF5_KSERVICE_SITE = $(KF5_SITE)
KF5_KSERVICE_SOURCE = kservice-$(KF5_KSERVICE_VERSION).tar.xz
KF5_KSERVICE_LICENSE = LGPL-2.1
KF5_KSERVICE_LICENSE_FILES = COPYING.LIB

KF5_KSERVICE_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KSERVICE_INSTALL_STAGING = YES

KF5_KSERVICE_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KSERVICE_CXXFLAGS += -latomic
endif

KF5_KSERVICE_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KSERVICE_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KSERVICE_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
