install-unix
============

:gb:[english](README.md) :es:[español](README.es.md)
:fr:[français](README.fr.md)

A perl script to install some useful applications on different UNIX type
systems guest in QEMU/KVM or in Virtualbox.

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
  * XFCE, Mate, GNOME, Cinnamon, Microsoft Windows or Apple MacOS

* Editors:
  * VIM
  * NEdit
  * UniversalIndentGUI

* Mathematics:
  * Galculator
  * GNUPlot
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
  * MPV, Parole or Totem

* Office:
  * LibreOffice

Note that all the tools are not available in all operatif systems or
distributions.

Building instructions
---------------------

When you have installed the basic operative system, with the required tools git
and perl, you have to type as root:

> \# perl generate.pl
>
> \# sh install.sh

On Microsoft Windows systems you can follow detailed instructions on the
tutorial supplied.

Supported UNIX type systems
---------------------------

Currently the following UNIX type systems are supported:

* Arch Linux
* Debian 11 (Hurd or Linux) 
* Devuan Linux 4
* Dragonfly BSD 6.2
* Fedora Linux 37
* FreeBSD 13.1
* Gentoo Linux
* Haiku
* Linux Mint DE 5
* MacOS Catalina + Homebrew
* Manjaro Linux
* Microsoft Windows 10 + Cygwin
* Microsoft Windows 10 + MSYS2
* NetBSD 9.3
* OpenBSD 7.2
* OpenIndiana Hipster
* OpenSUSE Linux Leap 15.4
* Xubuntu Linux 22.04

Other versions of these operative systems or other distributions could work but 
it has not been tested.
