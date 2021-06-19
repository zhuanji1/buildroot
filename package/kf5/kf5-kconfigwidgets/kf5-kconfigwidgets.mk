################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KCONFIGWIDGETS_VERSION = $(KF5_VERSION)
KF5_KCONFIGWIDGETS_SITE = $(KF5_SITE)
KF5_KCONFIGWIDGETS_SOURCE = kconfigwidgets-$(KF5_KCONFIGWIDGETS_VERSION).tar.xz
KF5_KCONFIGWIDGETS_LICENSE = LGPL-2.1
KF5_KCONFIGWIDGETS_LICENSE_FILES = COPYING.LIB

KF5_KCONFIGWIDGETS_DEPENDENCIES = kf5-extra-cmake-modules kf5-kguiaddons kf5-kwidgetsaddons kf5-ki18n
KF5_KCONFIGWIDGETS_INSTALL_STAGING = YES

KF5_KCONFIGWIDGETS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KCONFIGWIDGETS_CXXFLAGS += -latomic
endif

KF5_KCONFIGWIDGETS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KCONFIGWIDGETS_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KCONFIGWIDGETS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
