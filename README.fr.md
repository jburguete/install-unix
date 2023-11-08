install-unix
============

:gb:[english](README.md) :es:[español](README.es.md)
:fr:[français](README.fr.md)

Un script de perl pour instaler quelques applications utiles en différents
systèmes d'exploitation de type UNIX invités en QEMU/KVM ou en Virtualbox.

Liste d'outils
--------------

* Programmation:
  * C, C++ and FORTRAN compilers
  * Autoconf, Automake
  * Make  

* Contrôle de version:
  * Git
  * Subversion

* Bibliothèques de développement:
  * Libxml2
  * GLib
  * JSON-GLib
  * SQLite3
  * GSL
  * OpenMPI or MPICH
  * GTK+3
  * FreeGLUT
  * GLEW
  * GLFW
  * SDL2

* Système de fenêtres:
  * XFCE, Mate, GNOME, Cinnamon, Microsoft Windows ou Apple MacOS

* Éditeurs:
  * VIM
  * NEdit
  * UniversalIndentGUI

* Mathématiques:
  * Galculator
  * GNUPlot
  * Maxima

* Débogueurs:
  * DDD ou GDB
  * Valgrind

* Différences:
  * Meld

* Traitement de texte:
  * Latex
  * Evince

* Documentation:
  * Doxygen

* Navigateurs d'internet:
  * Firefox
  * Wget

* Courrier:
  * Thunderbird
  * Spamassassin

* Graphiques:
  * GIMP
  * ImageMagick

* Multimédia:
  * MPV, Parole ou Totem

* Office:
  * LibreOffice

Notez que tous les outils ne sont pas disponibles dans tous les systèmes
d'exploitation ou distributions.

Instructions de construction
----------------------------

Quand vous avez instalé le système d'exploitation de base, avec les outils
requis git et perl, on doit écrire comme root:

> \# perl generate.pl
>
> \# sh install.sh

En systèmes Microsoft Windows on peut suivre les instructions detaillées dans le
didacticiel fourni.

Systèmes de type UNIX pris en charge
------------------------------------

Actuellement, les suivants systèmes d'exploitation sont pris en charge:

* Arch Linux
* Debian Hurd 13
* Debian Linux 12 
* Devuan Linux 5
* Dragonfly BSD 6.4
* Fedora Linux 39
* FreeBSD 13.2
* Gentoo Linux
* Haiku
* Linux Mint DE 6
* MacOS Ventura + Homebrew
* Manjaro Linux
* Microsoft Windows 10 + MSYS2
* NetBSD 9.3
* OpenBSD 7.3
* OpenIndiana Hipster
* OpenSUSE Linux Leap 15.5
* Xubuntu Linux 23.04

D'autres versions de ces systèmes d'exploitation ou d'autres distributions
pourraient travailler mais on n'a pas été prouvé.
