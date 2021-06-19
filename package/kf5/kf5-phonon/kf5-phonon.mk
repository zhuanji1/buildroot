################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_PHONON_VERSION = $(KF5_VERSION)
KF5_PHONON_SITE = https://mirrors.ustc.edu.cn/kde/stable/phonon/4.11.1
KF5_PHONON_SOURCE = phonon-4.11.1.tar.xz
KF5_PHONON_LICENSE = LGPL-2.1
KF5_PHONON_LICENSE_FILES = COPYING.LIB

KF5_PHONON_DEPENDENCIES = kf5-extra-cmake-modules
KF5_PHONON_INSTALL_STAGING = YES

KF5_PHONON_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_PHONON_CXXFLAGS += -latomic
endif

KF5_PHONON_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_PHONON_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_PHONON_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
