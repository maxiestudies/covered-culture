# /etc/init.d/initialization.sh
### BEGIN INIT INFO
# Provides: initialization.sh
# Required-Start: $remote_fs $syslog
# Required-Stop: $remote_fs $syslog
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: start daemon at boot time
# Description: Start the vlc player
### END INIT INFO

cvlc --no-video-title --loop --no-playlist-autostart --play-and-pause --fullscreen /opt/vc/src/hello_pi/hello_video/test.h264
