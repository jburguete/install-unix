#!/usr/bin/env perl

#Supported systems
#Alpine Linux
#Arch Linux
#Bianbu Linux 3.0
#Debian Hurd 14
#Debian Linux 13
#Devuan Linux 6
#Dragonfly BSD 6.4
#Fedora Linux 43
#FreeBSD 14.3
#Gentoo Linux
#Haiku
#Linux Mint DE 7
#MacOS Sequoia + Homebrew
#Manjaro Linux
#Microsoft Windows + MSYS2
#NetBSD 10.1
#OpenBSD 7.8
#OpenIndiana Hipster
#OpenSUSE Leap Linux 16.0
#RedoxOS 0.9
#Xubuntu Linux 25.10

#GCC versions
#14 Alpine Linux
#15 Arch Linux
#14 Bianbu Linux
#15 Debian Hurd
#14 Debian Linux
#14 Devuan Linux
#14 Dragonfly BSD
#15 Fedora Linux
#14 FreeBSD
#14 Gentoo Linux
#13 Haiku
#14 Linux Mint
#15 MacOS Sequoia + Homebrew
#14 Manjaro Linux
#15 Microsoft Windows + MSYS2
#14 NetBSD
#11 OpenBSD
#14 OpenIndiana
#15 OpenSUSE Linux
#13 RedoxOS
#14 Xubuntu Linux

#CLang versions
#20 Alpine Linux
#19 Arch Linux
#20 Bianbu Linux
#19 Debian Hurd
#19 Debian Linux
#19 Devuan Linux
#18 Dragonfly BSD
#21 Fedora Linux
#19 FreeBSD
#20 Gentoo Linux
#18 Haiku
#19 Linux Mint
#21 MacOS Sequoia + Homebrew
#19 Manjaro Linux
#20 Microsoft Windows + MSYS2
#18 NetBSD
#19 OpenBSD
#19 OpenIndiana
#19 OpenSUSE Linux
#-  RedoxOS
#20 Xubuntu Linux

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
        elsif (-x "/sbin/apk")
        {
            system("apk add lsb-release-minimal");
        }
    }
    $dist = `lsb_release -i -s`;
    $dist =~ s/\n//g;
    print "OS=" . $os . " Dist=" . $dist . "\n";
    if ($dist eq "Debian" || $dist eq "Devuan")
    {
        system("apt", "install", "aptitude")
          if (!(-x "/usr/bin/aptitude"));
        @install = ("apt", "install");
        @clean   = ("apt", "autoremove", "--clean;", "apt", "clean");
        @update  = ("apt", "update");
        @upgrade = ("apt", "upgrade");
        @find    = ("apt", "search");
        @packages = (
                     "patch",
                     "autoconf",
                     "automake",
                     "pkg-config",
                     "g++",
                     "gfortran",
                     "clang",
                     "llvm",
                     "make",
                     "meson",
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
                     "libgtk-4-dev",
                     "libglfw3-dev",
                     "libsdl2-dev",
                     "libsdl3-dev",
                     "fonts-freefont-otf",
                     "libglew-dev",
                     "glslang-tools",
                     "vulkan-validationlayers",
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
                     "gstreamer1.0-plugins-good",
                     "gstreamer1.0-pulseaudio",
                     "xfce4-pulseaudio-plugin",
                     "xfce4-screenshooter",
                     "nedit",
                     "vim-gtk3",
                     "indent",
                     "perltidy",
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
                     "latexdiff",
                     "evince",
                     "doxygen",
                     "wget",
                     "firefox-esr",
                     "firefox-esr-l10n-es-es",
                     "webext-ublock-origin-firefox",
                     "thunderbird",
                     "thunderbird-l10n-es-es",
                     "imagemagick",
                     "gimp",
                     "mpv",
                     "gnumeric",
                     "libreoffice",
                     "libreoffice-l10n-es",
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
    elsif ($dist eq "Linuxmint")
    {
        system("apt", "install", "aptitude")
          if (!(-x "/usr/bin/aptitude"));
        @install = ("apt", "install");
        @clean   = ("apt", "autoremove", "--clean;", "apt", "clean");
        @update  = ("apt", "update");
        @upgrade = ("apt", "upgrade");
        @find    = ("apt", "search");
        @packages = (
                     "patch",
                     "autoconf",
                     "automake",
                     "pkg-config",
                     "g++",
                     "gfortran",
                     "clang",
                     "make",
                     "meson",
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
                     "libgtk-4-dev",
                     "libglfw3-dev",
                     "libsdl2-dev",
                     "libsdl3-dev",
                     "fonts-freefont-otf",
                     "libglew-dev",
                     "glslang-tools",
                     "mpich",
                     "libmpich-dev",
                     "vim-gtk3",
                     "indent",
                     "perltidy",
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
                     "latexdiff",
                     "evince",
                     "doxygen",
                     "wget",
                     "firefox-esr",
                     "firefox-esr-l10n-es-es",
                     "webext-ublock-origin-firefox",
                     "thunderbird",
                     "thunderbird-l10n-es-es",
                     "imagemagick",
                     "gimp",
                     "mpv",
                     "gnumeric",
                     "libreoffice",
                     "libreoffice-l10n-es",
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
    elsif ($dist eq "Ubuntu")
    {
        system("sudo", "apt", "install", "aptitude")
          if (!(-x "/usr/bin/aptitude"));
        @install = ("apt", "install");
        @clean   = ("apt", "autoremove", "--clean;", "apt", "clean");
        @update  = ("apt", "update");
        @upgrade = ("apt", "upgrade");
        @find    = ("apt", "search");
        @packages = (
                     "patch",
                     "autoconf",
                     "automake",
                     "pkg-config",
                     "g++",
                     "gfortran",
                     "clang",
                     "make",
                     "meson",
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
                     "libgtk-4-dev",
                     "libglfw3-dev",
                     "libsdl2-dev",
                     "libsdl3-dev",
                     "fonts-freefont-otf",
                     "libglew-dev",
                     "glslang-tools",
                     "mpich",
                     "libmpich-dev",
                     "nedit",
                     "vim-gtk3",
                     "indent",
                     "perltidy",
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
                     "latexdiff",
                     "evince",
                     "doxygen",
                     "wget",
                     "firefox",
                     "firefox-locale-es",
                     "webext-ublock-origin-firefox",
                     "thunderbird",
                     "thunderbird-locale-es",
                     "imagemagick",
                     "gimp",
                     "mpv",
                     "gnumeric",
                     "libreoffice",
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
        @clean   = ("pacman", "-Rs", "\$(pacman", "-Qdtq);", "pacman", "-Scc");
        @update  = ("pacman", "-Syu");
        @find    = ("pacman", "-Ss");
        @packages = (
                     "patch",                   "autoconf",
                     "automake",                "pkgconf",
                     "gcc",                     "gcc-fortran",
                     "clang",                   "llvm",
                     "make",                    "meson",
                     "git",                     "subversion",
                     "libxml2",                 "glib2",
                     "json-glib",               "sqlite",
                     "gsl",                     "libgtop",
                     "gtk3",                    "gtk4",
                     "glfw-x11",                "sdl2",
                     "sdl3",                    "gnu-free-fonts",
                     "glew",                    "vulkan-headers",
                     "openmpi",                 "xfce4-screensaver",
                     "xfce4-cpugraph-plugin",   "xfce4-netload-plugin",
                     "xfce4-systemload-plugin", "xfce4-weather-plugin",
                     "xfce4-xkb-plugin",        "xfce4-pulseaudio-plugin",
                     "gvim",                    "indent",
                     "perl-tidy",               "galculator",
                     "maxima",                  "valgrind",
                     "gdb",                     "meld",
                     "texlive-core",            "texlive-fontsrecommended",
                     "texlive-latexextra",      "texlive-publishers",
                     "texlive-pstricks",        "texlive-luatex",
                     "texlive-langspanish",     "texlive-langfrench",
                     "graphviz",                "texlive-binextra",
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
        @clean   = ("pacman", "-Rs", "\$(pacman", "-Qdtq);", "pacman", "-Scc");
        @update  = ("pacman", "-Sy", "archlinux-keyrng;", "pacman", "-Syu");
        @find    = ("pacman", "-Ss");
        @packages = (
                     "patch",                    "autoconf",
                     "automake",                 "pkgconf",
                     "gcc",                      "gcc-fortran",
                     "clang",                    "make",
                     "meson",                    "git",
                     "subversion",               "libxml2",
                     "glib2",                    "json-glib",
                     "sqlite",                   "gsl",
                     "libgtop",                  "gtk3",
                     "gtk4",                     "glfw-x11",
                     "sdl2",                     "sdl3",
                     "gnu-free-fonts",           "glew",
                     "vulkan-headers",           "openmpi",
                     "xf86-video-vesa",          "xorg-server",
                     "pulseaudio",               "pulseaudio-alsa",
                     "pavucontrol",              "xfce4",
                     "lightdm",                  "lightdm-gtk-greeter",
                     "xfce4-screensaver",        "xfce4-cpugraph-plugin",
                     "xfce4-netload-plugin",     "xfce4-systemload-plugin",
                     "xfce4-weather-plugin",     "xfce4-xkb-plugin",
                     "xfce4-pulseaudio-plugin",  "gvim",
                     "indent",                   "perl-tidy",
                     "galculator",               "maxima",
                     "valgrind",                 "gdb",
                     "meld",                     "texlive-core",
                     "texlive-fontsrecommended", "texlive-latexextra",
                     "texlive-publishers",       "texlive-pstricks",
                     "texlive-luatex",           "texlive-langspanish",
                     "texlive-langfrench",       "graphviz",
                     "texlive-binextra",         "evince",
                     "doxygen",                  "wget",
                     "firefox",                  "firefox-i18n-es-es",
                     "firefox-ublock-origin",    "thunderbird",
                     "thunderbird-i18n-es-es",   "imagemagick",
                     "gimp",                     "mpv",
                     "libreoffice-still",        "libreoffice-still-es",
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
                    "--releasever",   "42;",
                    "dnf",            "system-upgrade",
                    "reboot"
                   );
        @find       = ("dnf", "search");
        @preinstall = "dnf group install gnome-desktop"
          if (!(-x "/usr/bin/gnome-shell"));
        @packages = (
                 "dnf-plugin-system-upgrade",     "patch",
                 "autoconf",                      "automake",
                 "pkgconf",                       "gcc",
                 "gcc-c++",                       "gcc-gfortran",
                 "clang",                         "make",
                 "meson",                         "git",
                 "subversion",                    "libxml2-devel",
                 "glib-devel",                    "gettext-devel",
                 "json-glib-devel",               "sqlite-devel",
                 "gsl-devel",                     "libgtop2-devel",
                 "gtk3-devel",                    "gtk4-devel",
                 "glfw-devel",                    "SDL2-devel",
                 "SDL3-devel",                    "texlive-gnu-freefont",
                 "glew-devel",                    "vulkan-headers",
                 "vulkan-loader",                 "vulkan-validation-layers",
                 "vulkan-tools",                  "glslang",
                 "mpich-devel",                   "nedit",
                 "vim-enhanced",                  "vim-X11",
                 "indent",                        "perltidy",
                 "maxima-gui",                    "valgrind",
                 "ddd",                           "meld",
                 "texlive",                       "texlive-latex",
                 "texlive-collection-publishers", "texlive-collection-pstricks",
                 "texlive-newunicodechar",        "texlive-hanging",
                 "texlive-stackengine",           "graphviz",
                 "texlive-latexdiff",             "evince",
                 "doxygen",                       "wget",
                 "firefox",                       "mozilla-ublock-origin",
                 "thunderbird",                   "ImageMagick",
                 "gimp",                          "ufraw-gimp",
                 "totem",                         "libreoffice",
                 "libreoffice-langpack-es",       "spamassassin"
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
        @find    = ("zypper", "search");
        @upgrade = (
                    "zypper",            "--releasever=16.0",
                    "refresh;",          "zypper",
                    "--releasever=16.0", "dup"
                   );
        @packages = (
                     "patch",                         "autoconf",
                     "automake",                      "pkg-config",
                     "gcc",                           "gcc-c++",
                     "gcc-fortran",                   "clang",
                     "llvm",                          "make",
                     "git-core",                      "subversion",
                     "libxml2-devel",                 "glib2-devel",
                     "gettext-tools",                 "json-glib-devel",
                     "sqlite3-devel",                 "gsl-devel",
                     "libgtop-devel",                 "gtk3-devel",
                     "gtk4-devel",                    "libglfw-devel",
                     "SDL2-devel",                    "SDL3-devel",
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
        @install    = ("emerge", "--ask");
        @preinstall = ("USE=\"gimp -vaapi\"", @install, "media-libs/mesa");
        @clean = (
                  "emerge",      "--ask",
                  "--depclean",  ";",
                  "eclean-dist", "--deep",
                  ";",           "eclean-kernel",
                  "-n",          "2",
                  ";",           "rm",
                  "/var/cache/distfiles/*"
                 );
        @update = ("emerge", "--sync");
        @upgrade = (
                    "emerge",         "--ask",
                    "--update",       "--deep",
                    "--with-bdeps=y", "--newuse",
                    "\@world"
                   );
        @find = ("emerge", "--search");
        @packages = (
                     "app-portage/gentoolkit",
                     "app-admin/eclean-kernel",
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
                     "media-libs/glfw",
                     "media-libs/libsdl2",
                     "media-libs/libsdl3",
                     "media-libs/glew",
                     "media-libs/vulkan-layers",
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
                     "dev-tex/latexdiff",
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
    elsif ($dist eq "Bianbu")
    {
        system("apt", "install", "aptitude")
          if (!(-x "/usr/bin/aptitude"));
        @install = ("apt", "install");
        @clean   = ("apt", "autoremove", "--clean;", "apt", "clean");
        @update  = ("apt", "update");
        @upgrade = ("apt", "upgrade");
        @find    = ("apt", "search");
        @packages = (
                     "autoconf",
                     "clang",
                     "git",
                     "subversion",
                     "libglib2.0-dev",
                     "libjson-glib-dev",
                     "libsqlite3-dev",
                     "libgsl-dev",
                     "libgtop2-dev",
                     "libgtk-3-dev",
                     "libgtk-4-dev",
                     "libglfw3-dev",
                     "libsdl2-dev",
                     "libsdl3-dev",
                     "fonts-freefont-otf",
                     "libglew-dev",
                     "glslang-tools",
                     "mpich",
                     "vim-gtk3",
                     "indent",
                     "perltidy",
                     "galculator",
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
                     "latexdiff",
                     "doxygen",
                     "webext-ublock-origin-chromium",
                     "imagemagick",
                     "gimp",
                     "gnumeric",
                     "libreoffice",
                     "libreoffice-l10n-es",
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
    elsif ($dist eq "Alpine")
    {
        @install = ("apk", "add");
        @update  = ("apk", "update");
        @upgrade = ("apk", "upgrade");
        @find    = ("apk", "search");
        @packages = (
                     "patch",         "autoconf",
                     "automake",      "g++",
                     "gfortran",      "clang",
                     "make",          "meson",
                     "git",           "subversion",
                     "libxml2-dev",   "glib-dev",
                     "json-glib-dev", "gsl-dev",
                     "libgtop-dev",   "gtk+3.0-dev",
                     "gtk4.0-dev",    "glfw-dev",
                     "sdl2-dev",      "sdl3-dev",
                     "font-freefont", "glew-dev",
                     "glslang",       "openmpi-dev",
                     "gvim",          "indent",
                     "perl-tidy",     "gnuplot",
                     "galculator",    "valgrind",
                     "gdb",           "meld",
                     "texlive-most",  "texlive-binextra",
                     "graphviz",      "doxygen",
                     "ublock-origin", "thunderbird",
                     "imagemagick",   "gimp",
                     "mpv",           "gnumeric",
                     "libreoffice",   "spamassassin"
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
            push @packages, "qemu-guest-agent";
            push @packages, "xf86-video-qxl";
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
                "freebsd-update", "-r", "14.3-RELEASE", "upgrade;",
                "freebsd-update", "install"
               );
    @find = ("pkg", "search");
    @packages = (
                 "utouch-kmod",                  "gsed",
                 "patch",                        "bash",
                 "autoconf",                     "automake",
                 "pkgconf",                      "gcc14",
                 "gmake",                        "meson",
                 "git",                          "subversion",
                 "libxml2",                      "gettext-tools",
                 "glib",                         "json-glib",
                 "sqlite3",                      "gsl",
                 "libgtop",                      "gtk3",
                 "gtk4",                         "glfw",
                 "sdl2",                         "sdl3",
                 "freefont-ttf",                 "glew",
                 "vulkan-headers",               "vulkan-loader",
                 "vulkan-validation-layers",     "glslang",
                 "mpich",                        "xf86-input-evdev",
                 "xorg-minimal",                 "xfce",
                 "lightdm",                      "lightdm-gtk-greeter",
                 "lightdm-gtk-greeter-settings", "xfce4-screensaver",
                 "xfce4-cpugraph-plugin",        "xfce4-netload-plugin",
                 "xfce4-systemload-plugin",      "xfce4-weather-plugin",
                 "xfce4-xkb-plugin",             "xfce4-terminal",
                 "xfce4-pulseaudio-plugin",      "xfce4-screenshooter-plugin",
                 "vim-gtk3",                     "nedit",
                 "gindent",                      "p5-Perl-Tidy",
                 "galculator",                   "maxima",
                 "gdb",                          "valgrind",
                 "meld",                         "latex-beamer",
                 "graphviz",                     "tex-dvipsk",
                 "evince",                       "latexdiff",
                 "doxygen",                      "wget",
                 "firefox-esr",                  "thunderbird",
                 "ImageMagick7",                 "gimp",
                 "mpv",                          "libreoffice",
                 "es-libreoffice",               "spamassassin"
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
        push @postinstall, "\necho webcamd_enable=\"YES\" >> /etc/rc.conf;";
        push @postinstall, "\necho utouch_load=\"YES\" >> /boot/loader.conf";

        #push @packages,"xf86-video-qxl";
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
    @update = (
               "sysupgrade", "auto",
               "http://cdn.NetBSD.org/pub/$os/$os-$ver/$arch;",
               "pkgin", "update;", "pkgin", "upgrade"
              );
    @clean = ("pkgin", "autoremove;", "pkgin", "clean");
    @find  = ("pkgin", "search");
    @packages = (
                 "pkgin",
                 "sysupgrade",
                 "gsed",
                 "patch",
                 "bash",
                 "autoconf",
                 "automake",
                 "pkgconf",
                 "gcc14",
                 "clang",
                 "gmake",
                 "meson",
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
                 "gtk4",
                 "glfw",
                 "SDL2",
                 "SDL3",
                 "freefont-ttf",
                 "glew",
                 "mpich",
                 "xfce4",
                 "xfce4-cpugraph-plugin",
                 "xfce4-netload-plugin",
                 "xfce4-systemload-plugin",
                 "xfce4-weather-plugin",
                 "xfce4-xkb-plugin",
                 "xfce4-screenshooter",
                 "vim-gtk3",
                 "nedit",
                 "gindent",
                 "p5-Perl-Tidy",
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
                 "tex-alphalph",
                 "tex-ec",
                 "tex-epstopdf-pkg",
                 "tex-multido",
                 "tex-listings",
                 "tex-luatex85",
                 "tex-trimspaces",
                 "tex-babel-english",
                 "texlive-collection-english",
                 "texlive-collection-langspanish",
                 "texlive-collection-langfrench",
                 "graphviz",
                 "tex-latexdiff",
                 "evince",
                 "doxygen",
                 "wget",
                 "firefox-esr",
                 "thunderbird",
                 "ImageMagick",
                 "gimp",
                 "mpv",
                 "libreoffice",
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
    @find    = ("pkg_info", "-aQ");
    @packages = (
                 "gsed",                   "gpatch",
                 "bash",                   "autoconf",
                 "automake",               "pkgconf",
                 "gcc",                    "llvm",
                 "gmake",                  "meson",
                 "git",                    "subversion",
                 "libxml",                 "gettext-tools",
                 "glib2",                  "json-glib",
                 "sqlite3",                "gsl",
                 "libgtop2",               "gtk+3",
                 "gtk+4",                  "glfw",
                 "sdl2",                   "freefont-ttf",
                 "glew",                   "vulkan-headers",
                 "vulkan-loader",          "vulkan-validation-layers",
                 "glslang",                "openmpi",
                 "xfce",                   "xfce4-cpugraph",
                 "xfce4-netload",          "xfce4-systemload",
                 "xfce4-weather",          "xfce4-xkb",
                 "xfce4-pulseaudio",       "xfce4-screenshooter",
                 "vim",                    "nedit",
                 "gindent",                "perltidy",
                 "galculator",             "maxima",
                 "ddd",                    "valgrind",
                 "meld",                   "texlive_texmf-full",
                 "graphviz",               "evince",
                 "doxygen",                "wget",
                 "firefox-esr-i18n-es-ES", "thunderbird-i18n-es-ES",
                 "ImageMagick",            "gimp",
                 "mpv",                    "libreoffice-i18n-es",
                 "milter-spamd"
                );
    system(@install, "virt-what") if (!(-x "/usr/pkg/sbin/virt-what"));
    $mach = `virt-what`;
    $mach =~ s/\n//g;
    print "Mach=" . $mach . "\n";
}
elsif ($os eq "DragonFly")
{
    print "OS=" . $os . "\n";
    @install = ("pkg", "install");
    @clean   = ("pkg", "autoremove;", "pkg", "clean", "-a");
    @update  = ("pkg", "update;",     "pkg", "upgrade");
    @find    = ("pkg", "search");
    @packages = (
                 "gsed",                       "patch",
                 "bash",                       "autoconf",
                 "automake",                   "pkgconf",
                 "gcc12",                      "llvm16",
                 "gmake",                      "meson",
                 "git-lite",                   "subversion",
                 "libxml2",                    "gettext-tools",
                 "glib",                       "json-glib",
                 "sqlite3",                    "gsl",
                 "libgtop",                    "gtk3",
                 "gtk4",                       "glfw",
                 "sdl2",                       "sdl3",
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
                 "valgrind",                   "meld",
                 "latex-beamer",               "graphviz",
                 "evince",                     "doxygen",
                 "wget",                       "firefox-esr",
                 "thunderbird",                "ImageMagick7",
                 "gimp",                       "mpv",
                 "libreoffice",                "es-libreoffice",
                 "spamassassin"
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
    $pkg     = "/var/pkg/publisher/openindiana.org/file/*;";
    @install = ("pkg", "install");
    @clean   = ("rm",  "-rf", $pkg, "beadm", "list", "-a");
    @update  = ("pkg", "update;");
    @find    = ("pkg", "search");
    system("pkg", "install", "mate_install")
      if (!(-x "/usr/bin/mate-session"));
    @packages = (
                 "gnu-patch",                       "gnu-sed",
                 "autoconf",                        "automake",
                 "pkg-config",                      "gcc-14",
                 "developer/clang-19",              "developer/build/meson",
                 "ninja",                           "git",
                 "developer/versioning/subversion", "gettext",
                 "json-glib",                       "gsl",
                 "library/mpich/gcc",               "gtk3",
                 "gtk4",                            "libglew",
                 "sdl2",                            "sdl3",
                 "valgrind",                        "gnome-fonts",
                 "mate_install",                    "gvim",
                 "gnu-indent",                      "perl-tidy",
                 "gnuplot",                         "meld",
                 "evince",                          "doxygen",
                 "wget",                            "firefox",
                 "thunderbird",                     "imagemagick",
                 "gimp",                            "gnumeric",
                 "libreoffice"
                );
    $tlf = "install-tl-unx.tar.gz";
    system("wget", "http://mirror.ctan.org/systems/texlive/tlnet/" . $tlf)
      if (!(-f $tlf));
    $tld = "install-tl-20231015";
    system("tar", "xf", $tlf) if (!(-d $tld));
    system("echo", "cd", $tld . ";", "./install-tl");
}
elsif ($os eq "GNU")
{
    print "OS=" . $os . "\n";
    system("apt", "install", "aptitude")
      if (!(-x "/usr/bin/aptitude"));
    @install = ("apt", "install");
    @clean   = ("apt", "autoremove", "--purge;", "apt", "clean");
    @update  = ("apt", "update");
    @upgrade = ("apt", "upgrade");
    @find    = ("apt", "search");
    @packages = (
                 "patch",                   "autoconf",
                 "automake",                "pkg-config",
                 "g++",                     "gfortran",
                 "clang",                   "make",
                 "git",                     "subversion",
                 "libxml2-dev",             "libglib2.0-dev",
                 "libjson-glib-dev",        "gettext",
                 "libsqlite3-dev",          "libgsl-dev",
                 "libgtop2-dev",            "libgtk-3-dev",
                 "libgtk-4-dev",            "libglfw3-dev",
                 "libsdl2-dev",             "fonts-freefont-otf",
                 "glslang-tools",           "libglew-dev",
                 "mpich",                   "libmpich-dev",
                 "xserver-xorg-input-kbd",  "xserver-xorg-input-mouse",
                 "xserver-xorg-video-vesa", "xorg",
                 "xfce4",                   "xfce4-screensaver",
                 "xfce4-weather-plugin",    "xfce4-xkb-plugin",
                 "xfce4-terminal",          "gstreamer1.0-plugins-good",
                 "gstreamer1.0-pulseaudio", "xfce4-pulseaudio-plugin",
                 "xfce4-screenshooter",     "nedit",
                 "vim-gtk3",                "indent",
                 "perltidy",                "galculator",
                 "ddd",                     "meld",
                 "texlive-latex-extra",     "texlive-luatex",
                 "texlive-publishers",      "texlive-fonts-recommended",
                 "texlive-lang-spanish",    "texlive-lang-french",
                 "texlive-lang-english",    "texlive-lang-italian",
                 "texlive-pstricks",        "graphviz",
                 "latexdiff",               "evince",
                 "doxygen",                 "wget",
                 "imagemagick",             "gimp"
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
    @find    = ("pkgman", "search");
    @packages = (
                 "patch",                    "autoconf",
                 "automake",                 "pkgconfig",
                 "gcc",                      "gcc_fortran",
                 "llvm18_clang",             "make",
                 "meson",                    "git",
                 "subversion",               "libxml2_devel",
                 "glib2_devel",              "json_glib_devel",
                 "gettext",                  "sqlite_devel",
                 "gsl_devel",                "gtk3_devel",
                 "gtk4_devel",               "glfw_devel",
                 "libsdl2_devel",            "libsdl3_devel",
                 "glew_devel",               "vulkan_devel",
                 "glslang",                  "vim",
                 "indent",                   "gnuplot",
                 "tk",                       "sbcl",
                 "maxima",                   "gdb",
                 "texlive",                  "texlive_latexextra",
                 "texlive_luatex",           "texlive_publishers",
                 "texlive_fontsrecommended", "texlive_langspanish",
                 "texlive_langfrench",       "texlive_langenglish",
                 "texlive_langitalian",      "texlive_pstricks",
                 "graphviz",                 "texlive_binextra",
                 "gnuplot",                  "doxygen",
                 "wget",                     "imagemagick",
                 "gimp",                     "epiphany"
                );
}
elsif ($os eq "Redox")
{
    print "OS=" . $os . "\n";
    @install = ("pkg", "install");
    @update  = ("pkg", "update");
    @find    = ("pkg", "search");
    @packages = (
                 "sed",      "patch",   "pkg-conf", "autoconf",
                 "automake", "gcc13",   "llvm18",   "gnu-make",
                 "git",      "libxml2", "gettext",  "glib",
                 "sqlite3",  "sdl2",    "vim",
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
    @find    = ("brew", "search");
    system(
        "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)\""
      )
      if (!(-x "/usr/local/bin/brew"));
    @packagescask = (
                     "xquartz",     "macvim", "meld", "firefox",
                     "thunderbird", "gimp",   "libreoffice"
                    );
    @preinstall = ("@installcask @packagescask");
    @packages = (
                 "gnu-sed",       "gpatch",
                 "autoconf",      "automake",
                 "pkgconf",       "gcc",
                 "llvm",          "make",
                 "meson",         "git",
                 "subversion",    "libxml2",
                 "gettext",       "glib",
                 "json-glib",     "sqlite",
                 "gsl",           "libgtop",
                 "gtk+3",         "gtk4",
                 "glfw",          "sdl2",
                 "sdl3",          "glew",
                 "glslang",       "mpich",
                 "font-freefont", "font-open-sans",
                 "nedit",         "gnu-indent",
                 "perltidy",      "maxima",
                 "ddd",           "graphviz",
                 "texlive",       "latexdiff",
                 "evince",        "doxygen",
                 "wget",          "imagemagick",
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
        @clean   = ("pacman", "-Rs", "\$(pacman", "-Qdtq);", "pacman", "-Scc");
        @update  = ("pacman", "-Syu");
        @find    = ("pacman", "-Ss");
        if ($mach eq "x86_64")
        {
            $mingw = "ucrt64/mingw-w64-ucrt-x86_64-";
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
                     $mingw . "meson",
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
                     $mingw . "glfw",
                     $mingw . "SDL2",
                     $mingw . "sdl3",
                     $mingw . "glew",
                     $mingw . "vulkan-loader",
                     $mingw . "vulkan-headers",
                     $mingw . "vulkan-validation-layers",
                     $mingw . "glslang",
                     "vim",
                     $mingw . "indent",
                     $mingw . "gnuplot",
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
                     $mingw . "texlive-extra-utils",
                     $mingw . "evince",
                     "doxygen",
                     "wget",
                     $mingw . "imagemagick",
                     $mingw . "gimp"
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
if (@find)
{
    open(FIND, ">find.sh");
    print FIND "@find \$1\n";
    close(FIND);
}
