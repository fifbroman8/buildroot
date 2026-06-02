################################################################################
#
# kf5-kcoreaddons
#
################################################################################

KF6_KDDOCKWIDGETS_VERSION = $(KF6_VERSION)
KF6_KDDOCKWIDGETS_SITE = https://github.com/KDAB/KDDockWidgets/releases/download/v2.4.0
KF6_KDDOCKWIDGETS_SOURCE = kddockwidgets-2.4.0.tar.gz
KF6_KDDOCKWIDGETS_LICENSE = \
	LGPL-2.0+, LGPL-2.1 or LGPL-3.0 or LicenseRef-KDE-Accepted-LGPL (library), \
	MPL.1.1 or GPL-2.0+ or LGPL-2.1+ (posix_fallocate_mac.h), \
	LGPL-2.1 with Qt-LGPL-exception-1.1 or LicenseRef-Qt-Commercial (kprocesslist), \
	GPL-2.0 or GPL-3.0 or LicenseRef-KDE-Accepted-GPL (autotests)
KF6_KDDOCKWIDGETS_LICENSE_FILES = \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-2.0-or-later.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-2.0-only.txt \
	LICENSES/LGPL-2.0-or-later.txt \
	LICENSES/LGPL-2.1-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/LicenseRef-KDE-Accepted-GPL.txt \
	LICENSES/LicenseRef-KDE-Accepted-LGPL.txt \
	LICENSES/LicenseRef-Qt-Commercial.txt \
	LICENSES/MPL-1.1.txt \
	LICENSES/Qt-LGPL-exception-1.1.txt

KF6_KDDOCKWIDGETS_DEPENDENCIES = \
	kf6-extra-cmake-modules \
	qt6tools \
	$(if $(BR2_PACKAGE_PYTHON3),python3)
KF6_KDDOCKWIDGETS_INSTALL_STAGING = YES

KF6_KDDOCKWIDGETS_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
KF6_KDDOCKWIDGETS_CXXFLAGS += -latomic
endif

KF6_KDDOCKWIDGETS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF6_KDDOCKWIDGETS_CXXFLAGS)" -DBUILD_SHARED_LIBS=OFF -DKDDockWidgets_STATIC=ON

ifeq ($(BR2_microblaze),y)
# Microblaze ld emits warnings, make warnings not to be treated as errors
KF6_KDDOCKWIDGETS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
endif

$(eval $(cmake-package))
