all:
	if test `uname -s` = "Linux"; then \
		if test `lsb_release -i -s` = "Debian"; then \
			make -f Makefile.debian.linux; \
		else if test `lsb_release -i -s` = "Ubuntu"; then \
			make -f Makefile.ubuntu.linux; \
		else \
			echo "Unknown Linux distribution:"; \
		fi fi \
	else if test `uname -o` = "Msys"; then \
		if test `uname -m` = "x86_64"; then \
			make -f Makefile.msys2.64; \
		else if test `uname -m` = "i686"; then \
			make -f Makefile.msys2.32; \
		else \
			echo "Unknown operative system"; \
		fi fi \
	else if test `uname -s` = "FreeBSD"; then \
		make -f Makefile.freebsd; \
	else if test `uname -s` = "OpenBSD"; then \
		make -f Makefile.openbsd; \
	else if test `uname -s` = "NetBSD"; then \
		make -f Makefile.netbsd; \
	else if test `uname -s` = "DragonFly"; then \
		make -f Makefile.dragonfly; \
	else if test `uname -s` = "GNU/kFreeBSD"; then \
		make -f Makefile.debian.kfreebsd; \
	else if test `uname -s` = "GNU"; then \
		make -f Makefile.debian.hurd; \
	else if test `uname -s` = "SunOS"; then \
		make -f Makefile.dyson; \
	else \
		echo "Unknown operative system"; \
	fi fi fi fi fi fi fi fi fi
