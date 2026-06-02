################################################################################
#
# double-conversion
#
################################################################################

DOUBLE_CONVERSION_VERSION = 3.3.1
DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
DOUBLE_CONVERSION_LICENSE_FILES = COPYING
DOUBLE_CONVERSION_INSTALL_STAGING = YES
DOUBLE_CONVERSION_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
$(eval $(cmake-package))
$(eval $(host-cmake-package))
