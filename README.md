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
  * Meson

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

* Alpine Linux
* Arch Linux
* Bianbu Linux 2.1
* Debian Hurd 14
* Debian Linux 13 
* Devuan Linux 5
* Dragonfly BSD 6.4
* Fedora Linux 42
* FreeBSD 14.3
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

Other versions of these operative systems or other distributions could work but 
it has not been tested.
