PORTNAME=	hellodesktop-utilities
DISTVERSION=	g20230226
CATEGORIES=	sysutils

MAINTAINER=     jsm@FreeBSD.org
COMMENT=        Utilities written in PyQt5, meant for use with helloDesktop
WWW=		https://github.com/helloSystem/Utilities

LICENSE=        BSD

# Python dependencies derived with
# grep -r py ISO/settings/packages.* | cut -d ":" -f 2-99 | grep -v "^#" | sort | uniq

RUN_DEPENDS=    sysutils/hellodesktop-launch>=g2022:sysutils/hellodesktop-launch \
		${PYTHON_PKGNAMEPREFIX}sqlite3>=0:databases/py-sqlite3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}dateutil>=0:devel/py-dateutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyelftools>=0:devel/py-pyelftools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytz>=0:devel/py-pytz@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}qt5-pyqt>=0:devel/py-qt5-pyqt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}xattr>=0:devel/py-xattr@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}xdg>=0:devel/py-xdg@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}xmltodict>=0:devel/py-xmltodict@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>=0:sysutils/py-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}beautifulsoup>=0:www/py-beautifulsoup@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}qt5-webengine>=0:www/py-qt5-webengine@${PY_FLAVOR}

USES=		python
PYTHON_NO_DEPENDS=	yes

NO_ARCH=        yes
NO_BUILD=       yes

USE_GITHUB=     yes
GH_ACCOUNT=     helloSystem
GH_PROJECT=     Utilities
GH_TAGNAME=	94986f2

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
	(cd ${STAGEDIR} && find . -type f > ${STAGEDIR}/../../pkg-plist)
	(cd ${STAGEDIR} && find . -type l -and -not -name '..' -and -not -name '.' >> ${STAGEDIR}/../../pkg-plist)
	sed -i '' -e 's|^\./|/|g' ${STAGEDIR}/../../pkg-plist
	(cd ${STAGEDIR} && find . -type d -and -not -name '..' -and -not -name '.' >> ${STAGEDIR}/../../pkg-plist)
	sed -i '' -e 's|^\./|@dir /|g' ${STAGEDIR}/../../pkg-plist

.include <bsd.port.mk>
