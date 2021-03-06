################################################################################
#
# xlib_libXdmcp
#
################################################################################

XLIB_LIBXDMCP_VERSION = 1.1.3
XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXDMCP_LICENSE = MIT
XLIB_LIBXDMCP_LICENSE_FILES = COPYING
XLIB_LIBXDMCP_CPE_ID_VENDOR = x.org
XLIB_LIBXDMCP_CPE_ID_PRODUCT = libxdmcp
XLIB_LIBXDMCP_INSTALL_STAGING = YES
XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xorgproto host-pkgconf
HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xorgproto host-pkgconf

define XLIB_LIBXDMCP_POST_PATCH_FIXUP
       $(SED) 's%-lXdmcp%-lXdmcp -pthread%' $(STAGING_DIR)/usr/lib/pkgconfig/xdmcp.pc
endef

XLIB_LIBXDMCP_POST_INSTALL_STAGING_HOOKS += XLIB_LIBXDMCP_POST_PATCH_FIXUP

$(eval $(autotools-package))
$(eval $(host-autotools-package))
