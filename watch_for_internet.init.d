#! /bin/sh

### BEGIN INIT INFO
# Provides:          watch_for_internet
# Required-Start:    $syslog
# Required-Stop:     $syslog
# Should-Start:      $local_fs $network
# Should-Stop:       $local_fs $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Handles the watch_for_internet daemon
### END INIT INFO


PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DAEMON=/usr/sbin/watch_for_internet
NAME=watch_for_internet
DESC="watch_for_internet"

RUN_DAEMON=yes

test -f $DAEMON || exit 0

set -e

case "$1" in
  start)
	echo -n "Starting $DESC: "
	if [ "$RUN_DAEMON" = "yes" ]; then
		start-stop-daemon --background --start --quiet --pidfile /var/run/$NAME.pid --make-pidfile \
		--exec $DAEMON
		echo done
	else
		echo disabled 
	fi
	;;
  stop)
	echo -n "Stopping $DESC: "
	start-stop-daemon --stop --signal TERM --quiet --pidfile /var/run/$NAME.pid
	echo done 
	;;
  restart|force-reload)
	echo -n "Restarting $DESC: "
	start-stop-daemon --stop --signal TERM --quiet --pidfile \
		/var/run/$NAME.pid --exec $DAEMON
	sleep 1
	start-stop-daemon --start --quiet --pidfile \
		/var/run/$NAME.pid --exec $DAEMON
	echo "$NAME."
	;;
  *)
	N=/etc/init.d/$NAME
	echo "Usage: $N {start|stop|restart}" >&2
	exit 1
	;;
esac

exit 0
