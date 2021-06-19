################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KWINDOWSYSTEM_VERSION = $(KF5_VERSION)
KF5_KWINDOWSYSTEM_SITE = $(KF5_SITE)
KF5_KWINDOWSYSTEM_SOURCE = kwindowsystem-$(KF5_KWINDOWSYSTEM_VERSION).tar.xz
KF5_KWINDOWSYSTEM_LICENSE = LGPL-2.1
KF5_KWINDOWSYSTEM_LICENSE_FILES = COPYING.LIB

KF5_KWINDOWSYSTEM_DEPENDENCIES = kf5-extra-cmake-modules qt5x11extras xlib_libXrender xlib_libXfixes
KF5_KWINDOWSYSTEM_INSTALL_STAGING = YES

KF5_KWINDOWSYSTEM_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KWINDOWSYSTEM_CXXFLAGS += -latomic
endif

KF5_KWINDOWSYSTEM_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KWINDOWSYSTEM_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KWINDOWSYSTEM_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
