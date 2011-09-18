all:
	echo nothing to do... done.

install:
	install -g root -o root -m 755 watch_for_internet /usr/sbin
	install -g root -o root -m 644 watch_for_internet.conf /etc/
	install -g root -o root -m 755 watch_for_internet.init.d /etc/init.d/watch_for_internet
	update-rc.d -n watch_for_internet defaults

