PORTNAME=	hellodesktop-dock
PORTVERSION=	0.10
CATEGORIES=	x11-wm

MAINTAINER=     jsm@FreeBSD.org
COMMENT=        Dock of helloDesktop

LICENSE=	GPLv2

LIB_DEPENDS=	libfm.so:x11/libfm \
		libmenu-cache.so:x11/menu-cache

USES=		cmake compiler:c++14-lang gettext-runtime \
		localbase:ldflags pkgconfig \
		kde:5 qt:5

USE_GITHUB=     yes
GH_ACCOUNT=     helloSystem
GH_PROJECT=     Dock
GH_TAGNAME=	dad8a9a

USE_KDE=	windowsystem
USE_QT=		core dbus declarative gui linguisttools \
		network quickcontrols2 widgets x11extras

.include <bsd.port.mk>
