PORTNAME=	hellodesktop-breezeenhanced
DISTVERSION=    g20221130
CATEGORIES=	x11-themes

MAINTAINER=	jsm@FreeBSD.org
COMMENT=	BreezeEnhanced is a fork of KDE Breeze decoration for helloDesktop
WWW=		https://github.com/helloSystem/BreezeEnhanced

LICENSE=	GPLv2

LIB_DEPENDS=	libfftw3_threads.so:math/fftw3

USES=		cmake compiler:c++11-lib gettext kde:5 pkgconfig qt:5 tar:xz \
		xorg

USE_GITHUB=     yes
GH_ACCOUNT=     helloSystem
GH_PROJECT=     BreezeEnhanced
GH_TAGNAME=     4f98560

USE_KDE=	codecs config configwidgets coreaddons \
		decoration ecm frameworkintegration guiaddons i18n iconthemes \
		kcmutils plasma-framework service wayland widgetsaddons \
		windowsystem
USE_QT=		core dbus declarative gui network widgets x11extras xml

USE_XORG=	x11 xcb

.include <bsd.port.mk>
