PORTNAME=	hellodesktop-qtplugin
DISTVERSION=    g20221109
CATEGORIES=	sysutils

MAINTAINER=	jsm@FreeBSD.org
COMMENT=	Qt platform plugin and style that exports global menus via D-Bus

LICENSE=	GPLv3+

LIB_DEPENDS=	libdbusmenu-qt5.so:devel/libdbusmenu-qt \
		libexif.so:graphics/libexif \
		libQt5XdgIconLoader.so:devel/libqtxdg

USES=		cmake compiler:c++14-lang kde:5 pkgconfig tar:xz qt:5 \
		gettext-runtime
USE_KDE=	ecm windowsystem
USE_QT=		buildtools core dbus gui qmake svg x11extras widgets

USE_GITHUB=     yes
GH_ACCOUNT=     helloSystem:DEFAULT helloSystem:sounds
GH_PROJECT=     QtPlugin:DEFAULT Sounds:sounds
GH_TAGNAME=     3360df3:DEFAULT 363e922:sounds
GH_SUBDIR=	sounds:sounds
USE_LDCONFIG=	yes

.include <bsd.port.mk>
