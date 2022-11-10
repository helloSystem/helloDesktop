#!/bin/sh

set -e

ABI=$(pkg config abi) # E.g., FreeBSD:13:amd64

mkdir -p "${ABI}"

# launch
pkg install -y curl wget zip pkgconf cmake qt5-qmake qt5-widgets qt5-buildtools qt5-sql kf5-kwindowsystem databases/qt5-sqldrivers-sqlite3
make -C sysutils/hellodesktop-launch package

# gmenudbusmenuproxy-standalone
( cd x11/gmenudbusmenuproxy-standalone && make build-depends-list | cut -c 12- | xargs pkg install -y ) 
make -C x11/gmenudbusmenuproxy-standalone package
ln -sf $(readlink -f ./x11/gmenudbusmenuproxy-standalone) /usr/ports/x11/

# Menu
pkg install -y curl wget zip pkgconf cmake qt5-x11extras qt5-quickcontrols qt5-qmake qt5-widgets qt5-buildtools qt5-concurrent kf5-kdbusaddons kf5-kwindowsystem kf5-baloo libdbusmenu-qt5 pulseaudio pulseaudio-qt libXcomposite
make -C x11-wm/hellodesktop-menu package
ln -sf $(readlink -f ./x11-wm/hellodesktop-menu) /usr/ports/x11-wm/

# Filer
pkg install -y git-lite curl wget zip cmake pkgconf libfm qt5-core qt5-x11extras qt5-widgets qt5-qmake qt5-buildtools qt5-linguisttools qt5-multimedia
make -C x11-fm/hellodesktop-filer package
ln -sf $(readlink -f ./x11-fm/hellodesktop-filer) /usr/ports/x11-fm/

# Icons
make -C x11-themes/hellodesktop-icons package
ln -sf $(readlink -f ./x11-themes/hellodesktop-icons) /usr/ports/sysutils/

# BreezeEnhanced
( cd x11-themes/hellodesktop-breezeenhanced && make build-depends-list | cut -c 12- | xargs pkg install -y ) 
make -C x11-themes/hellodesktop-breezeenhanced package
ln -sf $(readlink -f ./x11-themes/hellodesktop-breezeenhanced) /usr/ports/x11-themes/

# Fonts
( cd x11-fonts/hellodesktop-urwfonts-ttf && make build-depends-list | cut -c 12- | xargs pkg install -y )
make -C x11-fonts/hellodesktop-urwfonts-ttf package
ln -sf $(readlink -f ./x11-fonts/hellodesktop-urwfonts-ttf) /usr/ports/x11-fonts/

# QtPlugin
make -C sysutils/hellodesktop-qtplugin package
ln -sf $(readlink -f ./sysutils/hellodesktop-qtplugin) /usr/ports/sysutils/

# helloDesktop meta port
make -C x11-wm/hellodesktop package

# FreeBSD repository
find . -name '*.pkg' -exec mv {} "${ABI}/" \;
pkg repo "${ABI}/"
# index.html for the FreeBSD repository
cd "${ABI}/"
echo "<html>" > index.html
find . -depth 1 -exec echo "<a>{}</a>" \; | sed -e 's|\./||g' >> index.html
echo "</html>" >> index.html
cd -
