PORTNAME=	hellodesktop-launch
DISTVERSION=	g20230311
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
GH_TAGNAME=	0a19bc4

USE_KDE=	windowsystem
USE_QT=		buildtools core dbus gui linguisttools \
		widgets x11extras
USE_XORG=	x11 xcb

.include <bsd.port.mk>
