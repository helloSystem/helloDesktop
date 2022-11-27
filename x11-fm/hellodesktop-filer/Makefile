PORTNAME=	hellodesktop-filer
DISTVERSION=	g20221127
CATEGORIES=	x11-fm

MAINTAINER=     jsm@FreeBSD.org
COMMENT=        File manager that also renders the desktop

LICENSE=	GPLv2

LIB_DEPENDS=	libmenu-cache.so:x11/menu-cache \
		libfm.so:x11/libfm \
		libexif.so:graphics/libexif
RUN_DEPENDS=    sysutils/hellodesktop-launch>=g2022:sysutils/hellodesktop-launch

USES=		cmake compiler:c++14-lang desktop-file-utils gnome\
		gettext-runtime localbase:ldflags pkgconfig kde:5 qt:5 \
		xorg

USE_GITHUB=     yes
GH_ACCOUNT=     helloSystem
GH_PROJECT=     Filer
GH_TAGNAME=	4f03ce0

USE_QT=		core dbus gui linguisttools multimedia network\
		widgets x11extras
USE_GNOME=	glib20
USE_XORG=	x11
USE_XORG=	xcb

.include <bsd.port.mk>
