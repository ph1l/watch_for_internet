all:
	echo nothing to do... done.

install:
	install -g root -o root -m 755 watch_for_internet $(DESTDIR)/usr/sbin
	install -g root -o root -m 644 watch_for_internet.conf $(DESTDIR)/etc/
	install -g root -o root -m 644 ppp-peers $(DESTDIR)/etc/ppp/peers/watch_for_internet.default

