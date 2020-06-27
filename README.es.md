install-unix
============

:gb:[english](README.md) :es:[español](README.es.md)

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
  * XFCE, Mate, GNOME or Microsoft Windows

* Editores:
  * VIM
  * NEdit
  * UniversalIndentGUI

* Matemáticas:
  * Galculator
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
* Debian 10 (Hurd, kFreeBSD or Linux) 
* Devuan Linux 3
* Dragonfly BSD 5.8
* Dyson Illumos (2019/11/5)
* Fedora Linux 32
* FreeBSD 12.1
* Linux Mint DE 3
* MacOS Catalina + Homebrew
* Manjaro Linux
* Microsoft Windows 10 + Cygwin
* Microsoft Windows 10 + MSYS2
* NetBSD 9.0
* OpenBSD 6.7
* OpenIndiana Hipster
* OpenSUSE Linux Leap
* Xubuntu Linux 20.04

Otras versiones de estos sistemas operativos u otras distribuciones podrían
funcionar pero no han sido probadas.
