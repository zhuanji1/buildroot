################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KDDOCKWIDGETS_VERSION = $(KF5_VERSION)
KF5_KDDOCKWIDGETS_SITE = https://github.com/KDAB/KDDockWidgets/releases/download/v1.3.1
KF5_KDDOCKWIDGETS_SOURCE = kddockwidgets-1.3.1.tar.gz
KF5_KDDOCKWIDGETS_LICENSE = LGPL-2.1
KF5_KDDOCKWIDGETS_LICENSE_FILES = COPYING.LIB

KF5_KDDOCKWIDGETS_DEPENDENCIES = kf5-extra-cmake-modules
KF5_KDDOCKWIDGETS_INSTALL_STAGING = YES

KF5_KDDOCKWIDGETS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KDDOCKWIDGETS_CXXFLAGS += -latomic
endif

KF5_KDDOCKWIDGETS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KDDOCKWIDGETS_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KDDOCKWIDGETS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
