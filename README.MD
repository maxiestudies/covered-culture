

# Raspberry pi as player

This repository contains scripts and patches to use one or more raspberry pi's as a video player controlled over the network by a Puredata patch.


## General description

-   the script loaded on the patch starts vlc on boot and loads the video but doesn't start the playback. After the video is played it is paused on the last frame.
-   you can also control vlc over a telnet connection [port 4212]


## Pi configuration

create a directory called ~/scripts

    mkdir scripts

-   put the file load<sub>video.sh</sub> there
-   create a directory called ~/.config/autostart/
-   put the file load<sub>video.desktop</sub> there

The script loads a test video that comes with the raspbian os.

-   set the pi's ip to a static address
-   open vlc player and in the config go to interfaces/lua and in the tcp interface write 0.0.0.0:9999


## on the control computer

-   you need the pd patch vlc<sub>controller.pd</sub> somewhere in your computer
-   the address on the [connect< message box must match the one in your pi
-   after the pi is booted, you can connect to the vlc and control the playback.

