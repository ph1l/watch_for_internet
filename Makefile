all:
	echo nothing to do... done.

install:
	install -g root -o root -m 755 watch4inet $(DESTDIR)/usr/sbin
	install -g root -o root -m 644 watch4inet.conf $(DESTDIR)/etc/
	install -g root -o root -m 644 ppp-peers $(DESTDIR)/etc/ppp/peers/watch4inet.default

