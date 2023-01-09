#!/usr/bin/env perl

#Supported systems
#Arch Linux
#Debian Hurd 12
#Debian Linux 11
#Devuan Linux
#Dragonfly BSD 6.4
#Fedora Linux 37
#FreeBSD 13.2
#Gentoo Linux
#Haiku
#Linux Mint
#MacOS Big Sur + Homebrew
#Manjaro Linux
#Microsoft Windows + CYGWIN
#Microsoft Windows + MSYS2
#NetBSD
#OpenBSD
#OpenIndiana Hipster
#OpenSUSE Linux
#Xubuntu Linux 22.10

#Without GTK4:
#Debian and Devuan Linux
#Linux Mint
#OpenIndiana
#Haiku
#Windows + CYGWIN

#GCC versions
#12 Arch Linux
#12 Debian Hurd
#10 Debian Linux
#10 Devuan Linux
#11 Dragonfly BSD
#12 Fedora Linux
#11 FreeBSD
#11 Gentoo Linux
#11 Haiku
#10 Linux Mint
#-- MacOS Big Sur + Homebrew
#12 Manjaro Linux
#11 Microsoft Windows + CYGWIN
#12 Microsoft Windows + MSYS2
#12 NetBSD
#11 OpenBSD
#11 OpenIndiana
#11 OpenSUSE Linux
#12 Xubuntu Linux

#CLang versions
#14 Arch Linux
#14 Debian Hurd
#11 Debian Linux
#11 Devuan Linux
#-- Dragonfly BSD
#15 Fedora Linux
#13 FreeBSD
#15 Gentoo Linux
#12 Haiku
#11 Linux Mint
#13 MacOS Big Sur + Homebrew
#14 Manjaro Linux
#-- Microsoft Windows + CYGWIN
#15 Microsoft Windows + MSYS2
#13 NetBSD
#13 OpenBSD
#13 OpenIndiana
#13 OpenSUSE Linux
#15 Xubuntu Linux

use File::Copy 'move';
$os = `uname -s`;
$os =~ s/\n//g;
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
    $dist = `lsb_release -i -s`;
    $dist =~ s/\n//g;
    print "OS=" . $os . " Dist=" . $dist . "\n";
    if ($dist eq "Debian" || $dist eq "Devuan")
    {
        system("apt", "install", "aptitude")
          if (!(-x "/usr/bin/aptitude"));
        @install = ("aptitude", "install");
        @clean   = ("aptitude", "clean");
        @update  = ("aptitude", "update");
        @upgrade = ("aptitude", "upgrade");
        @packages = (
                     "patch",                     "autoconf",
                     "automake",                  "pkg-config",
                     "g++",                       "gfortran",
                     "clang",                     "llvm",
                     "make",                      "git",
                     "subversion",                "libxml2-dev",
                     "libglib2.0-dev",            "libjson-glib-dev",
                     "gettext",                   "libsqlite3-dev",
                     "libgsl-dev",                "libgtop2-dev",
                     "libgtk-3-dev",              "freeglut3-dev",
                     "libglfw3-dev",              "libsdl2-dev",
                     "fonts-freefont-otf",        "libglew-dev",
                     "glslang-tools",             "mpich",
                     "libmpich-dev",              "xserver-xorg-input-kbd",
                     "xserver-xorg-input-mouse",  "xserver-xorg-input-evdev",
                     "xserver-xorg-video-vesa",   "xorg",
                     "xfce4",                     "lightdm",
                     "xscreensaver",              "xfce4-cpugraph-plugin",
                     "xfce4-netload-plugin",      "xfce4-systemload-plugin",
                     "xfce4-weather-plugin",      "xfce4-xkb-plugin",
                     "xfce4-terminal",            "gstreamer1.0-plugins-good",
                     "gstreamer1.0-pulseaudio",   "xfce4-pulseaudio-plugin",
                     "xfce4-screenshooter",       "nedit",
                     "vim-gtk3",                  "indent",
                     "perltidy",                  "galculator",
                     "xmaxima",                   "valgrind",
                     "valgrind-mpi",              "ddd",
                     "meld",                      "texlive-latex-extra",
                     "texlive-luatex",            "texlive-publishers",
                     "texlive-fonts-recommended", "texlive-lang-spanish",
                     "texlive-lang-french",       "texlive-lang-english",
                     "texlive-lang-italian",      "texlive-pstricks",
                     "graphviz",                  "evince",
                     "doxygen",                   "wget",
                     "firefox-esr",               "firefox-esr-l10n-es-es",
                     "webext-ublock-origin",      "thunderbird",
                     "thunderbird-l10n-es-es",    "imagemagick",
                     "gimp",                      "mpv",
                     "gnumeric",                  "libreoffice",
                     "libreoffice-l10n-es",       "spamassassin"
                    );
        system(@install, "virt-what") if (!(-x "/usr/sbin/virt-what"));
        $mach = `virt-what`;
        $mach =~ s/\n//g;
        print "Mach=" . $mach . "\n";

        if ($mach eq "virtualbox")
        {
            push @packages, "virtualbox-guest-x11";
        }
        elsif ($mach eq "kvm")
        {
            push @packages, "qemu-guest-agent";
            push @packages, "xserver-xorg-video-qxl";
        }
    }
    elsif ($dist eq "Linuxmint")
    {
        system("apt", "install", "aptitude")
          if (!(-x "/usr/bin/aptitude"));
        @install = ("aptitude", "install");
        @clean   = ("aptitude", "clean");
        @update  = ("aptitude", "update");
        @upgrade = ("aptitude", "upgrade");
        @packages = (
                     "patch",                     "autoconf",
                     "automake",                  "pkg-config",
                     "g++",                       "gfortran",
                     "clang",                     "make",
                     "git",                       "subversion",
                     "libxml2-dev",               "libglib2.0-dev",
                     "libjson-glib-dev",          "gettext",
                     "libsqlite3-dev",            "libgsl-dev",
                     "libgtop2-dev",              "libgtk-3-dev",
                     "freeglut3-dev",             "libglfw3-dev",
                     "libsdl2-dev",               "fonts-freefont-otf",
                     "libglew-dev",               "glslang-tools",
                     "mpich",                     "libmpich-dev",
                     "vim-gtk3",                  "indent",
                     "perltidy",                  "galculator",
                     "xmaxima",                   "valgrind",
                     "valgrind-mpi",              "ddd",
                     "meld",                      "texlive-latex-extra",
                     "texlive-luatex",            "texlive-publishers",
                     "texlive-fonts-recommended", "texlive-lang-spanish",
                     "texlive-lang-french",       "texlive-lang-english",
                     "texlive-lang-italian",      "texlive-pstricks",
                     "graphviz",                  "evince",
                     "doxygen",                   "wget",
                     "firefox",                   "firefox-l10n-es",
                     "webext-ublock-origin",      "thunderbird",
                     "thunderbird-l10n-es-es",    "imagemagick",
                     "gimp",                      "mpv",
                     "gnumeric",                  "libreoffice",
                     "libreoffice-l10n-es",       "spamassassin"
                    );
        system(@install, "virt-what") if (!(-x "/usr/sbin/virt-what"));
        $mach = `virt-what`;
        $mach =~ s/\n//g;
        print "Mach=" . $mach . "\n";

        if ($mach eq "virtualbox")
        {
            push @packages, "virtualbox-guest-x11";
        }
        elsif ($mach eq "kvm")
        {
            push @packages, "qemu-guest-agent";
            push @packages, "xserver-xorg-video-qxl";
        }
    }
    elsif ($dist eq "Ubuntu")
    {
        system("sudo", "apt", "install", "aptitude")
          if (!(-x "/usr/bin/aptitude"));
        @install = ("aptitude", "install");
        @clean   = ("aptitude", "clean");
        @update  = ("aptitude", "update");
        @upgrade = ("aptitude", "upgrade");
        @packages = (
                     "patch",                     "autoconf",
                     "automake",                  "pkg-config",
                     "g++",                       "gfortran",
                     "clang",                     "make",
                     "git",                       "subversion",
                     "libxml2-dev",               "libglib2.0-dev",
                     "libjson-glib-dev",          "gettext",
                     "libsqlite3-dev",            "libgsl-dev",
                     "libgtop2-dev",              "libgtk-3-dev",
                     "libgtk-4-dev",              "freeglut3-dev",
                     "libglfw3-dev",              "libsdl2-dev",
                     "fonts-freefont-otf",        "libglew-dev",
                     "glslang-tools",             "mpich",
                     "libmpich-dev",              "nedit",
                     "vim-gtk3",                  "indent",
                     "perltidy",                  "galculator",
                     "xmaxima",                   "valgrind",
                     "valgrind-mpi",              "ddd",
                     "meld",                      "texlive-latex-extra",
                     "texlive-luatex",            "texlive-publishers",
                     "texlive-fonts-recommended", "texlive-lang-spanish",
                     "texlive-lang-french",       "texlive-lang-english",
                     "texlive-lang-italian",      "texlive-pstricks",
                     "graphviz",                  "evince",
                     "doxygen",                   "wget",
                     "firefox",                   "firefox-locale-es",
                     "webext-ublock-origin",      "thunderbird",
                     "thunderbird-locale-es",     "imagemagick",
                     "gimp",                      "mpv",
                     "gnumeric",                  "libreoffice",
                     "spamassassin"
                    );
        system(@install, "virt-what") if (!(-x "/usr/sbin/virt-what"));
        $mach = `virt-what`;
        $mach =~ s/\n//g;
        print "Mach=" . $mach . "\n";

        if ($mach eq "virtualbox")
        {
            push @packages, "virtualbox-guest-x11";
        }
        elsif ($mach eq "kvm")
        {
            push @packages, "qemu-guest-agent";
            push @packages, "xserver-xorg-video-qxl";
        }
    }
    elsif ($dist eq "ManjaroLinux")
    {
        @install = ("pacman", "-S");
        @clean   = ("pacman", "-Sc");
        @update  = ("pacman", "-Syu");
        @packages = (
                     "patch",                   "autoconf",
                     "automake",                "pkgconf",
                     "gcc",                     "gcc-fortran",
                     "clang",                   "llvm",
                     "make",                    "git",
                     "subversion",              "libxml2",
                     "glib2",                   "json-glib",
                     "sqlite",                  "gsl",
                     "libgtop",                 "gtk3",
                     "gtk4",                    "freeglut",
                     "glfw-x11",                "sdl2",
                     "gnu-free-fonts",          "glew",
                     "vulkan-headers",          "openmpi",
                     "xfce4-screensaver",       "xfce4-cpugraph-plugin",
                     "xfce4-netload-plugin",    "xfce4-systemload-plugin",
                     "xfce4-weather-plugin",    "xfce4-xkb-plugin",
                     "xfce4-pulseaudio-plugin", "gvim",
                     "indent",                  "perl-tidy",
                     "galculator",              "maxima",
                     "valgrind",                "gdb",
                     "meld",                    "texlive-core",
                     "texlive-latexextra",      "texlive-publishers",
                     "texlive-pstricks",        "graphviz",
                     "evince",                  "doxygen",
                     "wget",                    "firefox",
                     "firefox-i18n-es-es",      "firefox-ublock-origin",
                     "thunderbird",             "thunderbird-i18n-es-es",
                     "imagemagick",             "gimp",
                     "mpv",                     "libreoffice-still",
                     "libreoffice-still-es",    "spamassassin"
                    );
        system(@install, "virt-what") if (!(-x "/usr/sbin/virt-what"));
        $mach = `virt-what`;
        $mach =~ s/\n//g;
        print "Mach=" . $mach . "\n";

        if ($mach eq "virtualbox")
        {
            push @packages, "virtualbox-guest-utils";
        }
        elsif ($mach eq "kvm")
        {
            push @packages, "xf86-video-qxl";
        }
    }
    elsif ($dist eq "Arch")
    {
        @install = ("pacman", "-S");
        @clean   = ("pacman", "-Rs", "\$(pacman", "-Qdtq);", "pacman", "-Sc");
        @update  = ("pacman", "-Syu");
        @packages = (
                     "patch",                   "autoconf",
                     "automake",                "pkgconf",
                     "gcc",                     "gcc-fortran",
                     "clang",                   "make",
                     "git",                     "subversion",
                     "libxml2",                 "glib2",
                     "json-glib",               "sqlite",
                     "gsl",                     "libgtop",
                     "gtk3",                    "gtk4",
                     "freeglut",                "glfw-x11",
                     "sdl2",                    "gnu-free-fonts",
                     "glew",                    "vulkan-headers",
                     "openmpi",                 "xf86-video-vesa",
                     "xorg-server",             "pulseaudio",
                     "pulseaudio-alsa",         "pavucontrol",
                     "xfce4",                   "lightdm",
                     "lightdm-gtk-greeter",     "xfce4-screensaver",
                     "xfce4-cpugraph-plugin",   "xfce4-netload-plugin",
                     "xfce4-systemload-plugin", "xfce4-weather-plugin",
                     "xfce4-xkb-plugin",        "xfce4-pulseaudio-plugin",
                     "gvim",                    "indent",
                     "perl-tidy",               "galculator",
                     "maxima",                  "valgrind",
                     "gdb",                     "meld",
                     "texlive-core",            "texlive-latexextra",
                     "texlive-publishers",      "texlive-pstricks",
                     "graphviz",                "evince",
                     "doxygen",                 "wget",
                     "firefox",                 "firefox-i18n-es-es",
                     "firefox-ublock-origin",   "thunderbird",
                     "thunderbird-i18n-es-es",  "imagemagick",
                     "gimp",                    "mpv",
                     "libreoffice-still",       "libreoffice-still-es",
                     "spamassassin"
                    );
        @postinstall = ("systemctl enable lightdm.service");
        system(@install, "virt-what") if (!(-x "/usr/sbin/virt-what"));
        $mach = `virt-what`;
        $mach =~ s/\n//g;
        print "Mach=" . $mach . "\n";

        if ($mach eq "virtualbox")
        {
            push @packages, "virtualbox-guest-utils";
        }
        elsif ($mach eq "kvm")
        {
            push @packages, "xf86-video-qxl";
        }
    }
    elsif ($dist eq "Fedora")
    {
        @install = ("dnf", "install");
        @clean   = ("dnf", "autoremove;", "dnf", "clean", "all");
        @update  = ("dnf", "update");
        @upgrade = (
                    "dnf",            "upgrade",
                    "--refresh;",     "dnf",
                    "system-upgrade", "download",
                    "--release=37;",  "dnf",
                    "system-upgrade", "reboot"
                   );
        @preinstall = "dnf group install gnome-desktop"
          if (!(-x "/usr/bin/gnome-shell"));
        @packages = (
                     "dnf-plugin-system-upgrade",
                     "patch",
                     "autoconf",
                     "automake",
                     "pkgconf",
                     "gcc",
                     "gcc-c++",
                     "gcc-gfortran",
                     "clang",
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
                     "perltidy",
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
                     "spamassassin"
                    );
        system(@install, "virt-what") if (!(-x "/usr/sbin/virt-what"));
        $mach = `virt-what`;
        $mach =~ s/\n//g;
        print "Mach=" . $mach . "\n";

        if ($mach eq "virtualbox")
        {
            push @packages, "virtualbox-guest-additions";
        }
        elsif ($mach eq "kvm")
        {
            push @packages, "xorg-x11-drv-qxl";
        }
    }
    elsif ($dist eq "openSUSE")
    {
        @install = ("zypper", "install");
        @clean   = ("zypper", "clean", "-a");
        @update  = ("zypper", "patch");
        @upgrade = ("zypper", "up");
        @packages = (
                     "patch",                         "autoconf",
                     "automake",                      "pkg-config",
                     "gcc11",                         "gcc11-c++",
                     "gcc11-fortran",                 "clang",
                     "llvm",                          "make",
                     "git-core",                      "subversion",
                     "libxml2-devel",                 "glib2-devel",
                     "gettext-tools",                 "json-glib-devel",
                     "sqlite3-devel",                 "gsl-devel",
                     "libgtop-devel",                 "gtk3-devel",
                     "gtk4-devel",                    "freeglut-devel",
                     "libglfw-devel",                 "libSDL2-devel",
                     "gnu-free-fonts",                "glew-devel",
                     "vulkan",                        "vulkan-devel",
                     "glslang-devel",                 "mpich-devel",
                     "xf86-input-keyboard",           "xf86-input-mouse",
                     "xf86-input-evdev",              "xf86-video-vesa",
                     "xorg-x11",                      "xfce4-session",
                     "xfce4-terminal",                "lightdm",
                     "xfce4-panel-plugin-pulseaudio", "nedit",
                     "gvim",                          "indent",
                     "perl-Perl-Tidy",                "galculator",
                     "maxima-xmaxima",                "valgrind",
                     "ddd",                           "meld",
                     "texlive",                       "texlive-latex",
                     "texlive-collection-publishers", "texlive-pstricks",
                     "graphviz",                      "evince",
                     "doxygen",                       "wget",
                     "MozillaFirefox",                "MozillaThunderbird",
                     "ImageMagick",                   "gimp",
                     "mpv",                           "libreoffice",
                     "libreoffice-l10n-es",           "spamassassin"
                    );
        system(@install, "virt-what") if (!(-x "/usr/sbin/virt-what"));
        $mach = `virt-what`;
        $mach =~ s/\n//g;
        print "Mach=" . $mach . "\n";

        if ($mach eq "virtualbox")
        {
            push @packages, "virtualbox-guest-x11";
        }
        elsif ($mach eq "kvm")
        {
            push @packages, "xf86-video-qxl";
        }
    }
    elsif ($dist eq "Gentoo")
    {
        system("cp", "gentoo.make.conf", "/etc/portage/make.conf");
        @install    = ("emerge",              "--ask");
        @preinstall = ("USE=\"gimp -vaapi\"", @install, "media-libs/mesa");
        @clean =
          ("emerge", "--ask", "--depclean", ";", "eclean-dist", "--deep");
        @update = ("emerge", "--sync");
        @upgrade = (
                    "emerge",         "--ask",
                    "--update",       "--deep",
                    "--with-bdeps=y", "--newuse",
                    "\@world"
                   );
        @packages = (
                     "app-portage/gentoolkit",
                     "dev-vcs/subversion",
                     "dev-libs/libxml2",
                     "dev-libs/glib",
                     "sys-devel/gettext",
                     "dev-libs/json-glib",
                     "dev-db/sqlite",
                     "sci-libs/gsl",
                     "sys-cluster/mpich",
                     "gnome-base/libgtop",
                     "x11-libs/gtk+",
                     "gui-libs/gtk",
                     "media-libs/freeglut",
                     "media-libs/glfw",
                     "media-libs/libsdl2",
                     "media-libs/glew",
                     "media-fonts/freefont",
                     "x11-drivers/xf86-input-evdev",
                     "x11-drivers/xf86-input-libinput",
                     "x11-drivers/xf86-input-synaptics",
                     "x11-drivers/xf86-video-vesa",
                     "xfce-base/xfce4-meta",
                     "xfce-extra/xfce4-notifyd",
                     "xfce-extra/xfce4-screensaver",
                     "xfce-extra/xfce4-screenshooter",
                     "xfce-extra/xfce4-cpugraph-plugin",
                     "xfce-extra/xfce4-netload-plugin",
                     "xfce-extra/xfce4-pulseaudio-plugin",
                     "xfce-extra/xfce4-systemload-plugin",
                     "xfce-extra/xfce4-weather-plugin",
                     "xfce-extra/xfce4-xkb-plugin",
                     "app-editors/vim",
                     "app-editors/gvim",
                     "app-editors/nedit",
                     "dev-util/indent",
                     "dev-perl/Perl-Tidy",
                     "sci-visualization/gnuplot",
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
                     "app-doc/doxygen",
                     "app-text/evince",
                     "net-misc/wget",
                     "www-client/firefox",
                     "mail-client/thunderbird",
                     "media-gfx/imagemagick",
                     "media-gfx/gimp",
                     "media-video/mpv",
                     "app-office/libreoffice",
                     "mail-filter/spamassassin"
                    );
        system(@install, "app-emulation/virt-what")
          if (!(-x "/usr/sbin/virt-what"));
        $mach = `virt-what`;
        $mach =~ s/\n//g;
        print "Mach=" . $mach . "\n";

        if ($mach eq "virtualbox")
        {
            push @packages, "app-emulation/virtualbox-guest-additions";
        }
        elsif ($mach eq "kvm")
        {
            push @packages, "x11-drivers/xf86-video-qxl";
            @preinstall = (
                           "echo", "\"VIDEO_CARDS=\\\"virtgl\\\"\"",
                           ">>",   "/etc/portage/make.conf"
                          );
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
    @install = ("pkg", "install");
    @clean   = ("pkg", "autoremove;", "pkg", "clean", "-a");
    @update = (
               "freebsd-update", "fetch;",  "freebsd-update", "install;",
               "pkg",            "update;", "pkg",            "upgrade"
              );
    @upgrade = (
                "freebsd-update", "-r", "13.1-RELEASE", "upgrade;",
                "freebsd-update", "install"
               );
    @packages = (
                 "gsed",                       "patch",
                 "bash",                       "autoconf",
                 "automake",                   "pkgconf",
                 "gcc11",                      "gmake",
                 "git",                        "subversion",
                 "libxml2",                    "gettext-tools",
                 "glib",                       "json-glib",
                 "sqlite3",                    "gsl",
                 "libgtop",                    "gtk3",
                 "gtk4",                       "freeglut",
                 "glfw",                       "sdl2",
                 "freefont-ttf",               "glew",
                 "vulkan-headers",             "vulkan-loader",
                 "vulkan-validation-layers",   "glslang",
                 "mpich",                      "xorg-minimal",
                 "xfce",                       "lightdm",
                 "lightdm-gtk-greeter",        "lightdm-gtk-greeter-settings",
                 "xfce4-screensaver",          "xfce4-cpugraph-plugin",
                 "xfce4-netload-plugin",       "xfce4-systemload-plugin",
                 "xfce4-weather-plugin",       "xfce4-xkb-plugin",
                 "xfce4-terminal",             "xfce4-pulseaudio-plugin",
                 "xfce4-screenshooter-plugin", "vim-gtk3",
                 "nedit",                      "gindent",
                 "p5-Perl-Tidy",               "galculator",
                 "maxima",                     "gdb",
                 "meld",                       "latex-beamer",
                 "graphviz",                   "evince",
                 "doxygen",                    "wget",
                 "firefox-esr",                "thunderbird",
                 "ImageMagick7",               "gimp",
                 "mpv",                        "libreoffice",
                 "es-libreoffice",             "spamassassin"
                );
    @postinstall = ("echo dbus_enable=\"YES\" >> /etc/rc.conf");
    system(@install, "virt-what") if (!(-x "/usr/local/sbin/virt-what"));
    $mach = `virt-what`;
    $mach =~ s/\n//g;
    print "Mach=" . $mach . "\n";

    if ($mach eq "virtualbox")
    {
        push @packages,    "virtualbox-ose-additions";
        push @postinstall, "\necho vboxguest_enable=\"YES\" >> /etc/rc.conf";
        push @postinstall, "\necho vboxservice_enable=\"YES\" >> /etc/rc.conf";
    }
    elsif ($mach eq "kvm")
    {

        #		push @packages,"xf86-video-qxl";
    }
    push @postinstall, "\necho lightdm_enable=\"YES\" >> /etc/rc.conf";
}
elsif ($os eq "NetBSD")
{
    $arch = `uname -m`;
    $arch =~ s/\n//g;
    $ver = `uname -r`;
    $ver =~ s/\n//g;
    print "OS=" . $os . ' ' . $ver . " Arch=" . $arch . "\n";
    @preinstall = (
        "PKG_PATH=\"http://cdn.NetBSD.org/pub/pkgsrc/packages/$os/$arch/$ver/All\"\nPATH=\"/usr/pkg/sbin:\$PATH\"\nexport PATH PKG_PATH"
    );
    @install = ("pkg_add");
    @update  = ("pkgin", "update;", "pkgin", "upgrade");
    @clean   = ("pkgin", "autoremove;", "pkgin", "clean");
    @packages = (
                 "pkgin",                "sysupgrade",
                 "gsed",                 "patch",
                 "bash",                 "autoconf",
                 "automake",             "pkgconf",
                 "gcc12",                "clang",
                 "gmake",                "git",
                 "subversion",           "libxml2",
                 "gettext-tools",        "glib2",
                 "json-glib",            "sqlite3",
                 "gsl",                  "libgtop",
                 "gtk3+",                "gtk4",
                 "freeglut",             "glfw",
                 "SDL2",                 "freefont-ttf",
                 "glew",                 "mpich",
                 "xfce4",                "xfce4-cpugraph-plugin",
                 "xfce4-netload-plugin", "xfce4-systemload-plugin",
                 "xfce4-weather-plugin", "xfce4-xkb-plugin",
                 "xfce4-screenshooter",  "vim-gtk3",
                 "nedit",                "gindent",
                 "p5-Perl-Tidy",         "galculator",
                 "gnuplot",              "maxima",
                 "ddd",                  "meld",
                 "tex-latex",            "tex-pst-pdf",
                 "tex-babel-spanish",    "tex-babel-french",
                 "tex-elsarticle",       "tex-beamer",
                 "tex-adjustbox",        "tex-float",
                 "tex-varwidth",         "tex-fancyvrb",
                 "tex-multirow",         "tex-hanging",
                 "tex-stackengine",      "tex-ulem",
                 "tex-wasysym",          "tex-sectsty",
                 "tex-fancyhdr",         "tex-tocloft",
                 "tex-newunicodechar",   "tex-caption",
                 "tex-etoc",             "tex-alphalph",
                 "tex-ec",               "tex-epstopdf-pkg",
                 "graphviz",             "evince",
                 "doxygen",              "wget",
                 "firefox-esr",          "thunderbird",
                 "ImageMagick",          "gimp",
                 "mpv",                  "libreoffice",
                 "spamassassin"
                );
    system(@install, "virt-what") if (!(-x "/usr/pkg/sbin/virt-what"));
    $mach = `virt-what`;
    $mach =~ s/\n//g;
    print "Mach=" . $mach . "\n";

    if ($mach eq "virtualbox")
    {
        push @packages, "xf86-video-vboxvideo";
    }
}
elsif ($os eq "OpenBSD")
{
    print "OS=" . $os . "\n";
    @install = ("pkg_add");
    @update  = ("syspatch;", "pkg_add", "-u");
    @upgrade = ("sysupgrade");
    @packages = (
                 "gsed",                     "gpatch",
                 "bash",                     "autoconf",
                 "automake",                 "pkgconf",
                 "gcc",                      "gmake",
                 "git",                      "subversion",
                 "libxml",                   "gettext-tools",
                 "glib2",                    "json-glib",
                 "sqlite3",                  "gsl",
                 "libgtop2",                 "gtk+3",
                 "gtk+4",                    "freeglut",
                 "glfw",                     "sdl2",
                 "freefont-ttf",             "glew",
                 "vulkan-headers",           "vulkan-loader",
                 "vulkan-validation-layers", "glslang",
                 "openmpi",                  "xfce",
                 "xfce4-cpugraph",           "xfce4-netload",
                 "xfce4-systemload",         "xfce4-weather",
                 "xfce4-xkb",                "xfce4-pulseaudio",
                 "xfce4-screenshooter",      "vim",
                 "nedit",                    "gindent",
                 "perltidy",                 "galculator",
                 "maxima",                   "ddd",
                 "meld",                     "texlive_texmf-full",
                 "graphviz",                 "evince",
                 "doxygen",                  "wget",
                 "firefox-esr-i18n-es-ES",   "thunderbird-i18n-es-ES",
                 "ImageMagick",              "gimp",
                 "mpv",                      "libreoffice-i18n-es",
                 "milter-spamd"
                );
}
elsif ($os eq "DragonFly")
{
    print "OS=" . $os . "\n";
    @install = ("pkg", "install");
    @clean   = ("pkg", "autoremove;", "pkg", "clean", "-a");
    @update  = ("pkg", "update;", "pkg", "upgrade");
    @packages = (
                 "gsed",                       "patch",
                 "bash",                       "autoconf",
                 "automake",                   "pkgconf",
                 "gcc",                        "gmake",
                 "git-lite",                   "subversion",
                 "libxml2",                    "gettext-tools",
                 "glib",                       "json-glib",
                 "sqlite3",                    "gsl",
                 "libgtop",                    "gtk3",
                 "gtk4",                       "freeglut",
                 "glfw",                       "sdl2",
                 "freefont-ttf",               "glew",
                 "vulkan-headers",             "vulkan-loader",
                 "vulkan-tools",               "glslang",
                 "mpich",                      "xf86-input-keyboard",
                 "xf86-input-mouse",           "xorg-minimal",
                 "xfce",                       "xfce4-screensaver",
                 "xfce4-cpugraph-plugin",      "xfce4-netload-plugin",
                 "xfce4-systemload-plugin",    "xfce4-weather-plugin",
                 "xfce4-xkb-plugin",           "xfce4-terminal",
                 "xfce4-screenshooter-plugin", "vim-gtk3",
                 "nedit",                      "gindent",
                 "p5-Perl-Tidy",               "galculator",
                 "maxima",                     "gdb",
                 "meld",                       "latex-beamer",
                 "graphviz",                   "evince",
                 "doxygen",                    "wget",
                 "firefox-esr",                "thunderbird",
                 "ImageMagick7",               "gimp",
                 "mpv",                        "libreoffice",
                 "es-libreoffice",             "spamassassin"
                );

    #@postinstall=("echo dbus_enable=\"YES\" >> /etc/rc.conf");
    system(@install, "virt-what") if (!(-x "/usr/local/sbin/virt-what"));
    $mach = `virt-what`;
    $mach =~ s/\n//g;
    print "Mach=" . $mach . "\n";

    #push @postinstall,"\necho lightdm_enable=\"YES\" >> /etc/rc.conf";
}
elsif ($os eq "SunOS")
{
    print "OS=" . $os . " ";
    $dist = `uname -v`;
    $dist =~ s/\n//g;
    print "Dist=OpenIndiana\n";
    @install = ("pkg",   "install");
    @clean   = ("beadm", "list");
    @update  = ("pkg",   "update;", "/opt/csw/bin/pkgutil", "-U", "-u", "-y");
    system("pkg", "install", "mate_install")
      if (!(-x "/usr/bin/mate-session"));
    system("pkg", "install", "wget") if (!(-x "/usr/bin/wget"));
    system("wget", "http://mirror.opencsw.org/opencsw/pkgutil.pkg")
      if (!(-f "pkgutil.pkg"));
    system("pkgadd", "-d", "pkgutil.pkg", "all")
      if (!(-x "/opt/csw/bin/pkgutil"));
    @packages = (
                 "gnu-patch",   "gnu-sed",
                 "autoconf",    "automake",
                 "pkg-config",  "gcc-7",
                 "gcc-11",      "developer/clang-13",
                 "git",         "developer/versioning/subversion",
                 "gettext",     "json-glib",
                 "gsl",         "library/mpich/gcc",
                 "gtk3",        "libglew",
                 "freeglut",    "sdl2",
                 "gnome-fonts", "mate_install",
                 "gvim",        "gnu-indent",
                 "gnuplot",     "meld",
                 "evince",      "doxygen",
                 "wget",        "firefox",
                 "thunderbird", "imagemagick",
                 "gimp",        "gnumeric",
                 "libreoffice"
                );
    @postinstall = ("export PATH=\$PATH:/opt/csw/bin");
    push(@postinstall, "\npkgutil -U");
    push(@postinstall, "\npkgutil --install");
    push(@postinstall, "perltidy");
    push(@postinstall, "texlive");
    push(@postinstall, "texlive_latex_extra");
    push(@postinstall, "texlive_luatex");
    push(@postinstall, "texlive_publishers");
    push(@postinstall, "texlive_fonts_recommended");
    push(@postinstall, "texlive_lang_spanish");
    push(@postinstall, "texlive_lang_french");
    push(@postinstall, "texlive_lang_italian");
    push(@postinstall, "texlive_pstricks");
    push(@postinstall, "graphviz");
}
elsif ($os eq "GNU")
{
    print "OS=" . $os . "\n";
    @install = ("apt", "install");
    @clean   = ("apt", "autoremove;", "apt", "clean");
    @update  = ("apt", "update");
    @upgrade = ("apt", "upgrade");
    @packages = (
                 "patch",                     "autoconf",
                 "automake",                  "pkg-config",
                 "g++",                       "gfortran",
                 "clang",                     "make",
                 "git",                       "subversion",
                 "libxml2-dev",               "libglib2.0-dev",
                 "libjson-glib-dev",          "gettext",
                 "libsqlite3-dev",            "libgsl-dev",
                 "libgtop2-dev",              "libgtk-3-dev",
                 "libgtk-4-dev",              "freeglut3-dev",
                 "libglfw3-dev",              "libsdl2-dev",
                 "fonts-freefont-otf",        "glslang-tools",
                 "libglew-dev",               "mpich",
                 "libmpich-dev",              "xserver-xorg-input-kbd",
                 "xserver-xorg-input-mouse",  "xserver-xorg-video-vesa",
                 "xorg",                      "xfce4",
                 "xfce4-screensaver",         "xfce4-weather-plugin",
                 "xfce4-xkb-plugin",          "xfce4-terminal",
                 "gstreamer1.0-plugins-good", "gstreamer1.0-pulseaudio",
                 "xfce4-pulseaudio-plugin",   "xfce4-screenshooter",
                 "nedit",                     "vim-gtk3",
                 "indent",                    "perltidy",
                 "galculator",                "ddd",
                 "meld",                      "texlive-latex-extra",
                 "texlive-luatex",            "texlive-publishers",
                 "texlive-fonts-recommended", "texlive-lang-spanish",
                 "texlive-lang-french",       "texlive-lang-english",
                 "texlive-lang-italian",      "texlive-pstricks",
                 "graphviz",                  "evince",
                 "doxygen",                   "wget",
                 "imagemagick",               "gimp"
                );
    system(@install, "virt-what") if (!(-x "/usr/sbin/virt-what"));
    $mach = `virt-what`;
    $mach =~ s/\n//g;
    print "Mach=" . $mach . "\n";

    if ($mach eq "kvm")
    {
        push @packages, "xserver-xorg-video-qxl";
    }
}
elsif ($os eq "Haiku")
{
    print "OS=" . $os . "\n";
    @install = ("pkgman", "install");
    @update  = ("pkgman", "full-sync");
    @packages = (
                 "patch",           "autoconf",
                 "automake",        "pkgconfig",
                 "gcc",             "gcc_fortran",
                 "llvm12_clang",    "make",
                 "git",             "subversion",
                 "libxml2_devel",   "glib2_devel",
                 "json_glib_devel", "gettext",
                 "sqlite_devel",    "gsl_devel",
                 "gtk3_devel",      "glfw_devel",
                 "libsdl2_devel",   "glew_devel",
                 "vim",             "indent",
                 "gdb",             "texlive_core",
                 "graphviz",        "gnuplot",
                 "doxygen",         "wget",
                 "imagemagick",     "gimp",
                 "epiphany"
                );
}
elsif ($os eq "Darwin")
{
    print "OS=" . $os . "\n";
    @install     = ("brew", "install");
    @installcask = ("brew", "install");
    @clean       = ("brew", "cleanup;", "brew", "cleanup", "cask");
    @update      = ("brew", "update");
    @upgrade = ("brew", "upgrade;", "brew", "upgrade", "--cask", "--greedy");
    system(
        "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)\""
      )
      if (!(-x "/usr/local/bin/brew"));
    @packagescask = (
                     "xquartz",       "homebrew/cask-fonts/font-open-sans",
                     "macvim",        "meld",
                     "mactex-no-gui", "firefox",
                     "thunderbird",   "gimp",
                     "libreoffice"
                    );
    @preinstall = ("@installcask @packagescask");
    @packages = (
                 "gnu-sed",    "gpatch",
                 "autoconf",   "automake",
                 "pkg-config", "gcc",
                 "llvm@13",    "make",
                 "git",        "subversion",
                 "libxml2",    "gettext",
                 "glib",       "json-glib",
                 "sqlite",     "gsl",
                 "libgtop",    "gtk+3",
                 "gtk4",       "freeglut",
                 "glfw",       "sdl2",
                 "glew",       "glslang",
                 "mpich",      "font-open-sans",
                 "nedit",      "gnu-indent",
                 "perltidy",   "maxima",
                 "ddd",        "graphviz",
                 "evince",     "doxygen",
                 "wget",       "imagemagick",
                 "mpv"
                );
}
else
{
    $os = `uname -o`;
    $os =~ s/\n//g;
    $mach = `uname -m`;
    $mach =~ s/\n//g;
    print "OS=" . $os . " Mach=" . $mach . "\n";
    if ($os eq "Msys")
    {
        @install = ("pacman", "-S");
        @clean   = ("pacman", "-Sc");
        @update  = ("pacman", "-Syu");
        if ($mach eq "x86_64")
        {
            $mingw = "mingw64/mingw-w64-x86_64-";
        }
        elsif ($mach eq "i686")
        {
            $mingw = "mingw32/mingw-w64-i686-";
        }
        @packages = (
                     "zip",
                     "xz",
                     "tar",
                     "unzip",
                     "patch",
                     "autoconf",
                     "automake",
                     "make",
                     $mingw . "gcc",
                     $mingw . "gcc-fortran",
                     $mingw . "clang",
                     "pkgconf",
                     "git",
                     "subversion",
                     $mingw . "libxml2",
                     $mingw . "glib2",
                     $mingw . "json-glib",
                     $mingw . "sqlite3",
                     $mingw . "gsl",
                     $mingw . "gettext",
                     $mingw . "gtk3",
                     $mingw . "gtk4",
                     $mingw . "freeglut",
                     $mingw . "glfw",
                     $mingw . "SDL2",
                     $mingw . "glew",
                     $mingw . "vulkan-loader",
                     $mingw . "vulkan-headers",
                     $mingw . "vulkan-validation-layers",
                     $mingw . "glslang",
                     "vim",
                     $mingw . "indent",
                     $mingw . "gdb",
                     $mingw . "meld3",
                     $mingw . "texlive-core",
                     $mingw . "texlive-luatex",
                     $mingw . "texlive-latex-extra",
                     $mingw . "texlive-fonts-recommended",
                     $mingw . "texlive-fonts-extra",
                     $mingw . "texlive-publishers",
                     $mingw . "texlive-pstricks",
                     $mingw . "texlive-lang-spanish",
                     $mingw . "texlive-lang-french",
                     $mingw . "texlive-lang-english",
                     $mingw . "texlive-lang-italian",
                     $mingw . "graphviz",
                     $mingw . "evince",
                     "doxygen",
                     "wget",
                     $mingw . "imagemagick",
                     $mingw . "gimp"
                    );
    }
    elsif ($os eq "Cygwin")
    {
        if ($mach eq "x86_64")
        {
            @install = ("/sbin/setup-x86_64.exe", "--quiet-mode");
            if (!(-x $install[0]))
            {
                print "Error!\nYou have to copy the installation program "
                  . "(setup-86_64.exe) in /sbin\n";
                exit 1;
            }
        }
        elsif ($mach eq "i686")
        {
            @install = ("/sbin/setup-x86.exe", "--quiet-mode");
            if (!(-x $install[0]))
            {
                print "Error!\nYou have to copy the installation program "
                  . "(setup-86.exe) in /sbin\n";
                exit 1;
            }
        }
        @update = (@install, "--upgrade-also");
        @packages = (
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
                     "-P parole"
                    );
    }
    else
    {
        print "Unsupported operative system\n";
    }
}
if (@install)
{
    open(INSTALL, ">install.sh");
    if (@preinstall)
    {
        print INSTALL "@preinstall\n";
    }
    print INSTALL "@install @packages\n";
    print INSTALL "@postinstall\n" if (@postinstall);
    close(INSTALL);
}
if (@clean)
{
    open(CLEAN, ">clean.sh");
    print CLEAN "@clean\n";
    close(CLEAN);
}
if (@update)
{
    open(UPDATE, ">update.sh");
    print UPDATE "@update\n";
    close(UPDATE);
}
if (@upgrade)
{
    open(UPGRADE, ">upgrade.sh");
    print UPGRADE "@upgrade\n";
    close(UPGRADE);
}
