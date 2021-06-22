################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_THREADWEAVER_VERSION = $(KF5_VERSION)
KF5_THREADWEAVER_SITE = $(KF5_SITE)
KF5_THREADWEAVER_SOURCE = threadweaver-$(KF5_THREADWEAVER_VERSION).tar.xz
KF5_THREADWEAVER_LICENSE = LGPL-2.1
KF5_THREADWEAVER_LICENSE_FILES = COPYING.LIB

KF5_THREADWEAVER_DEPENDENCIES = kf5-extra-cmake-modules
KF5_THREADWEAVER_INSTALL_STAGING = YES

KF5_THREADWEAVER_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_THREADWEAVER_CXXFLAGS += -latomic
endif

KF5_THREADWEAVER_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_THREADWEAVER_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_THREADWEAVER_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
