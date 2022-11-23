--- lmdb/libraries/liblmdb/mdb.c.orig	2021-04-03 08:10:29 UTC
+++ lmdb/libraries/liblmdb/mdb.c
@@ -177,13 +177,11 @@ typedef SSIZE_T	ssize_t;
 #elif defined(MDB_USE_SYSV_SEM)
 #include <sys/ipc.h>
 #include <sys/sem.h>
-#ifdef _SEM_SEMUN_UNDEFINED
 union semun {
 	int val;
 	struct semid_ds *buf;
 	unsigned short *array;
 };
-#endif /* _SEM_SEMUN_UNDEFINED */
 #else
 #define MDB_USE_POSIX_MUTEX	1
 #endif /* MDB_USE_POSIX_SEM */
