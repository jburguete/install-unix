install-unix
============

:gb:[english](README.md) :es:[español](README.es.md)
:fr:[français](README.fr.md)

Un script de perl para instalar algunas aplicaciones útiles en diversos sistemas
de tipo UNIX invitados en QEMU/KVM o en Virtualbox.

Lista de utilidades
-------------------

* Programación:
  * Compiladores de C, C++ y FORTRAN
  * Autoconf, Automake
  * Make  

* Control de versiones:
  * Git
  * Subversion

* Bibliotecas de desarrollo:
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

* Entornos de ventanas:
  * XFCE, Mate, GNOME, Cinnamon, Microsoft Windows o Apple MacOS

* Editores:
  * VIM
  * NEdit
  * UniversalIndentGUI

* Matemáticas:
  * Galculator
  * GNUPlot
  * Maxima

* Depuradores:
  * DDD or GDB
  * Valgrind

* Diferencias:
  * Meld

* Procesamiento de textos:
  * Latex
  * Evince

* Documentación:
  * Doxygen

* Navegadores de internet:
  * Firefox
  * Wget

* Correo:
  * Thunderbird
  * Spamassassin

* Gráficos:
  * GIMP
  * ImageMagick

* Multimedia:
  * MPV, Parole or Totem

* Oficina:
  * LibreOffice

Note que no todas utilidades están disponibles en todos los sistemas operativos
o distribuciones.

Instrucciones de construcción
-----------------------------

Cuando tenga su sistema operativo básico instalado, con las utilidades 
requeridas git y perl, tiene que teclear como administrador:

> \# perl generate.pl
>
> \# sh install.sh

En sistemas Microsoft Windows puede seguir las instrucciones detalladas del
tutorial suministrado.

Sistemas de tipo UNIX soportados
--------------------------------

Actualmente están soportados los siguientes sistemas de tipo UNIX:

* Arch Linux
* Debian 12 (Hurd or Linux) 
* Devuan Linux 4
* Dragonfly BSD 6.2
* Fedora Linux 38
* FreeBSD 13.2
* Gentoo Linux
* Haiku
* Linux Mint DE 5
* MacOS Catalina + Homebrew
* Manjaro Linux
* Microsoft Windows 10 + MSYS2
* NetBSD 9.3
* OpenBSD 7.3
* OpenIndiana Hipster
* OpenSUSE Linux Leap 15.5
* Xubuntu Linux 23.04

Otras versiones de estos sistemas operativos u otras distribuciones podrían
funcionar pero no han sido probadas.
