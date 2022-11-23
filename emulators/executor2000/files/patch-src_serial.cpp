--- src/serial.cpp.orig	2021-04-03 08:15:08 UTC
+++ src/serial.cpp
@@ -10,15 +10,10 @@
 
 #include <base/common.h>
 
-#if defined(__APPLE__)
-// FIXME: #warning bad serial support right now
-//TODO: this seems to use sgtty functions instead of termios.
-#include <sgtty.h>
 #include <sys/errno.h>
 #include <sys/types.h>
 #include <sys/param.h>
 #include <stdio.h>
-#endif /* !defined (__APPLE__) */
 
 #include <Serial.h>
 #include <DeviceMgr.h>
@@ -80,7 +75,7 @@ using namespace Executor;
 #define SER_START (1)
 #define SER_STOP (0)
 
-
+#if 0
 static OSErr C_ROMlib_serialopen(ParmBlkPtr pbp, DCtlPtr dcp);
 REGISTER_FUNCTION_PTR(ROMlib_serialopen, D0(A0,A1));
 static OSErr C_ROMlib_serialprime(ParmBlkPtr pbp, DCtlPtr dcp);
@@ -91,6 +86,7 @@ static OSErr C_ROMlib_serialstatus(ParmBlkPtr pbp, DCt
 REGISTER_FUNCTION_PTR(ROMlib_serialstatus, D0(A0,A1));
 static OSErr C_ROMlib_serialclose(ParmBlkPtr pbp, DCtlPtr dcp);
 REGISTER_FUNCTION_PTR(ROMlib_serialclose, D0(A0,A1));
+#endif
 
 OSErr Executor::RAMSDOpen(SPortSel port) /* IMII-249 */
 {
@@ -180,7 +176,7 @@ OSErr Executor::SerStatus(INTEGER rn, SerStaRec *serst
         BlockMoveData((Ptr)status, (Ptr)serstap, (Size)sizeof(*serstap));
     return err;
 }
-
+#if 0
 #define OPENBIT (1 << 0)
 
 #if !defined(_WIN32)
@@ -1085,3 +1081,5 @@ void Executor::InitSerialDriver()
             &ROMlib_serialstatus, &ROMlib_serialclose, (StringPtr) "\05.BOut", -9,
         });
 }
+#endif
+void Executor::InitSerialDriver() {}
