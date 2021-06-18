################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KJOBWIDGETS_VERSION = $(KF5_VERSION)
KF5_KJOBWIDGETS_SITE = $(KF5_SITE)
KF5_KJOBWIDGETS_SOURCE = kjobwidgets-$(KF5_KJOBWIDGETS_VERSION).tar.xz
KF5_KJOBWIDGETS_LICENSE = LGPL-2.1
KF5_KJOBWIDGETS_LICENSE_FILES = COPYING.LIB

KF5_KJOBWIDGETS_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KJOBWIDGETS_INSTALL_STAGING = YES

KF5_KJOBWIDGETS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KJOBWIDGETS_CXXFLAGS += -latomic
endif

KF5_KJOBWIDGETS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KJOBWIDGETS_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KJOBWIDGETS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
