################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KI18N_VERSION = $(KF5_VERSION)
KF5_KI18N_SITE = $(KF5_SITE)
KF5_KI18N_SOURCE = ki18n-$(KF5_KI18N_VERSION).tar.xz
KF5_KI18N_LICENSE = LGPL-2.1
KF5_KI18N_LICENSE_FILES = COPYING.LIB

KF5_KI18N_DEPENDENCIES = kf5-extra-cmake-modules qt5script 
KF5_KI18N_INSTALL_STAGING = YES

KF5_KI18N_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KI18N_CXXFLAGS += -latomic
endif

KF5_KI18N_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KI18N_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KI18N_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
