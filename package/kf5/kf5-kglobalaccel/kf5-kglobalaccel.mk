################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_KGLOBALACCEL_VERSION = $(KF5_VERSION)
KF5_KGLOBALACCEL_SITE = $(KF5_SITE)
KF5_KGLOBALACCEL_SOURCE = kglobalaccel-$(KF5_KGLOBALACCEL_VERSION).tar.xz
KF5_KGLOBALACCEL_LICENSE = LGPL-2.1
KF5_KGLOBALACCEL_LICENSE_FILES = COPYING.LIB

KF5_KGLOBALACCEL_DEPENDENCIES = kf5-extra-cmake-modules kf5-kcrash kf5-kdbusaddons
KF5_KGLOBALACCEL_INSTALL_STAGING = YES

KF5_KGLOBALACCEL_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF5_KGLOBALACCEL_CXXFLAGS += -latomic
endif

KF5_KGLOBALACCEL_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KGLOBALACCEL_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_KGLOBALACCEL_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
