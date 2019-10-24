all:
	if test `uname -s` = "Linux"; then \
		if test `lsb_release -i -s` = "Debian"; then \
			make -f Makefile.debian.linux; \
		else if test `lsb_release -i -s` = "Devuan"; then \
			make -f Makefile.devuan.linux; \
		else if test `lsb_release -i -s` = "Ubuntu"; then \
			make -f Makefile.ubuntu.linux; \
		else if test `lsb_release -i -s` = "LinuxMint"; then \
			make -f Makefile.linux.mint; \
		else if test `lsb_release -i -s | sed 's/ project//g'` \
			= "openSUSE"; then \
			make -f Makefile.opensuse.linux; \
		else if test `lsb_release -i -s` = "Fedora"; then \
			make -f Makefile.fedora.linux; \
		else if test `lsb_release -i -s` = "ManjaroLinux"; then \
			make -f Makefile.manjaro.linux; \
		else \
			echo "Unknown Linux distribution:"; \
		fi fi fi fi fi fi fi \
	else if test `uname -s` = "FreeBSD"; then \
		make -f Makefile.freebsd; \
	else if test `uname -s` = "OpenBSD"; then \
		make -f Makefile.openbsd; \
	else if test `uname -s` = "NetBSD"; then \
		make -f Makefile.netbsd.src; \
	else if test `uname -s` = "DragonFly"; then \
		make -f Makefile.dragonfly; \
	else if test `uname -s` = "GNU/kFreeBSD"; then \
		make -f Makefile.debian.kfreebsd; \
	else if test `uname -s` = "GNU"; then \
		make -f Makefile.debian.hurd; \
	else if test `uname -s` = "SunOS"; then \
		if test `uname -v` = "4.3+8"; then \
			make -f Makefile.dyson; \
		else \
			make -f Makefile.openindiana; \
		fi \
	else if test `uname -o` = "Msys"; then \
		if test `uname -m` = "x86_64"; then \
			make -f Makefile.msys2.64; \
		else if test `uname -m` = "i686"; then \
			make -f Makefile.msys2.32; \
		else \
			echo "Unknown machine"; \
		fi fi \
	else if test `uname -o` = "Cygwin"; then \
		if test `uname -m` = "x86_64"; then \
			make -f Makefile.cygwin.64; \
		else if test `uname -m` = "i686"; then \
			make -f Makefile.cygwin.32; \
		else \
			echo "Unknown machine"; \
		fi fi \
	else \
		echo "Unknown operative system"; \
	fi fi fi fi fi fi fi fi fi fi

update:
	if test `uname -s` = "Linux"; then \
		if test `lsb_release -i -s` = "Debian"; then \
			make update -f Makefile.debian.linux; \
		else if test `lsb_release -i -s` = "Devuan"; then \
			make update -f Makefile.devuan.linux; \
		else if test `lsb_release -i -s` = "Ubuntu"; then \
			make update -f Makefile.ubuntu.linux; \
		else if test `lsb_release -i -s` = "LinuxMint"; then \
			make update -f Makefile.debian.linux; \
		else if test `lsb_release -i -s | sed 's/ project//g'` \
			= "openSUSE"; then \
			make update -f Makefile.opensuse.linux; \
		else if test `lsb_release -i -s` = "Fedora"; then \
			make update -f Makefile.fedora.linux; \
		else if test `lsb_release -i -s` = "ManjaroLinux"; then \
			make update -f Makefile.manjaro.linux; \
		else \
			echo "Unknown Linux distribution:"; \
		fi fi fi fi fi fi fi \
	else if test `uname -s` = "FreeBSD"; then \
		make update -f Makefile.freebsd; \
	else if test `uname -s` = "OpenBSD"; then \
		make update -f Makefile.openbsd; \
	else if test `uname -s` = "NetBSD"; then \
		make update -f Makefile.netbsd.src; \
	else if test `uname -s` = "DragonFly"; then \
		make update -f Makefile.dragonfly; \
	else if test `uname -s` = "GNU/kFreeBSD"; then \
		make update -f Makefile.debian.kfreebsd; \
	else if test `uname -s` = "GNU"; then \
		make update -f Makefile.debian.hurd; \
	else if test `uname -s` = "SunOS"; then \
		if test `uname -v` = "4.3+8"; then \
			make update -f Makefile.dyson; \
		else \
			make update -f Makefile.openindiana; \
		fi \
	else if test `uname -o` = "Msys"; then \
		if test `uname -m` = "x86_64"; then \
			make update -f Makefile.msys2.64; \
		else if test `uname -m` = "i686"; then \
			make update -f Makefile.msys2.32; \
		else \
			echo "Unknown operative system"; \
		fi fi \
	else if test `uname -o` = "Cygwin"; then \
		if test `uname -m` = "x86_64"; then \
			make update -f Makefile.cygwin.64; \
		else if test `uname -m` = "i686"; then \
			make update -f Makefile.cygwin.32; \
		else \
			echo "Unknown operative system"; \
		fi fi \
	else \
		echo "Unknown operative system"; \
	fi fi fi fi fi fi fi fi fi fi

upgrade:
	if test `uname -s` = "Linux"; then \
		if test `lsb_release -i -s` = "Debian"; then \
			make upgrade -f Makefile.debian.linux; \
		else if test `lsb_release -i -s` = "Devuan"; then \
			make upgrade -f Makefile.devuan.linux; \
		else if test `lsb_release -i -s` = "Ubuntu"; then \
			make upgrade -f Makefile.ubuntu.linux; \
		else if test `lsb_release -i -s` = "LinuxMint"; then \
			make upgrade -f Makefile.debian.linux; \
		else if test `lsb_release -i -s | sed 's/ project//g'` \
			= "openSUSE"; then \
			make upgrade -f Makefile.opensuse.linux; \
		else if test `lsb_release -i -s` = "Fedora"; then \
			make upgrade -f Makefile.fedora.linux; \
		else if test `lsb_release -i -s` = "ManjaroLinux"; then \
			make upgrade -f Makefile.manjaro.linux; \
		else \
			echo "Unknown Linux distribution:"; \
		fi fi fi fi fi fi fi \
	else if test `uname -s` = "FreeBSD"; then \
		make upgrade -f Makefile.freebsd; \
	else if test `uname -s` = "OpenBSD"; then \
		make upgrade -f Makefile.openbsd; \
	else if test `uname -s` = "NetBSD"; then \
		make upgrade -f Makefile.netbsd.src; \
	else if test `uname -s` = "DragonFly"; then \
		make upgrade -f Makefile.dragonfly; \
	else if test `uname -s` = "GNU/kFreeBSD"; then \
		make upgrade -f Makefile.debian.kfreebsd; \
	else if test `uname -s` = "GNU"; then \
		make upgrade -f Makefile.debian.hurd; \
	else if test `uname -s` = "SunOS"; then \
		if test `uname -v` = "4.3+8"; then \
			make upgrade -f Makefile.dyson; \
		else \
			make upgrade -f Makefile.openindiana; \
		fi \
	else if test `uname -o` = "Msys"; then \
		if test `uname -m` = "x86_64"; then \
			make upgrade -f Makefile.msys2.64; \
		else if test `uname -m` = "i686"; then \
			make upgrade -f Makefile.msys2.32; \
		else \
			echo "Unknown operative system"; \
		fi fi \
	else \
		echo "Unknown operative system"; \
	fi fi fi fi fi fi fi fi fi

clean:
	if test `uname -s` = "Linux"; then \
		if test `lsb_release -i -s` = "Debian"; then \
			make clean -f Makefile.debian.linux; \
		else if test `lsb_release -i -s` = "Devuan"; then \
			make clean -f Makefile.devuan.linux; \
		else if test `lsb_release -i -s` = "Ubuntu"; then \
			make clean -f Makefile.ubuntu.linux; \
		else if test `lsb_release -i -s` = "LinuxMint"; then \
			make clean -f Makefile.debian.linux; \
		else if test `lsb_release -i -s | sed 's/ project//g'` \
			= "openSUSE"; then \
			make clean -f Makefile.opensuse.linux; \
		else if test `lsb_release -i -s` = "Fedora"; then \
			make clean -f Makefile.fedora.linux; \
		else if test `lsb_release -i -s` = "ManjaroLinux"; then \
			make clean -f Makefile.manjaro.linux; \
		else \
			echo "Unknown Linux distribution:"; \
		fi fi fi fi fi fi fi \
	else if test `uname -s` = "FreeBSD"; then \
		make clean -f Makefile.freebsd; \
	else if test `uname -s` = "OpenBSD"; then \
		make clean -f Makefile.openbsd; \
	else if test `uname -s` = "NetBSD"; then \
		make clean -f Makefile.netbsd.src; \
	else if test `uname -s` = "DragonFly"; then \
		make clean -f Makefile.dragonfly; \
	else if test `uname -s` = "GNU/kFreeBSD"; then \
		make clean -f Makefile.debian.kfreebsd; \
	else if test `uname -s` = "GNU"; then \
		make clean -f Makefile.debian.hurd; \
	else if test `uname -s` = "SunOS"; then \
		if test `uname -v` = "4.3+8"; then \
			make clean -f Makefile.dyson; \
		else \
			make clean -f Makefile.openindiana; \
		fi \
	else if test `uname -o` = "Msys"; then \
		if test `uname -m` = "x86_64"; then \
			make clean -f Makefile.msys2.64; \
		else if test `uname -m` = "i686"; then \
			make clean -f Makefile.msys2.32; \
		else \
			echo "Unknown operative system"; \
		fi fi \
	else \
		echo "Unknown operative system"; \
	fi fi fi fi fi fi fi fi fi
