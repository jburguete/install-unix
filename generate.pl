
#Supported systems
#Debian Linux
#Devuan Linux
#Dragonfly BSD
#Dyson
#FreeBSD
#Linux Mint
#Manjaro Linux
#Microsoft Windows + CYGWIN
#Microsoft Windows + MSYS2
#NetBSD
#OpenBSD
#OpenIndiana (partially)
#Ubuntu Linux
use File::Copy 'move';
$os=`uname -s`;
$os=~ s/\n//g;
if ($os eq "Linux")
{
	$dist=`lsb_release -i -s`;
	$dist=~ s/\n//g;
	print "OS=" . $os . " Dist=" . $dist . "\n";
	if ($dist eq "Debian" || $dist eq "Devuan")
	{
		system("apt","install","aptitude") if (!(-x "/usr/bin/aptitude"));
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
			push @packages,"xserver-xorg-video-qxl";
		}
	}
	elsif ($dist eq "Ubuntu" || $dist eq "LinuxMint")
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
			"libsqlite3-dev",
			"libgsl-dev",
			"libgtop2-dev",
			"libgtk-3-dev",
			"freeglut3-dev",
			"libglfw3-dev",
			"libsdl2-dev",
			"fonts-freefont-otf",
			"libglew-dev",
			"mpich",
			"libmpich-dev",
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
			"firefox-esr-locale-es",
			"webext-ublock-origin",
			"thunderbird",
			"thunderbird-locale-es",
			"imagemagick",
			"gimp",
			"gimp-ufraw",
			"mpv",
			"gnumeric",
			"libreoffice",
			"spamassassin");
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
			"freeglut",
			"glfw-x11",
			"sdl2",
			"gnu-free-fonts",
			"glew",
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
}
elsif ($os eq "FreeBSD")
{
	print "OS=" . $os . "\n";
	@install=("pkg","install");
	@clean=("pkg","autoremove",";","pkg","clean","-a");
	@update=("freebsd-update","fetch",";","freebsd-update","install",";",
					 "pkg","update",";","pkg","upgrade");
	@upgrade=("freebsd-update","-r","12.1-RELEASE","upgrade");
	@packages=(
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
		"orage",
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
		push @packages,"xf86-video-qxl";
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
	@packages=(
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
	@clean=("pkg","autoremove",";","pkg","clean","-a");
	@update=("pkg","update",";","pkg","upgrade");
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
		@clean=("pkg","autoremove",";","pkg","clean","-a",";","beadmin","list");
		@update=("pkg","update");
		system("pkg","mate_install");
		@packages=(
			"patch",
			"autoconf",
			"automake",
			"pkg-config",
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
			"gnome-fonts",
			"mate_install",
			"gvim"
		);
	}
}
elsif ($os eq "GNU")
{
	print "OS=" . $os . "\n";
	@install=("apt","install");
	@clean=("apt","autoremove",";","apt","clean");
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
		"libsqlite3-dev",
		"libgsl-dev",
		"libgtop2-dev",
		"libgtk-3-dev",
		"freeglut3-dev",
		"libglfw3-dev",
		"libsdl2-dev",
		"fonts-freefont-otf",
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
	system("sudo",@install,"virt-what") if (!(-x "/usr/sbin/virt-what"));
	$machine=`sudo virt-what`;
	$machine=~ s/\n//g;
	if ($machine eq "kvm")
	{
		push @packages,"xserver-xorg-video-qxl";
	}
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
			$mingw."freeglut",
			$mingw."glfw",
			$mingw."SDL2",
			$mingw."glew",
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
