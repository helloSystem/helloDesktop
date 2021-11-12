--- xpcom/ds/StaticAtoms.py.orig	2021-11-02 00:08:17 UTC
+++ xpcom/ds/StaticAtoms.py
@@ -7,6 +7,7 @@
 from Atom import Atom, InheritingAnonBoxAtom, NonInheritingAnonBoxAtom
 from Atom import PseudoElementAtom
 from HTMLAtoms import HTML_PARSER_ATOMS
+from NativeMenuAtoms import NATIVE_MENU_ATOMS
 import sys
 
 # Static atom definitions, used to generate nsGkAtomList.h.
@@ -2509,7 +2510,7 @@ STATIC_ATOMS = [
     InheritingAnonBoxAtom("AnonBox_mozSVGForeignContent", ":-moz-svg-foreign-content"),
     InheritingAnonBoxAtom("AnonBox_mozSVGText", ":-moz-svg-text"),
     # END ATOMS
-] + HTML_PARSER_ATOMS
+] + HTML_PARSER_ATOMS + NATIVE_MENU_ATOMS
 # fmt: on
 
 
