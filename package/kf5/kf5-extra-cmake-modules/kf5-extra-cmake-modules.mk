################################################################################
#
# kf5-extra-cmake-modules
#
################################################################################

KF5_EXTRA_CMAKE_MODULES_VERSION = 5.83.0
KF5_EXTRA_CMAKE_MODULES_SITE =  https://download.kde.org/stable/frameworks/5.83
KF5_EXTRA_CMAKE_MODULES_SOURCE = extra-cmake-modules-$(KF5_EXTRA_CMAKE_MODULES_VERSION).tar.xz
KF5_EXTRA_CMAKE_MODULES_LICENSE = BSD-3-Clause
KF5_EXTRA_CMAKE_MODULES_LICENSE_FILES = COPYING-CMAKE-SCRIPTS

KF5_EXTRA_CMAKE_MODULES_DEPENDENCIES = host-pkgconf xlib_libXrender xlib_libXfixes qt5base qt5svg qt5script qt5declarative qt5x11extras qt5tools 
KF5_EXTRA_CMAKE_MODULES_INSTALL_STAGING = YES
KF5_EXTRA_CMAKE_MODULES_INSTALL_TARGET = NO

define KF5_EXTRA_CMAKE_MODULES_POST_PATCH_FIXUP
       sed -i "s|Plugins=|Plugins=$(STAGING_DIR)|" $(HOST_DIR)/bin/qt.conf
endef

KF5_EXTRA_CMAKE_MODULES_POST_INSTALL_STAGING_HOOKS += KF5_EXTRA_CMAKE_MODULES_POST_PATCH_FIXUP

$(eval $(cmake-package))
