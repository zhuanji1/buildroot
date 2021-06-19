################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KNOTIFICATIONS_VERSION = $(KF5_VERSION)
KF5_KNOTIFICATIONS_SITE = $(KF5_SITE)
KF5_KNOTIFICATIONS_SOURCE = knotifications-$(KF5_KNOTIFICATIONS_VERSION).tar.xz
KF5_KNOTIFICATIONS_LICENSE = LGPL-2.1
KF5_KNOTIFICATIONS_LICENSE_FILES = COPYING.LIB

KF5_KNOTIFICATIONS_DEPENDENCIES = kf5-extra-cmake-modules kf5-phonon
KF5_KNOTIFICATIONS_INSTALL_STAGING = YES

KF5_KNOTIFICATIONS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KNOTIFICATIONS_CXXFLAGS += -latomic
endif

KF5_KNOTIFICATIONS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KNOTIFICATIONS_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KNOTIFICATIONS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
