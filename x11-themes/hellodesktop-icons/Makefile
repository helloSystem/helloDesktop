PORTNAME=	hellodesktop-icons
PORTVERSION=	0.10
CATEGORIES=	x11-themes
MASTER_SITES=   https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/xubuntu-artwork/16.04.2/
DISTNAME=       xubuntu-artwork_16.04.2

MAINTAINER=	jsm@FreeBSD.org
COMMENT=	Icon theme for helloDesktop
WWW=		https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/xubuntu-artwork/16.04.2/

LICENSE=        GPLv2+ GPLv3+ CC-BY-SA-3.0
LICENSE_COMB=   multi

USES=           tar:xz
NO_ARCH=        yes
NO_BUILD=       yes
NO_WRKSUBDIR=   yes

post-extract:
	${MKDIR} ${STAGEDIR}${LOCALBASE}/share/icons
	${CP} -r ${WRKSRC}/trunk/usr/share/icons/elementary-xfce ${STAGEDIR}${LOCALBASE}/share/icons

do-install:

.include <bsd.port.mk>
