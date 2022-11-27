#!/bin/sh

set -e

build_package()
{
  PORT=$1
  ( cd "${PORT}" && make build-depends-list | cut -c 12- | xargs pkg install -y ) 
  make -C "${PORT}" package
}

mount -t unionfs $(readlink -f .) /usr/ports
HERE="${PWD}"
cd /usr/ports

# launch
pkg install -y kf5-kwindowsystem qt5-qmake # Workaround for packages that are missed by sysutils/hellodesktop-launch
build_package sysutils/hellodesktop-launch

# gmenudbusmenuproxy-standalone
build_package x11/gmenudbusmenuproxy-standalone

# Menu
build_package x11-wm/hellodesktop-menu

# Filer
build_package x11-fm/hellodesktop-filer

# Icons
build_package x11-themes/hellodesktop-icons

# BreezeEnhanced
build_package x11-themes/hellodesktop-breezeenhanced

# Fonts
build_package x11-fonts/hellodesktop-urwfonts-ttf

# QtPlugin
build_package sysutils/hellodesktop-qtplugin

# slim-lite
( cd x11/slim && make build-depends-list | cut -c 12- | xargs pkg install -y )
make -C x11/slim FLAVOR=lite package

# Utilities
# Try to prevent it from compiling python packages...
## pyver=$(cat /usr/ports/Mk/bsd.default-versions.mk | grep ^PYTHON_DEFAULT | cut -d "=" -f 2 | xargs | sed -e 's|\.||g')
#pyver=39 # our ports tree is outdated on Cirrus, hence specifying it by hand
#py=py$pyver
#pkg install -y $py-sqlite3 $py-dateutil $py-pyelftools $py-pytz $py-qt5-pyqt $py-xattr $py-xdg $py-xmltodict $py-psutil $py-beautifulsoup $py-qt5-webengine python$pyver
#( cd sysutils/hellodesktop-utilities && make build-depends-list | cut -c 12- | xargs pkg install -y )
build_package sysutils/hellodesktop-utilities

# helloDesktop meta port
build_package x11-wm/hellodesktop

# emulators/executor2000; not part of helloDesktop
# Fails to build due to conflicting files in ruby
# ( cd emulators/executor2000 && make build-depends-list | cut -c 12- | xargs pkg install -y )
build_package emulators/executor2000

cd "${HERE}"
umount /usr/ports

# FreeBSD repository
ABI=$(pkg config abi) # E.g., FreeBSD:13:amd64
mkdir -p "${ABI}"
find . -name '*.pkg' -exec mv {} "${ABI}/" \;
pkg repo "${ABI}/"
# index.html for the FreeBSD repository
cd "${ABI}/"
echo "<html><ul>" > index.html
find . -depth 1 -exec echo '<li><a href="{}" download>{}</a></li>' \; | sed -e 's|\./||g' >> index.html
echo "</ul></html>" >> index.html
cd -
