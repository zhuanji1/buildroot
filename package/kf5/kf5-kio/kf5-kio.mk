################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KIO_VERSION = $(KF5_VERSION)
KF5_KIO_SITE = $(KF5_SITE)
KF5_KIO_SOURCE = kio-$(KF5_KIO_VERSION).tar.xz
KF5_KIO_LICENSE = LGPL-2.1
KF5_KIO_LICENSE_FILES = COPYING.LIB

KF5_KIO_DEPENDENCIES = kf5-extra-cmake-modules kf5-solid kf5-kjobwidgets
KF5_KIO_INSTALL_STAGING = YES

KF5_KIO_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KIO_CXXFLAGS += -latomic
endif

KF5_KIO_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KIO_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KIO_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
