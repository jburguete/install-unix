install-unix
============

A set of Makefiles to install some useful applications on different UNIX type
systems guest in QEMU/KVM.

Tools list
----------

* Programming:
  * C, C++ and FORTRAN compilers
  * Autoconf, Automake
  * Make  

* Control versions:
  * Git
  * Subversion

* Developing libraries:
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

* Windows system:
  * XFCE, Mate, GNOME or Microsoft Windows

* Editors:
  * VIM
  * NEdit
  * UniversalIndentGUI

* Mathematics:
  * Galculator
  * Maxima

* Debuggers:
  * DDD or GDB
  * Valgrind

* Differences:
  * Meld

* Text processing:
  * Latex
  * Evince

* Documentation:
  * Doxygen

* Internet browser:
  * Firefox
  * Wget

* Mail:
  * Thunderbird
  * Spamassassin

* Graphics:
  * GIMP
  * ImageMagick

* Multimedia:
  * Parole or Totem

* Office:
  * LibreOffice

* Flash viewer:
  * GNash

Building instructions
---------------------

When you have installed the basic operative system, with the required tools git
and make, you have only to type as root:

> make

On Microsoft Windows systems you can follow detailed instructions on the
tutorial supplied.

Supported UNIX type systems
---------------------------

Currently the following UNIX type systems are supported:

* Debian 9 (Hurd, kFreeBSD or Linux) 
* Devuan Linux 2
* DragonFlyBSD 5.2
* Dyson Illumos (2014/10/8)
* Fedora Linux 24
* FreeBSD 11.0
* Manjaro Linux
* Microsoft Windows 7 32 bits + Cygwin
* Microsoft Windows 7 32 bits + MSYS2
* Microsoft Windows 7 64 bits + Cygwin
* Microsoft Windows 7 64 bits + MSYS2
* Microsoft Windows 10 32 bits + Cygwin
* Microsoft Windows 10 32 bits + MSYS2
* Microsoft Windows 10 64 bits + Cygwin
* Microsoft Windows 10 64 bits + MSYS2
* NetBSD 7.0
* OpenBSD 6.1
* OpenIndiana Hipster
* OpenSUSE Linux Tumbleweed XFCE
* Xubuntu Linux 18.04

Other versions of these operative systems can work but it has not been tested.
