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
  * Meson

* Contrôle de version:
  * Git
  * Subversion

* Bibliothèques de développement:
  * Libxml
  * GLib
  * JSON-GLib
  * SQLite
  * GSL
  * OpenMPI or MPICH
  * GTK
  * FreeGLUT
  * GLEW
  * GLFW
  * SDL

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

* Alpine Linux 3.23
* Arch Linux
* Bianbu Linux 3.0
* Debian Hurd 14
* Debian Linux 13 
* Devuan Linux 6
* Dragonfly BSD 6.4
* Fedora Linux 43
* FreeBSD 15.0
* Gentoo Linux
* Haiku
* Linux Mint DE 7
* MacOS Sequoia + Homebrew
* Manjaro Linux
* Microsoft Windows 11 + MSYS2
* NetBSD 10.1
* OpenBSD 7.8
* OpenIndiana Hipster
* OpenSUSE Linux Leap 16.0
* RedoxOS 0.9
* Xubuntu Linux 25.10

D'autres versions de ces systèmes d'exploitation ou d'autres distributions
pourraient travailler mais on n'a pas été prouvé.
