################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KWIDGETSADDONS_VERSION = $(KF5_VERSION)
KF5_KWIDGETSADDONS_SITE = $(KF5_SITE)
KF5_KWIDGETSADDONS_SOURCE = kwidgetsaddons-$(KF5_KWIDGETSADDONS_VERSION).tar.xz
KF5_KWIDGETSADDONS_LICENSE = LGPL-2.1
KF5_KWIDGETSADDONS_LICENSE_FILES = COPYING.LIB

KF5_KWIDGETSADDONS_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KWIDGETSADDONS_INSTALL_STAGING = YES

KF5_KWIDGETSADDONS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KWIDGETSADDONS_CXXFLAGS += -latomic
endif

KF5_KWIDGETSADDONS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KWIDGETSADDONS_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KWIDGETSADDONS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
