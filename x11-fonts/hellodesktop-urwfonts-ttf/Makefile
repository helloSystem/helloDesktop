PORTNAME=	hellodesktop-urwfonts-ttf
PORTVERSION=	20200910
CATEGORIES=	x11-fonts

MAINTAINER=	jsm@FreeBSD.org
COMMENT=	URW base 35 font set

LICENSE=	AGPLv3

DISABLE_SIZE=	yes
USES=           fonts tar:bzip2

NO_ARCH=	yes
NO_BUILD=	yes

USE_GITHUB=     yes
GH_ACCOUNT=     ArtifexSoftware
GH_PROJECT=     urw-base35-fonts
GH_TAGNAME=     20200910

SUB_FILES=	pkg-message

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/fonts/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
