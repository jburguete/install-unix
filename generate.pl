#!/usr/bin/env perl

#Supported systems
#Arch Linux
#Debian Hurd and Linux
#Devuan Linux
#Dragonfly BSD
#Dyson
#Fedora Linux
#FreeBSD
#Gentoo Linux
#Linux Mint
#MacOS Catalina + Homebrew
#Manjaro Linux
#Microsoft Windows + CYGWIN
#Microsoft Windows + MSYS2
#NetBSD
#OpenBSD
#OpenIndiana
#Xubuntu Linux

use File::Copy 'move';
$os=`uname -s`;
$os=~ s/\n//g;
if ($os eq "Linux")
{
	if (!(-x "/usr/bin/lsb_release"))
	{
		if (-x "/usr/bin/apt")
		{
			system("apt install lsb-release");
		}
		elsif (-x "/usr/bin/pacman")
		{
			system("pacman -S lsb-release");
		}
		elsif (-x "/usr/bin/dnf")
		{
			system("dnf install redhat-lsb-core");
		}
		elsif (-x "/usr/bin/zypper")
		{
			system("zypper install lsb-release");
		}
		elsif (-x "/usr/bin/emerge")
		{
			system("emerge --ask sys-apps/lsb-release");
		}
	}
	$dist=`lsb_release -i -s`;
	$dist=~ s/\n//g;
	print "OS=" . $os . " Dist=" . $dist . "\n";
	if ($dist eq "Debian" || $dist eq "Devuan")
	{
		system("apt","install","aptitude")
			if (!(-x "/usr/bin/aptitude"));
		@install=("aptitude","install");
		@clean=("aptitude","clean");
		@update=("aptitude","update");
		@upgrade=("aptitude","upgrade");
		@packages=(
			"patch",
			"autoconf",
			"automake",
			"pkg-config",
			"g++",
			"gfortran",
			"make",
			"git",
			"subversion",
			"libxml2-dev",
			"libglib2.0-dev",
			"libjson-glib-dev",
			"gettext",
			"libsqlite3-dev",
			"libgsl-dev",
			"libgtop2-dev",
			"libgtk-3-dev",
			"freeglut3-dev",
			"libglfw3-dev",
			"libsdl2-dev",
			"fonts-freefont-otf",
			"libglew-dev",
			"glslang-tools",
			"mpich",
			"libmpich-dev",
			"xserver-xorg-input-kbd",
			"xserver-xorg-input-mouse",
			"xserver-xorg-input-evdev",
			"xserver-xorg-video-vesa",
			"xorg",
			"xfce4",
			"lightdm",
			"xscreensaver",
			"xfce4-cpugraph-plugin",
			"xfce4-netload-plugin",
			"xfce4-systemload-plugin",
			"xfce4-weather-plugin",
			"xfce4-xkb-plugin",
			"xfce4-terminal",
			"orage",
			"gstreamer1.0-plugins-good",
			"gstreamer1.0-pulseaudio",
			"xfce4-pulseaudio-plugin",
			"xfce4-screenshooter",
			"nedit",
			"vim-gtk3",
			"indent",
			"universalindentgui",
			"galculator",
			"xmaxima",
			"valgrind",
			"valgrind-mpi",
			"ddd",
			"meld",
			"texlive-latex-extra",
			"texlive-luatex",
			"texlive-publishers",
			"texlive-fonts-recommended",
			"texlive-lang-spanish",
			"texlive-lang-french",
			"texlive-lang-english",
			"texlive-lang-italian",
			"texlive-pstricks",
			"graphviz",
			"evince",
			"doxygen",
			"wget",
			"firefox-esr",
			"firefox-esr-l10n-es-es",
			"webext-ublock-origin",
			"thunderbird",
			"thunderbird-l10n-es-es",
			"imagemagick",
			"gimp",
			"gimp-ufraw",
			"mpv",
			"gnumeric",
			"libreoffice",
			"libreoffice-l10n-es",
			"spamassassin");
		system(@install,"virt-what") if (!(-x "/usr/sbin/virt-what"));
		$mach=`virt-what`;
		$mach=~ s/\n//g;
		print "Mach=" . $mach. "\n";
		if ($mach eq "virtualbox")
		{
			push @packages,"virtualbox-guest-x11";
		}
		elsif ($mach eq "kvm")
		{
			push @packages,"qemu-guest-agent";
			push @packages,"xserver-xorg-video-qxl";
		}
	}
	elsif ($dist eq "Linuxmint")
	{
		system("apt","install","aptitude")
			if (!(-x "/usr/bin/aptitude"));
		@install=("aptitude","install");
		@clean=("aptitude","clean");
		@update=("aptitude","update");
		@upgrade=("aptitude","upgrade");
		@packages=(
			"patch",
			"autoconf",
			"automake",
			"pkg-config",
			"g++",
			"gfortran",
			"make",
			"git",
			"subversion",
			"libxml2-dev",
			"libglib2.0-dev",
			"libjson-glib-dev",
			"gettext",
			"libsqlite3-dev",
			"libgsl-dev",
			"libgtop2-dev",
			"libgtk-3-dev",
			"freeglut3-dev",
			"libglfw3-dev",
			"libsdl2-dev",
			"fonts-freefont-otf",
			"libglew-dev",
			"glslang-tools",
			"mpich",
			"libmpich-dev",
			"vim-gtk3",
			"indent",
			"universalindentgui",
			"galculator",
			"xmaxima",
			"valgrind",
			"valgrind-mpi",
			"ddd",
			"meld",
			"texlive-latex-extra",
			"texlive-luatex",
			"texlive-publishers",
			"texlive-fonts-recommended",
			"texlive-lang-spanish",
			"texlive-lang-french",
			"texlive-lang-english",
			"texlive-lang-italian",
			"texlive-pstricks",
			"graphviz",
			"evince",
			"doxygen",
			"wget",
			"firefox-esr",
			"firefox-esr-l10n-es-es",
			"webext-ublock-origin",
			"thunderbird",
			"thunderbird-l10n-es-es",
			"imagemagick",
			"gimp",
			"gimp-ufraw",
			"mpv",
			"gnumeric",
			"libreoffice",
			"libreoffice-l10n-es",
			"spamassassin");
		system(@install,"virt-what") if (!(-x "/usr/sbin/virt-what"));
		$mach=`virt-what`;
		$mach=~ s/\n//g;
		print "Mach=" . $mach. "\n";
		if ($mach eq "virtualbox")
		{
			push @packages,"virtualbox-guest-x11";
		}
		elsif ($mach eq "kvm")
		{
			push @packages,"qemu-guest-agent";
			push @packages,"xserver-xorg-video-qxl";
		}
	}
	elsif ($dist eq "Ubuntu")
	{
		system("sudo","apt","install","aptitude")
			if (!(-x "/usr/bin/aptitude"));
		@install=("aptitude","install");
		@clean=("aptitude","clean");
		@update=("aptitude","update");
		@upgrade=("aptitude","upgrade");
		@packages=(
			"patch",
			"autoconf",
			"automake",
			"pkg-config",
			"g++",
			"gfortran",
			"make",
			"git",
			"subversion",
			"libxml2-dev",
			"libglib2.0-dev",
			"libjson-glib-dev",
			"gettext",
			"libsqlite3-dev",
			"libgsl-dev",
			"libgtop2-dev",
			"libgtk-3-dev",
			"freeglut3-dev",
			"libglfw3-dev",
			"libsdl2-dev",
			"fonts-freefont-otf",
			"libglew-dev",
			"glslang-tools",
			"mpich",
			"libmpich-dev",
			"nedit",
			"vim-gtk3",
			"indent",
			"galculator",
			"xmaxima",
			"valgrind",
			"valgrind-mpi",
			"ddd",
			"meld",
			"texlive-latex-extra",
			"texlive-luatex",
			"texlive-publishers",
			"texlive-fonts-recommended",
			"texlive-lang-spanish",
			"texlive-lang-french",
			"texlive-lang-english",
			"texlive-lang-italian",
			"texlive-pstricks",
			"graphviz",
			"evince",
			"doxygen",
			"wget",
			"firefox",
			"firefox-locale-es",
			"webext-ublock-origin",
			"thunderbird",
			"thunderbird-locale-es",
			"imagemagick",
			"gimp",
			"gimp-dcraw",
			"mpv",
			"gnumeric",
			"libreoffice",
			"spamassassin");
		system(@install,"virt-what") if (!(-x "/usr/sbin/virt-what"));
		$mach=`virt-what`;
		$mach=~ s/\n//g;
		print "Mach=" . $mach. "\n";
		if ($mach eq "virtualbox")
		{
			push @packages,"virtualbox-guest-x11";
		}
		elsif ($mach eq "kvm")
		{
			push @packages,"qemu-guest-agent";
			push @packages,"xserver-xorg-video-qxl";
		}
	}
	elsif ($dist eq "ManjaroLinux")
	{
		@install=("pacman","-S");
		@clean=("pacman","-Sc");
		@update=("pacman","-Syu");
		@packages=(
			"patch",
			"autoconf",
			"automake",
			"pkgconf",
			"gcc",
			"gcc-fortran",
			"make",
			"git",
			"subversion",
			"libxml2",
			"glib2",
			"json-glib",
			"sqlite",
			"gsl",
			"libgtop",
			"gtk3",
			"gtk4",
			"freeglut",
			"glfw-x11",
			"sdl2",
			"gnu-free-fonts",
			"glew",
			"vulkan-headers",
			"openmpi",
			"xfce4-screensaver",
			"xfce4-cpugraph-plugin",
			"xfce4-netload-plugin",
			"xfce4-systemload-plugin",
			"xfce4-weather-plugin",
			"xfce4-xkb-plugin",
			"xfce4-pulseaudio-plugin",
			"nedit",
			"gvim",
			"indent",
			"galculator",
			"maxima",
			"valgrind",
			"gdb",
			"meld",
			"texlive-core",
			"texlive-latexextra",
			"texlive-publishers",
			"texlive-pstricks",
			"graphviz",
			"evince",
			"doxygen",
			"wget",
			"firefox",
			"firefox-i18n-es-es",
			"firefox-ublock-origin",
			"thunderbird",
			"thunderbird-i18n-es-es",
			"imagemagick",
			"gimp",
			"dcraw",
			"mpv",
			"libreoffice-still",
			"libreoffice-still-es",
			"spamassassin");
	}
	elsif ($dist eq "Arch")
	{
		@install=("pacman","-S");
		@clean=("pacman","-Rs","\$(pacman","-Qdtq);","pacman","-Sc");
		@update=("pacman","-Syu");
		@packages=(
			"patch",
			"autoconf",
			"automake",
			"pkgconf",
			"gcc",
			"gcc-fortran",
			"make",
			"git",
			"subversion",
			"libxml2",
			"glib2",
			"json-glib",
			"sqlite",
			"gsl",
			"libgtop",
			"gtk3",
			"gtk4",
			"freeglut",
			"glfw-x11",
			"sdl2",
			"gnu-free-fonts",
			"glew",
			"openmpi",
			"xf86-video-vesa",
			"xf86-video-qxl",
			"virtualbox-guest-utils",
			"xorg-server",
			"xfce4",
			"lightdm",
			"lightdm-gtk-greeter",
			"xfce4-screensaver",
			"xfce4-cpugraph-plugin",
			"xfce4-netload-plugin",
			"xfce4-systemload-plugin",
			"xfce4-weather-plugin",
			"xfce4-xkb-plugin",
			"xfce4-pulseaudio-plugin",
			"nedit",
			"gvim",
			"indent",
			"galculator",
			"maxima",
			"valgrind",
			"gdb",
			"meld",
			"texlive-core",
			"texlive-latexextra",
			"texlive-publishers",
			"texlive-pstricks",
			"graphviz",
			"evince",
			"doxygen",
			"wget",
			"firefox",
			"firefox-i18n-es-es",
			"firefox-ublock-origin",
			"thunderbird",
			"thunderbird-i18n-es-es",
			"imagemagick",
			"gimp",
			"dcraw",
			"mpv",
			"libreoffice-still",
			"libreoffice-still-es",
			"spamassassin");
		@postinstall=("systemctl enable lightdm.service");
	}
	elsif ($dist eq "Fedora")
	{
		@install=("dnf","install");
		@clean=("dnf","autoremove;","dnf","clean","all");
		@update=("dnf","update;","dnf","upgrade");
		@upgrade=("dnf","upgrade","--refresh;",
			"dnf","system-upgrade","download","--release=33");
		@preinstall="dnf group install gnome-desktop"
			if (!(-x "/usr/bin/gnome-shell"));
		@packages=(
			"dnf-plugin-system-upgrade",
			"patch",
			"autoconf",
			"automake",
			"pkgconf",
			"gcc",
			"gcc-c++",
			"gcc-gfortran",
			"make",
			"git",
			"subversion",
			"libxml2-devel",
			"glib-devel",
			"gettext-devel",
			"json-glib-devel",
			"sqlite-devel",
			"gsl-devel",
			"libgtop2-devel",
			"gtk3-devel",
			"gtk4-devel",
			"freeglut-devel",
			"glfw-devel",
			"SDL2-devel",
			"texlive-gnu-freefont",
			"glew-devel",
			"vulkan-headers",
			"vulkan-loader",
			"vulkan-validation-layers",
			"vulkan-tools",
			"glslang",
			"mpich-devel",
			"nedit",
			"vim-enhanced",
			"vim-X11",
			"indent",
			"maxima-gui",
			"valgrind",
			"ddd",
			"meld",
			"texlive",
			"texlive-latex",
			"texlive-collection-publishers",
			"texlive-collection-pstricks",
			"texlive-newunicodechar",
			"texlive-hanging",
			"texlive-stackengine",
			"graphviz",
			"evince",
			"doxygen",
			"wget",
			"firefox",
			"mozilla-ublock-origin",
			"thunderbird",
			"ImageMagick",
			"gimp",
			"ufraw-gimp",
			"totem",
			"libreoffice",
			"libreoffice-langpack-es",
			"spamassassin");
		system(@install,"virt-what") if (!(-x "/usr/sbin/virt-what"));
		$mach=`virt-what`;
		$mach=~ s/\n//g;
		print "Mach=" . $mach. "\n";
		if ($mach eq "virtualbox")
		{
			push @packages,"virtualbox-guest-additions";
		}
		elsif ($mach eq "kvm")
		{
			push @packages,"xorg-x11-drv-qxl";
		}
	}
	elsif ($dist eq "openSUSE")
	{
		@install=("zypper","install");
		@clean=("zypper","clean","-a");
		@update=("zypper","patch");
		@upgrade=("zypper","up");
		@packages=(
			"patch",
			"autoconf",
			"automake",
			"pkg-config",
			"gcc",
			"gcc-c++",
			"gcc-fortran",
			"make",
			"git-core",
			"subversion",
			"libxml2-devel",
			"glib2-devel",
			"gettext-tools",
			"json-glib-devel",
			"sqlite3-devel",
			"gsl-devel",
			"libgtop-devel",
			"gtk3-devel",
			"freeglut-devel",
			"libglfw-devel",
			"libSDL2-devel",
			"gnu-free-fonts",
			"glew-devel",
			"vulkan",
			"vulkan-devel",
			"glslang-devel",
			"mpich-devel",
			"xf86-input-keyboard",
			"xf86-input-mouse",
			"xf86-input-evdev",
			"xf86-video-vesa",
			"xorg-x11",
			"xfce4-session",
			"xfce4-terminal",
			"lightdm",
			"xscreensaver",
			"xfce4-panel-plugin-cpugraph",
			"xfce4-panel-plugin-netload",
			"xfce4-panel-plugin-systemload",
			"xfce4-panel-plugin-weather",
			"xfce4-panel-plugin-xkb",
			"orage",
			"xfce4-panel-plugin-pulseaudio",
			"nedit",
			"gvim",
			"indent",
			"galculator",
			"maxima-xmaxima",
			"valgrind",
			"ddd",
			"meld",
			"texlive",
			"texlive-latex",
			"texlive-collection-publishers",
			"texlive-pstricks",
			"graphviz",
			"evince",
			"doxygen",
			"wget",
			"MozillaFirefox",
			"MozillaThunderbird",
			"ImageMagick",
			"gimp",
			"gimp-ufraw",
			"mpv",
			"libreoffice",
			"libreoffice-l10n-es",
			"spamassassin");
		system(@install,"virt-what") if (!(-x "/usr/sbin/virt-what"));
		$mach=`virt-what`;
		$mach=~ s/\n//g;
		print "Mach=" . $mach. "\n";
		if ($mach eq "virtualbox")
		{
			push @packages,"virtualbox-guest-x11";
		}
		elsif ($mach eq "kvm")
		{
			push @packages,"xf86-video-qxl";
		}
	}
	elsif ($dist eq "Gentoo")
	{
		system("cp","gentoo.make.conf","/etc/portage/make.conf");
		@install=("emerge","--ask");
		@clean=("emerge","--ask","--depclean",";","eclean-dist","--deep");
		@update=("emerge","--sync");
		@upgrade=("emerge","--ask","--update","--deep","--with-bdeps=y","--newuse","\@world");
		@packages=(
			"app-portage/gentoolkit",
			"dev-vcs/subversion",
			"dev-libs/libxml2",
			"dev-libs/glib",
			"sys-devel/gettext",
			"dev-libs/json-glib",
			"dev-db/sqlite",
			"sci-libs/gsl",
			"gnome-base/libgtop",
			"x11-libs/gtk+",
			"media-libs/freeglut",
			"media-libs/glfw",
			"media-libs/glew",
			"media-libs/libsdl2",
			"media-fonts/freefont",
			"sys-cluster/mpich",
			"x11-drivers/xf86-input-evdev",
			"x11-drivers/xf86-input-libinput",
			"x11-drivers/xf86-input-synaptics",
			"x11-drivers/xf86-video-vesa",
			"xfce-extra/xfce4-notifyd",
			"xfce-base/xfce4-meta",
			"xfce-extra/xfce4-screensaver",
			"xfce-extra/xfce4-screenshooter",
			"xfce-extra/xfce4-cpugraph-plugin",
			"xfce-extra/xfce4-netload-plugin",
			"xfce-extra/xfce4-pulseaudio-plugin",
			"xfce-extra/xfce4-systemload-plugin",
			"xfce-extra/xfce4-weather-plugin",
			"xfce-extra/xfce4-xkb-plugin",
			"app-office/orage",
			"app-editors/gvim",
			"app-editors/nedit",
			"dev-util/indent",
			"sci-calculators/galculator",
			"sci-mathematics/maxima",
			"dev-util/ddd",
			"dev-util/valgrind",
			"dev-util/meld",
			"app-text/texlive",
			"dev-texlive/texlive-langenglish",
			"dev-texlive/texlive-langfrench",
			"dev-texlive/texlive-langspanish",
			"dev-texlive/texlive-latex",
			"dev-texlive/texlive-latexextra",
			"dev-texlive/texlive-luatex",
			"dev-texlive/texlive-publishers",
			"dev-texlive/texlive-pstricks",
			"media-gfx/graphviz",
			"app-text/evince",
			"app-doc/doxygen",
			"net-misc/wget",
			"www-client/firefox",
			"mail-client/thunderbird",
			"media-gfx/imagemagick",
			"media-gfx/gimp",
			"media-gfx/ufraw",
			"media-video/mpv",
			"app-office/libreoffice",
			"mail-filter/spamassassin");
		system(@install,"app-emulation/virt-what") if (!(-x "/usr/sbin/virt-what"));
		$mach=`virt-what`;
		$mach=~ s/\n//g;
		print "Mach=" . $mach. "\n";
		if ($mach eq "virtualbox")
		{
			push @packages,"app-emulation/virtualbox-guest-additions";
		}
		elsif ($mach eq "kvm")
		{
			push @packages,"x11-drivers/xf86-video-qxl";
		}
	}
	else
	{
		print "Unsupported Linux distribution\n";
	}
}
elsif ($os eq "FreeBSD")
{
	print "OS=" . $os . "\n";
	@install=("pkg","install");
	@clean=("pkg","autoremove;","pkg","clean","-a");
	@update=("freebsd-update","fetch;","freebsd-update","install;",
					 "pkg","update;","pkg","upgrade");
	@upgrade=("freebsd-update","-r","12.2-RELEASE","upgrade");
	@packages=(
		"gsed",
		"patch",
		"bash",
		"autoconf",
		"automake",
		"pkgconf",
		"gcc10",
		"gmake",
		"git",
		"subversion",
		"libxml2",
		"gettext-tools",
		"glib",
		"json-glib",
		"sqlite3",
		"gsl",
		"libgtop",
		"gtk3",
		"freeglut",
		"glfw",
		"sdl2",
		"freefont-ttf",
		"glew",
		"vulkan-headers",
		"vulkan-loader",
		"vulkan-validation-layers",
		"glslang",
		"mpich",
		"xorg-minimal",
		"xfce",
		"lightdm",
		"lightdm-gtk-greeter",
		"lightdm-gtk-greeter-settings",
		"xfce4-screensaver",
		"xfce4-cpugraph-plugin",
		"xfce4-netload-plugin",
		"xfce4-systemload-plugin",
		"xfce4-weather-plugin",
		"xfce4-xkb-plugin",
		"xfce4-terminal",
		"xfce4-pulseaudio-plugin",
		"xfce4-screenshooter-plugin",
		"vim",
		"nedit",
		"gindent",
		"galculator",
		"maxima",
		"gdb",
		"meld",
		"latex-beamer",
		"graphviz",
		"evince",
		"doxygen",
		"wget",
		"firefox-esr",
		"thunderbird",
		"ImageMagick7",
		"gimp",
		"ufraw",
		"mpv",
		"libreoffice",
		"es-libreoffice",
		"spamassassin");
	@postinstall=("echo dbus_enable=\"YES\" >> /etc/rc.conf");
	system(@install,"virt-what") if (!(-x "/usr/local/sbin/virt-what"));
	$mach=`virt-what`;
	$mach=~ s/\n//g;
	print "Mach=" . $mach. "\n";
	if ($mach eq "virtualbox")
	{
		push @packages,"virtualbox-ose-additions";
		push @postinstall,"\necho vboxguest_enable=\"YES\" >> /etc/rc.conf";
		push @postinstall,"\necho vboxservice_enable=\"YES\" >> /etc/rc.conf";
	}
	elsif ($mach eq "kvm")
	{
#		push @packages,"xf86-video-qxl";
	}
	push @postinstall,"\necho lightdm_enable=\"YES\" >> /etc/rc.conf";
}
elsif ($os eq "NetBSD")
{
	$arch=`uname -m`;
	$arch=~ s/\n//g;
	$ver=`uname -r`;
	$ver=~ s/\n//g;
	print "OS=" . $os . ' ' . $ver . " Arch=" . $arch . "\n";
	@preinstall=("PKG_PATH=\"http://cdn.NetBSD.org/pub/pkgsrc/packages/$os/$arch/$ver/All\"\nPATH=\"/usr/pkg/sbin:\$PATH\"\nexport PATH PKG_PATH");
	@install=("pkg_add");
	@update=("pkgin","update;","pkgin","upgrade");
	@clean=("pkgin","autoremove;","pkgin","clean");
	@packages=(
		"pkgin",
		"virt-what",
		"gsed",
		"patch",
		"bash",
		"autoconf",
		"automake",
		"pkgconf",
		"gcc9",
		"gmake",
		"git",
		"subversion",
		"libxml2",
		"gettext-tools",
		"glib2",
		"json-glib",
		"sqlite3",
		"gsl",
		"libgtop",
		"gtk3+",
		"freeglut",
		"glfw",
		"SDL2",
		"freefont-ttf",
		"glew",
		"mpich",
		"xfce4",
		"xfce4-cpugraph-plugin",
		"xfce4-netload-plugin",
		"xfce4-systemload-plugin",
		"xfce4-weather-plugin",
		"xfce4-xkb-plugin",
		"xfce4-mixer",
		"xfce4-screenshooter",
		"vim-gtk3",
		"nedit",
		"gindent",
		"galculator",
		"gnuplot",
		"maxima",
		"ddd",
		"meld",
		"tex-latex",
		"tex-pst-pdf",
		"tex-babel-spanish",
		"tex-babel-french",
		"tex-elsarticle",
		"tex-beamer",
		"tex-adjustbox",
		"tex-float",
		"tex-varwidth",
		"tex-fancyvrb",
		"tex-multirow",
		"tex-hanging",
		"tex-stackengine",
		"tex-ulem",
		"tex-wasysym",
		"tex-sectsty",
		"tex-fancyhdr",
		"tex-tocloft",
		"tex-newunicodechar",
		"tex-caption",
		"tex-etoc",
		"graphviz",
		"evince",
		"doxygen",
		"wget",
		"firefox-esr",
		"thunderbird",
		"ImageMagick",
		"gimp",
		"gimp-ufraw",
		"mpv",
		"libreoffice",
		"spamassassin");
}
elsif ($os eq "OpenBSD")
{
	print "OS=" . $os . "\n";
	@install=("pkg_add");
	@update=("pkg_add","-u");
	@packages=(
		"gsed",
		"gpatch",
		"bash",
		"autoconf-2.69p2",
		"automake-1.16.2",
		"pkgconf",
		"gcc",
		"gmake",
		"git",
		"subversion",
		"libxml",
		"gettext-tools",
		"glib2",
		"json-glib",
		"sqlite3",
		"gsl",
		"libgtop2",
		"gtk+3",
		"freeglut",
		"glfw",
		"sdl2",
		"freefont-ttf",
		"glew",
		"vulkan-headers",
		"vulkan-loader",
		"vulkan-validation-layers",
		"glslang",
		"openmpi",
		"xfce",
		"xfce4-cpugraph",
		"xfce4-netload",
		"xfce4-systemload",
		"xfce4-weather",
		"xfce4-xkb",
		"orage",
		"xfce4-pulseaudio",
		"xfce4-screenshooter",
		"vim-8.2.534-gtk3",
		"nedit",
		"gindent",
		"galculator",
		"maxima",
		"ddd",
		"meld",
		"texlive_texmf-full",
		"graphviz",
		"evince",
		"doxygen",
		"wget",
		"firefox-esr-i18n-es-ES",
		"thunderbird-i18n-es-ES",
		"ImageMagick",
		"gimp",
		"ufraw",
		"mpv",
		"libreoffice-i18n-es",
		"milter-spamd");
}
elsif ($os eq "DragonFly")
{
	print "OS=" . $os . "\n";
	@install=("pkg","install");
	@clean=("pkg","autoremove;","pkg","clean","-a");
	@update=("pkg","update;","pkg","upgrade");
	@packages=(
		"gsed",
		"patch",
		"bash",
		"autoconf",
		"automake",
		"pkgconf",
		"gcc",
		"gmake",
		"git",
		"subversion",
		"libxml2",
		"gettext-tools",
		"glib",
		"json-glib",
		"sqlite3",
		"gsl",
		"libgtop",
		"gtk3",
		"freeglut",
		"glfw",
		"sdl2",
		"freefont-ttf",
		"glew",
		"vulkan-headers",
		"vulkan-loader",
		"vulkan-validation-layers",
		"glslang",
		"mpich",
		"xf86-input-keyboard",
		"xf86-input-mouse",
		"xorg-minimal",
		"xfce",
		"xfce4-screensaver",
		"xfce4-cpugraph-plugin",
		"xfce4-netload-plugin",
		"xfce4-systemload-plugin",
		"xfce4-weather-plugin",
		"xfce4-xkb-plugin",
		"xfce4-terminal",
		"orage",
		"xfce4-mixer",
		"xfce4-screenshooter-plugin",
		"vim",
		"nedit",
		"gindent",
		"galculator",
		"maxima",
		"gdb",
		"meld",
		"latex-beamer",
		"graphviz",
		"evince",
		"doxygen",
		"wget",
		"firefox-esr",
		"thunderbird",
		"ImageMagick7",
		"gimp",
		"ufraw",
		"mpv",
		"libreoffice",
		"es-libreoffice",
		"spamassassin");
	#@postinstall=("echo dbus_enable=\"YES\" >> /etc/rc.conf");
	system(@install,"virt-what") if (!(-x "/usr/local/sbin/virt-what"));
	$mach=`virt-what`;
	$mach=~ s/\n//g;
	print "Mach=" . $mach. "\n";
	#push @postinstall,"\necho lightdm_enable=\"YES\" >> /etc/rc.conf";
}
elsif ($os eq "SunOS")
{
	print "OS=" . $os . " ";
	$dist=`uname -v`;
	$dist=~ s/\n//g;
	if ($dist eq "5.10.18.git.2a44663-0.1")
	{
		print "Dist=Dyson\n";
		system("sudo","apt","install","aptitude") if (!(-x "/usr/bin/aptitude"));
		@install=("aptitude","install");
		@clean=("aptitude","clean");
		@update=("aptitude","update");
		@upgrade=("aptitude","upgrade");
		@packages=(
			"patch",
			"autoconf",
			"automake",
			"pkg-config",
			"g++",
			"gfortran",
			"make",
			"git",
			"subversion",
			"libxml2-dev",
			"libglib2.0-dev",
			"libjson-glib-dev",
			"libsqlite3-dev",
			"libgsl-dev",
			"libgtop2-dev",
			"libgtk-3-dev",
			"freeglut3-dev",
			"libsdl2-dev",
			"fonts-freefont-ttf",
			"libglew-dev",
			"mpich2",
			"libmpich-dev",
			"xserver-xorg-input-kbd",
			"xserver-xorg-input-mouse",
			"xserver-xorg-video-vesa",
			"virtualbox-guest-x11",
			"xorg",
			"xfce4",
			"xscreensaver",
			"xfce4-xkb-plugin",
			"xfce4-terminal",
			"orage",
			"gstreamer1.0-plugins-good",
			"gstreamer1.0-pulseaudio",
			"xfce4-pulseaudio-plugin",
			"xfce4-screenshooter",
			"vim-gtk3",
			"indent",
			"gnome-calculator",
			"xmaxima",
			"ddd",
			"meld",
			"texlive-latex-extra",
			"texlive-luatex",
			"texlive-publishers",
			"texlive-fonts-recommended",
			"texlive-lang-spanish",
			"texlive-lang-french",
			"texlive-lang-english",
			"texlive-lang-italian",
			"texlive-pstricks",
			"graphviz",
			"xpdf",
			"doxygen",
			"wget",
			"imagemagick",
			"gimp",
			"gimp-ufraw",
			"gnumeric",
			"libreoffice",
			"libreoffice-l10n-es");
	}
	else
	{
		print "Dist=OpenIndiana\n";
		@install=("pkg","install");
		@clean=("beadm","list");
		@update=("pkg","update;","/opt/csw/bin/pkgutil","-U","-u","-y");
		system("pkg","install","mate_install")
			if (!(-x "/usr/bin/mate-session"));
		system("pkg","install","wget") if (!(-x "/usr/bin/wget"));
		system("wget","http://mirror.opencsw.org/opencsw/pkgutil.pkg")
			if (!(-f "pkgutil.pkg"));
		system("pkgadd","-d","pkgutil.pkg","all")
			if (!(-x "/opt/csw/bin/pkgutil"));
		@packages=(
			"gnu-patch",
			"gnu-sed",
			"autoconf",
			"automake",
			"pkg-config",
			"gcc-7",
			"gcc-10",
			"git",
			"developer/versioning/subversion",
			"gettext",
			"json-glib",
			"gsl",
			"library/mpich/gcc",
			"gtk3",
			"libglew",
			"freeglut",
			"sdl2",
			"gnome-fonts",
			"mate_install",
			"gvim",
			"gnu-indent",
			"gnuplot",
			"meld",
			"evince",
			"doxygen",
			"wget",
			"firefox",
			"thunderbird",
			"imagemagick",
			"gimp",
			"dcraw",
			"gnumeric",
			"libreoffice"
		);
		@postinstall=("export PATH=\$PATH:/opt/csw/bin");
		push (@postinstall,"\npkgutil -U");
		push (@postinstall,"\npkgutil --install");
		push (@postinstall,"texlive");
		push (@postinstall,"texlive_latex_extra");
		push (@postinstall,"texlive_luatex");
		push (@postinstall,"texlive_publishers");
		push (@postinstall,"texlive_fonts_recommended");
		push (@postinstall,"texlive_lang_spanish");
		push (@postinstall,"texlive_lang_french");
		push (@postinstall,"texlive_lang_italian");
		push (@postinstall,"texlive_pstricks");
		push (@postinstall,"graphviz");
	}
}
elsif ($os eq "GNU")
{
	print "OS=" . $os . "\n";
	@install=("apt","install");
	@clean=("apt","autoremove;","apt","clean");
	@update=("apt","update");
	@upgrade=("apt","upgrade");
	@packages=(
		"patch",
		"autoconf",
		"automake",
		"pkg-config",
		"g++",
		"gfortran",
		"make",
		"git",
		"subversion",
		"libxml2-dev",
		"libglib2.0-dev",
		"libjson-glib-dev",
		"gettext",
		"libsqlite3-dev",
		"libgsl-dev",
		"libgtop2-dev",
		"libgtk-3-dev",
		"freeglut3-dev",
		"libglfw3-dev",
		"libsdl2-dev",
		"fonts-freefont-otf",
		"glslang-tools",
		"libglew-dev",
		"mpich",
		"libmpich-dev",
		"xserver-xorg-input-kbd",
		"xserver-xorg-input-mouse",
		"xserver-xorg-video-vesa",
		"xorg",
		"xfce4",
		"xfce4-screensaver",
		"xfce4-weather-plugin",
		"xfce4-xkb-plugin",
		"xfce4-terminal",
		"orage",
		"gstreamer1.0-plugins-good",
		"gstreamer1.0-pulseaudio",
		"xfce4-pulseaudio-plugin",
		"xfce4-screenshooter",
		"nedit",
		"vim-gtk3",
		"indent",
		"galculator",
		"ddd",
		"meld",
		"texlive-latex-extra",
		"texlive-luatex",
		"texlive-publishers",
		"texlive-fonts-recommended",
		"texlive-lang-spanish",
		"texlive-lang-french",
		"texlive-lang-english",
		"texlive-lang-italian",
		"texlive-pstricks",
		"graphviz",
		"evince",
		"doxygen",
		"wget",
		"imagemagick");
	system(@install,"virt-what") if (!(-x "/usr/sbin/virt-what"));
	$machine=`virt-what`;
	$machine=~ s/\n//g;
	if ($machine eq "kvm")
	{
		push @packages,"xserver-xorg-video-qxl";
	}
}
elsif ($os eq "Darwin")
{
	print "OS=" . $os . "\n";
	@install=("brew","install");
	@installcask=("brew","cask","install");
	@clean=("brew","cleanup;","brew","cleanup","cask");
	@update=("brew","update");
	@upgrade=("brew","upgrade;","brew","upgrade","--cask","--greedy");
	system("/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)\"")
		if (!(-x "/usr/local/bin/brew"));
	@packagescask=(
		"xquartz",
		"homebrew/cask-fonts/font-freesans",
		"macvim",
		"meld",
		"mactex-no-gui",
		"firefox",
		"thunderbird",
		"gimp",
		"libreoffice");
	@preinstall=("@installcask @packagescask");
	@packages=(
		"gnu-sed",
		"gpatch",
		"autoconf",
		"automake",
		"pkg-config",
		"gcc",
		"make",
		"git",
		"subversion",
		"libxml2",
		"gettext",
		"glib",
		"json-glib",
		"sqlite",
		"gsl",
		"libgtop",
		"gtk+3",
		"gtk4",
		"freeglut",
		"glfw",
		"sdl2",
		"glew",
		"glslang",
		"mpich",
		"nedit",
		"gnu-indent",
		"maxima",
		"ddd",
		"graphviz",
		"evince",
		"doxygen",
		"wget",
		"imagemagick",
		"ufraw",
		"mpv");
}
else
{
	$os=`uname -o`;
	$os=~ s/\n//g;
	$machine=`uname -m`;
	$machine=~ s/\n//g;
	print "OS=" . $os . " Mach=" . $machine . "\n";
	if ($os eq "Msys")
	{
		@install=("pacman","-S");
		@clean=("pacman","-Sc");
		@update=("pacman","-Syu");
		if ($machine eq "x86_64")
		{
			$mingw="mingw64/mingw-w64-x86_64-";
		}
		elsif ($machine eq "i686")
		{
			$mingw="mingw32/mingw-w64-i686-";
		}
		@packages=(
			"zip",
			"xz",
			"tar",
			"unzip",
			"patch",
			"autoconf",
			"automake",
			"make",
			$mingw."gcc",
			$mingw."gcc-fortran",
			"pkg-config",
			"git",
			"subversion",
			$mingw."libxml2",
			$mingw."glib2",
			$mingw."json-glib",
			$mingw."sqlite3",
			$mingw."gsl",
			$mingw."gettext",
			$mingw."gtk3",
			$mingw."gtk4",
			$mingw."freeglut",
			$mingw."glfw",
			$mingw."SDL2",
			$mingw."glew",
			$mingw."vulkan-loader",
			$mingw."vulkan-headers",
			$mingw."vulkan-validation-layers",
			$mingw."glslang",
			"vim",
			$mingw."indent",
			$mingw."gdb",
			$mingw."meld3",
			$mingw."evince",
			"doxygen",
			"wget",
			$mingw."imagemagick",
			$mingw."gimp",
			$mingw."gimp-ufraw");
		@postinstall=(
			"ver=20120503",
			"\nname=freefont",
			"\nfile=\"\${name}-ttf-\${ver}.zip\"",
			"\nurl=\"https://ftp.gnu.org/gnu/\${name}/\${file}\"",
			"\ndir=/usr/share/fonts/truetype/",
			"\nwget \$url",
			"\nunzip \$file",
			"\ncd \"\${name}-\${ver}\"",
			"\nif test -d \$dir; then mkdir -p \$dir; fi",
			"\nmv *.ttf \$dir",
			"\ncd ..",
			"\necho \"\${name}*\"",
			"\nrm -rf \"\${name}*\"");
	}
	elsif ($os eq "Cygwin")
	{
		if ($machine eq "x86_64")
		{
			@install=("/sbin/setup-x86_64.exe");
			if (!(-x $install[0]))
			{
				print "Error!\nYou have to copy the installation program ".
					"(setup-86_64.exe) in /sbin\n";
				exit 1;
			}
		}
		elsif ($machine eq "i686")
		{
			@install=("/sbin/setup-x86.exe");
			if (!(-x $install[0]))
			{
				print "Error!\nYou have to copy the installation program ".
					"(setup-86.exe) in /sbin\n";
				exit 1;
			}
		}
		@update=@install;
		@packages=(
			"-P pkg-config",
			"-P autoconf",
			"-P automake",
			"-P make",
			"-P gcc-core",
			"-P gcc-g++",
			"-P gcc-fortran",
			"-P git",
			"-P subversion",
			"-P libxml2-devel",
			"-P libglib2.0-devel",
			"-P libjson-glib1.0-devel",
			"-P libsqlite3-devel",
			"-P libgsl-devel",
			"-P gettext-devel",
			"-P libgtop2.0-devel",
			"-P libgtk3-devel",
			"-P libGLEW-devel",
			"-P libSDL2-devel",
			"-P gnu-free-fonts",
			"-P libiconv-devel",
			"-P xorg-server",
			"-P xinit",
			"-P xfce4-session",
			"-P xfce4-cpugraph-plugin",
			"-P xfce4-weather-plugin",
			"-P xfce4-xkb-plugin",
			"-P xfce4-pulseaudio-plugin",
			"-P xfce4-screenshooter",
			"-P vim",
			"-P gvim",
			"-P indent",
			"-P gnome-calculator",
			"-P gnuplot",
			"-P maxima-xmaxima",
			"-P gdb",
			"-P ddd",
			"-P meld",
			"-P evince",
			"-P doxygen",
			"-P wget",
			"-P ImageMagick",
			"-P gimp",
			"-P gimp-ufraw",
			"-P parole");
	}
	else
	{
		print "Unsupported operative system\n";
	}
}
if (@install)
{
	open (INSTALL,">install.sh");
	if (@preinstall)
	{
		print INSTALL "@preinstall\n";
	}
	print INSTALL "@install @packages\n";
	print INSTALL "@postinstall\n" if (@postinstall);
	close (INSTALL);
}
if (@clean)
{
	open (CLEAN,">clean.sh");
	print CLEAN "@clean\n";
	close (CLEAN);
}
if (@update)
{
	open (UPDATE,">update.sh");
	print UPDATE "@update\n";
	close (UPDATE);
}
if (@upgrade)
{
	open (UPGRADE,">upgrade.sh");
	print UPGRADE "@upgrade\n";
	close (UPGRADE);
}
