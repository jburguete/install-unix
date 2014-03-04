all:
	if test `uname -s` == "OpenBSD"; then \
		make -f Makefile.openbsd; \
	else if test `uname -s` == "FreeBSD"; then \
		make -f Makefile.freebsd; \
	else if test `uname -s` == "NetBSD"; then \
		make -f Makefile.freebsd; \
	else if test `uname -s` == "Linux"; then \
		make -f Makefile.debian.linux; \
	else \
		echo "Unknown operative system"; \
	fi fi fi fi
