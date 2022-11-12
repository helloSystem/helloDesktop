PORTNAME=	hellodesktop-utilities
PORTVERSION=	g20221112
CATEGORIES=	sysutils

MAINTAINER=     jsm@FreeBSD.org
COMMENT=        Utilities written in PyQt5, meant for use with helloDesktop
WWW=		https://github.com/helloSystem/Utilities

LICENSE=        BSD

# Python dependencies derived with
# grep -r py ISO/settings/packages.* | cut -d ":" -f 2-99 | grep -v "^#" | sort | uniq

RUN_DEPENDS=    sysutils/hellodesktop-launch>=0:sysutils/hellodesktop-launch \
		databases/py-sqlite3>=0:databases/py-sqlite3 \
		devel/py-dateutil>=0:devel/py-dateutil \
		devel/py-pip>=0:devel/py-pip \
		devel/py-pyelftools>=0:devel/py-pyelftools \
		devel/py-pytz>=0:devel/py-pytz \
		devel/py-qt5-pyqt>=0:devel/py-qt5-pyqt \
		devel/py-xattr>=0:devel/py-xattr \
		devel/py-xdg>=0:devel/py-xdg \
		devel/py-xmltodict>=0:devel/py-xmltodict \
		sysutils/py-psutil>=0:sysutils/py-psutil \
		www/py-beautifulsoup>=0:www/py-beautifulsoup \
		www/py-qt5-webengine>=0:www/py-qt5-webengine

NO_ARCH=        yes
NO_BUILD=       yes

USE_GITHUB=     yes
GH_ACCOUNT=     helloSystem
GH_PROJECT=     Utilities
GH_TAGNAME=	e071492

# FIXME: Find a cleaner way to do this, but without having to change
# the packaging each time a new application or directory is added
# or removed by the upstream project
do-install:
	rm -rf ${STAGEDIR}
	${MKDIR} ${STAGEDIR}/Applications
	(cd ${WRKSRC} && cp -R ./ ${STAGEDIR}/Applications)
	(cd ${STAGEDIR}/Applications && rm LICENSE && rm README.md && rm -rf i18n)
	(cd ${STAGEDIR}/Applications && mv System ..)
	(cd ${STAGEDIR}/Applications && mv Root/* ./Utilities/ && rm -r Root)
	(cd ${STAGEDIR} && find . -type f -name '.git*' -delete)
	(cd ${STAGEDIR} && find . -type f -or -type l > ${STAGEDIR}/../../pkg-plist)
	sed -i '' -e 's|^\./|/|g' ${STAGEDIR}/../../pkg-plist
	(cd ${STAGEDIR} && find . -type d >> ${STAGEDIR}/../../pkg-plist)
	sed -i '' -e 's|^\./|@dir /|g' ${STAGEDIR}/../../pkg-plist

.include <bsd.port.mk>
