################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KTEXTWIDGETS_VERSION = $(KF5_VERSION)
KF5_KTEXTWIDGETS_SITE = $(KF5_SITE)
KF5_KTEXTWIDGETS_SOURCE = ktextwidgets-$(KF5_KTEXTWIDGETS_VERSION).tar.xz
KF5_KTEXTWIDGETS_LICENSE = LGPL-2.1
KF5_KTEXTWIDGETS_LICENSE_FILES = COPYING.LIB

KF5_KTEXTWIDGETS_DEPENDENCIES = kf5-extra-cmake-modules kf5-kcompletion kf5-kservice kf5-sonnet kf5-kguiaddons kf5-karchive kf5-kitemviews kf5-kdbusaddons
KF5_KTEXTWIDGETS_INSTALL_STAGING = YES

KF5_KTEXTWIDGETS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KTEXTWIDGETS_CXXFLAGS += -latomic
endif

KF5_KTEXTWIDGETS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KTEXTWIDGETS_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KTEXTWIDGETS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
