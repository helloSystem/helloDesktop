PORTNAME=	hellodesktop
PORTVERSION=	0.10.0
CATEGORIES=	x11-wm

MAINTAINER=	jsm@FreeBSD.org
COMMENT=	Meta-port for the helloDesktop
WWW=		https://github.com/helloSystem/hello

RUN_DEPENDS=	filer-qt:x11-fm/hellodesktop-filer \
	menubar:x11-wm/hellodesktop-menu \
	${PREFIX}/share/icons/elementary-xfce/index.theme:x11-themes/hellodesktop-icons \
	hellodesktop-qtplugin>=0.10.0:sysutils/hellodesktop-qtplugin \
	gmenudbusmenuproxy-standalone:x11/gmenudbusmenuproxy-standalone \
	launch:sysutils/hello-launch
USES=	metaport

.include <bsd.port.mk>
