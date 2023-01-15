PORTNAME=	hellodesktop-menu
DISTVERSION=	g20230115
CATEGORIES=	x11-wm

MAINTAINER=     jsm@FreeBSD.org
COMMENT=        Global application menu of helloDesktop
WWW=		https://github.com/helloSystem/Menu

LICENSE=	BSD

RUN_DEPENDS=    gmenudbusmenuproxy-standalone:x11/gmenudbusmenuproxy-standalone

LIB_DEPENDS=	libdbusmenu-qt5.so:devel/libdbusmenu-qt \
		libxcb-util.so:x11/xcb-util \
		libxcb-ewmh.so:x11/xcb-util-wm

USES=	cmake compiler:c++14-lang gettext-runtime kde:5 pkgconfig qt:5 xorg

USE_GITHUB=     yes
GH_ACCOUNT=     helloSystem
GH_PROJECT=     Menu
GH_TAGNAME=	9051f8e

USE_KDE= 	dbusaddons windowsystem baloo globalaccel
USE_QT=		buildtools core concurrent dbus declarative gui network qmake widgets x11extras
USE_XORG=	sm ice x11 xcb xcomposite xdamage xext xfixes xrender

.include <bsd.port.mk>
