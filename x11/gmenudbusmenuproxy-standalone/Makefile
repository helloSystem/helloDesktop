PORTNAME=	gmenudbusmenuproxy-standalone
DISTVERSION=    5.22.5
CATEGORIES=	x11
MASTER_SITES=	KDE/${KDE_PLASMA_BRANCH}/plasma/5.22.5
DISTNAME=       plasma-workspace-5.22.5
DIST_SUBDIR=	KDE/plasma/5.22.5
WRKSRC_SUBDIR=  gmenu-dbusmenu-proxy

MAINTAINER=	jsm@FreeBSD.org
COMMENT=	D-bus global menu proxy for Gtk applications
WWW=		https://invent.kde.org/plasma/plasma-workspace/-/tree/master/gmenu-dbusmenu-proxy

LICENSE=	LGPL21+

LIB_DEPENDS=	libdbusmenu-qt5.so:devel/libdbusmenu-qt \
		libxkbcommon.so:x11/libxkbcommon \
		libappmenu-gtk2-parser.so:x11/gtk-app-menu

USES=		cmake compiler:c++14-lang gettext-runtime kde:5 qt:5 \
		localbase:ldflags pkgconfig tar:xz xorg
USE_QT=		core dbus gui x11extras widgets
USE_KDE=	config ecm windowsystem
USE_XORG=	xcb

post-extract:
	${CP} ${WRKSRC}/../config-X11.h.cmake ${WRKSRC}

.include <bsd.port.mk>
