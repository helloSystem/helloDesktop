--- src/config/front-ends/qt/qt.cpp.orig	2021-02-15 21:56:39 UTC
+++ src/config/front-ends/qt/qt.cpp
@@ -194,7 +194,7 @@ bool QtVideoDriver::setMode(int width, int height, int
         macosx_hide_menu_bar(500, 0, 1000, 1000);
         QVector<QRect> screenGeometries = getScreenGeometries();
 #else
-        QVector<QRect> screenGeometries = getAvailableScreenGeometries();
+        QVector<QRect> screenGeometries = getScreenGeometries();
 #endif
 
         printf("set_mode: %d %d %d\n", width, height, bpp);
@@ -212,7 +212,7 @@ bool QtVideoDriver::setMode(int width, int height, int
         if(!window)
             window = new ExecutorWindow(this);
         window->setGeometry(geom);
-        window->showMaximized();
+        window->showFullScreen();
 
 #ifdef __APPLE__
         geom.setY(geom.y() - 1);
