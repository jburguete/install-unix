all:
	if test `uname -s` = "OpenBSD"; then \
		make -f Makefile.openbsd; \
	else if test `uname -s` = "FreeBSD"; then \
		make -f Makefile.freebsd; \
	else if test `uname -s` = "NetBSD"; then \
		make -f Makefile.netbsd; \
	else if test `uname -s` = "DragonFly"; then \
		make -f Makefile.dragonfly; \
	else if test `uname -s` = "Linux"; then \
		make -f Makefile.debian.linux; \
	else if test `uname -s` = "GNU/kFreeBSD"; then \
		make -f Makefile.debian.kfreebsd; \
	else if test `uname -s` = "GNU"; then \
		make -f Makefile.debian.hurd; \
	else if test `uname -s` = "SunOS"; then \
		make -f Makefile.dyson; \
	else \
		echo "Unknown operative system"; \
	fi fi fi fi fi fi fi fi
