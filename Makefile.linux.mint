MAKE = aptitude install
BASE = /usr/
BIN = $(BASE)bin/
compilers = $(BIN)gfortran
repositories = $(BIN)svn
libraries = $(BASE)include/SDL2/SDL.h
edit = $(BIN)universalindentgui
math = $(BIN)xmaxima
debug = $(BIN)ddd
diff = $(BIN)meld
pdf = $(BIN)pdflatex
doxygen = $(BIN)doxygen
browser = $(BIN)firefox
mail = $(BIN)thunderbird
graphics = $(BASE)lib/gimp/2.0/plug-ins/ufraw-gimp
multimedia = $(BIN)vlc
office = $(BIN)loffice
spam = $(BIN)spamassassin
flash = $(BIN)gnash

all: \
	$(compilers) \
	$(repositories) \
	$(libraries) \
	$(edit) \
	$(math) \
	$(debug) \
	$(diff) \
	$(pdf) \
	$(doxygen) \
	$(browser) \
	$(mail) \
	$(graphics) \
	$(multimedia) \
	$(office) \
	$(spam) \
	$(flash)

$(compilers):
	$(MAKE) automake g++ gfortran

$(repositories):
	$(MAKE) git subversion

$(libraries):
	$(MAKE) libxml2-dev libglib2.0-dev libjson-glib-dev libsqlite3-dev \
		mpich libmpich-dev libgsl-dev libgtk-3-dev freeglut3-dev \
		fonts-freefont-ttf libglew-dev libglfw3-dev libsdl2-dev

$(edit):
	$(MAKE) nedit vim-gtk3 universalindentgui

$(math):
	$(MAKE) galculator gnuplot-x11 xmaxima

$(debug):
	$(MAKE) valgrind ddd

$(diff):
	$(MAKE) meld

$(pdf):
	$(MAKE) texlive-latex-recommended texlive-latex-extra texlive-publishers \
		texlive-fonts-recommended texlive-lang-spanish texlive-lang-french \
		texlive-lang-english texlive-lang-italian texlive-luatex evince

$(doxygen):
	$(MAKE) doxygen

$(browser):
	$(MAKE) wget firefox firefox-locale-es

$(mail):
	$(MAKE) thunderbird thunderbird-locale-es

$(graphics):
	$(MAKE) imagemagick gimp gimp-ufraw

$(multimedia):
	$(MAKE) vlc

$(office):
	$(MAKE) libreoffice

$(spam):
	$(MAKE) spamassassin

$(flash):
	$(MAKE) gnash

update:
	aptitude update

upgrade:
	aptitude upgrade

clean:
	aptitude clean
