################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KCOMPLETION_VERSION = $(KF5_VERSION)
KF5_KCOMPLETION_SITE = $(KF5_SITE)
KF5_KCOMPLETION_SOURCE = kcompletion-$(KF5_KCOMPLETION_VERSION).tar.xz
KF5_KCOMPLETION_LICENSE = LGPL-2.1
KF5_KCOMPLETION_LICENSE_FILES = COPYING.LIB

KF5_KCOMPLETION_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KCOMPLETION_INSTALL_STAGING = YES

KF5_KCOMPLETION_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KCOMPLETION_CXXFLAGS += -latomic
endif

KF5_KCOMPLETION_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KCOMPLETION_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KCOMPLETION_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
