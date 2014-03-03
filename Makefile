all:
	if test `uname -s` == "OpenBSD"; then \
		make -f Makefile.openbsd; \
	else if test `uname -s` == "FreeBSD"; then \
		make -f Makefile.freebsd; \
	else \
		echo "Unknown operative system"; \
	fi fi
