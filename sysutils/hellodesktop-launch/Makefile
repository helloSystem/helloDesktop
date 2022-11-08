PORTNAME=	hellodesktop-launch
PORTVERSION=	0.10
CATEGORIES=	sysutils

MAINTAINER=     jsm@FreeBSD.org
COMMENT=        Command line tools to launch applications and to open documents
WWW=		https://github.com/helloSystem/launch

LICENSE=	BSD

LIB_DEPENDS=

USES=		cmake compiler:c++14-lang gettext-runtime localbase:ldflags pkgconfig qt:5 \
		xorg

USE_GITHUB=     yes
GH_ACCOUNT=     helloSystem
GH_PROJECT=     launch
GH_TAGNAME=	0c6d95b

USE_KDE=	windowsystem
USE_QT=		buildtools core dbus gui linguisttools \
		sql widgets x11extras
USE_XORG=	x11 xcb

.include <bsd.port.mk>
