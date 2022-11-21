#!/bin/sh

set -e

ABI=$(pkg config abi) # E.g., FreeBSD:13:amd64

mkdir -p "${ABI}"

# launch
( cd sysutils/hellodesktop-launch && make build-depends-list | cut -c 12- | xargs pkg install -y ) 
pkg install -y kf5-kwindowsystem qt5-qmake # Workaround for packages that are missed by the next line
make -C sysutils/hellodesktop-launch package
ln -sf $(readlink -f ./sysutils/hellodesktop-launch) /usr/ports/sysutils/

# gmenudbusmenuproxy-standalone
( cd x11/gmenudbusmenuproxy-standalone && make build-depends-list | cut -c 12- | xargs pkg install -y ) 
make -C x11/gmenudbusmenuproxy-standalone package
ln -sf $(readlink -f ./x11/gmenudbusmenuproxy-standalone) /usr/ports/x11/

# Menu
( cd x11-wm/hellodesktop-menu && make build-depends-list | cut -c 12- | xargs pkg install -y ) 
make -C x11-wm/hellodesktop-menu package
ln -sf $(readlink -f ./x11-wm/hellodesktop-menu) /usr/ports/x11-wm/

# Filer
( cd x11-fm/hellodesktop-filer && make build-depends-list | cut -c 12- | xargs pkg install -y ) 
make -C x11-fm/hellodesktop-filer package
ln -sf $(readlink -f ./x11-fm/hellodesktop-filer) /usr/ports/x11-fm/

# Icons
make -C x11-themes/hellodesktop-icons package
ln -sf $(readlink -f ./x11-themes/hellodesktop-icons) /usr/ports/x11-themes

# BreezeEnhanced
( cd x11-themes/hellodesktop-breezeenhanced && make build-depends-list | cut -c 12- | xargs pkg install -y ) 
make -C x11-themes/hellodesktop-breezeenhanced package
ln -sf $(readlink -f ./x11-themes/hellodesktop-breezeenhanced) /usr/ports/x11-themes/

# Fonts
( cd x11-fonts/hellodesktop-urwfonts-ttf && make build-depends-list | cut -c 12- | xargs pkg install -y )
make -C x11-fonts/hellodesktop-urwfonts-ttf package
ln -sf $(readlink -f ./x11-fonts/hellodesktop-urwfonts-ttf) /usr/ports/x11-fonts/

# QtPlugin
( cd sysutils/hellodesktop-qtplugin && make build-depends-list | cut -c 12- | xargs pkg install -y )
make -C sysutils/hellodesktop-qtplugin package
ln -sf $(readlink -f ./sysutils/hellodesktop-qtplugin) /usr/ports/sysutils/

# Utilities
# Try to prevent it from compiling python packages...
## pyver=$(cat /usr/ports/Mk/bsd.default-versions.mk | grep ^PYTHON_DEFAULT | cut -d "=" -f 2 | xargs | sed -e 's|\.||g')
#pyver=39 # our ports tree is outdated on Cirrus, hence specifying it by hand
#py=py$pyver
#pkg install -y $py-sqlite3 $py-dateutil $py-pyelftools $py-pytz $py-qt5-pyqt $py-xattr $py-xdg $py-xmltodict $py-psutil $py-beautifulsoup $py-qt5-webengine python$pyver
#( cd sysutils/hellodesktop-utilities && make build-depends-list | cut -c 12- | xargs pkg install -y )
#make -C sysutils/hellodesktop-utilities package
#ln -sf $(readlink -f ./sysutils/hellodesktop-utilities) /usr/ports/sysutils/

# helloDesktop meta port
make -C x11-wm/hellodesktop package

# FreeBSD repository
find . -name '*.pkg' -exec mv {} "${ABI}/" \;
pkg repo "${ABI}/"
# index.html for the FreeBSD repository
cd "${ABI}/"
echo "<html><ul>" > index.html
find . -depth 1 -exec echo '<li><a href="{}" download>{}</a></li>' \; | sed -e 's|\./||g' >> index.html
echo "</ul></html>" >> index.html
cd -
