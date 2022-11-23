# $FreeBSD$

PORTNAME=	executor2000
DISTVERSION=	g20220409
CATEGORIES=	emulators

MAINTAINER=	probono@puredarwin.org
COMMENT=	Modern fork of the classic Mac emulator

LICENSE=	MIT

LIB_DEPENDS=	libreadline.so:devel/readline \
		libboost_filesystem.so:devel/boost-libs

BUILD_DEPENDS=	ruby:lang/ruby27

USES=		cmake bison qt:5 compiler:c++17-lang perl5

USE_QT+=	gui

USE_GITHUB=	yes
GH_TUPLE=	autc04:executor:cec5445 \
		autc04:syn68k:efdecf3:syn68k/syn68k \
		autc04:PowerCore:71e618e:PowerCore/PowerCore \
		autc04:cxmon:3592a52:cxmon/cxmon \
		google:googletest:b617b27:googletest/tests/googletest \
		LMDB:lmdb:22af328:lmdb/lmdb \
		autc04:lmdbxx:33f271a:lmdbxx/lmdbxx \
		vector-of-bool:cmrc:9a80e17:cmrc/cmrc \
		autc04:multiversal:c1e89af:multiversal/multiversal

PLIST_FILES=	bin/executor

DESKTOP_ENTRIES="Executor 2000" "${COMMENT}" \
		"computer" "executor" \
		"System;Emulator;" true

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/../.build/executor ${STAGEDIR}${PREFIX}/bin/

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/executor

.include <bsd.port.mk>
