################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF5_ELFUTILS_MINIMAL_VERSION = $(KF5_VERSION)
KF5_ELFUTILS_MINIMAL_SITE = https://github.com/colorfulcvn/elfutils/archive/refs/tags
KF5_ELFUTILS_MINIMAL_SOURCE = v1.0.tar.gz
KF5_ELFUTILS_MINIMAL_LICENSE = LGPL-2.1
KF5_ELFUTILS_MINIMAL_LICENSE_FILES = COPYING.LIB

#KF5_ELFUTILS_MINIMAL_DEPENDENCIES = kf5-extra-cmake-modules eudev
KF5_ELFUTILS_MINIMAL_INSTALL_STAGING = YES

KF5_ELFUTILS_MINIMAL_CXXFLAGS = $(TARGET_CXXFLAGS)

KF5_ELFUTILS_MINIMAL_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_ELFUTILS_MINIMAL_CXXFLAGS)"

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF5_ELFUTILS_MINIMAL_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
