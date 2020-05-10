
#Supported systems
#Debian Linux
#Devuan Linux
#Linux Mint
#Microsoft Windows + CYGWIN
#Microsoft Windows + MSYS2
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
		system("sudo","apt","install","aptitude")
	   		if (!(-x "/usr/bin/aptitude"));
		@install=("aptitude","install");
		@clean=("aptitude","clean");
		@update=("aptitude","update");
		@upgrade=("aptitude","upgrade");
		@packages=(
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
			"fonts-freefont-ttf",
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
		system("sudo",@install,"virt-what");
		$machine=`sudo virt-what`;
		$machine=~ s/\r//g;
		if ($machine eq "virtualbox")
		{
			@postinstall=(@install,"virtualbox-guest-x11");
		}
		elsif ($machine eq "qemu")
		{
			@postinstall=(@install,"xserver-xorg-video-qxl");
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
			"fonts-freefont-ttf",
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
}
else
{
	$os=`uname -o`;
	$os=~ s/\r//g;
	$machine=`uname -m`;
	$machine=~ s/\r//g;
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
			"\n\$ver=\"20120503\";",
			"\n\$name=\"freefont\";",
			"\n$file=\"${name}-ttf-${ver}.zip\";",
			"\n$url=\"https://ftp.gnu.org/gnu/${name}/${file}\";",
			"\n$dir=\"/usr/share/fonts/truetype/\";",
			"\nsystem(\"wget\",$url);",
			"\nsystem(\"unzip\",$file);",
			"\nchdir \"${name}-${ver}\";",
			"\nif (!(-d $dir)) mkdir -p $dir;",
			"\nmove \"*.ttf\" $dir;",
			"\nchdir \"..\";",
			"\nunlink \"${name}*\";");
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
	print INSTALL "@install @packages";
	print INSTALL "@postinstall" if (@postinstall);
	close (INSTALL);
}
if (@clean)
{
	open (CLEAN,">clean.sh");
	print CLEAN "@clean";
	close (CLEAN);
}
if (@update)
{
	open (UPDATE,">update.sh");
	print UPDATE "@update";
	close (UPDATE);
}
if (@upgrade)
{
	open (UPGRADE,">upgrade.sh");
	print UPGRADE "@upgrade";
	close (UPGRADE);
}
