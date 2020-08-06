

# Raspberry pi as player

This repository contains scripts and patches to use one or more raspberry pi's as a video player controlled over the network by a Puredata patch.


## General description

-   the script loaded on the patch starts vlc on boot and loads the video but doesn't start the playback. Playback is stopped at the video's last frame until a new "play" command is received. For testing purposes the script loads a test video that comes with the raspbian os.
-   to play another videos you need to change the path in the script load_video.sh. (and load_video_cli.sh)
-   you can also control vlc over a telnet connection [port 4212]
-   you need the full version of the Raspberry Pi OS.


## Pi configuration

open vlc player and go to tools->preferences. There go to show all and then to interfaces. Under interfaces/lua and in the tcp interface write 0.0.0.0:9999. This sets vlc to listen to any address on port 9999.

create a directory called ~/scripts

    ~ $ mkdir scripts

It is a good idea to copy all the scripts to the pi just for backup. It is important that the files load\_video.sh and load\_video\_cli.sh stay in that folder. 
create a directory called ~/.config/autostart/ and copy the .desktop file there

    ~ $ mkdir .confg/autostart
    ~ $ cp scripts/load_video.desktop .config/autostart/load_video.desktop

It is important that the ip-address of your pi stays the same because the address will be hard-coded on the pd patch. Open the dhcp config file and uncomment the static address lines. Make sure that your router allows hosts to set their ip-address. 

    ~ $ sudo nano ætc/dhcpcd.conf


## on the control computer

-   you need the pd patch vlc\_controller.pd somewhere in your computer
-   the address on the [connect< message box must match the one in your pi
-   after the pi is booted, you can connect to the vlc and control the playback.
-   make sure that your computer is on the same network as the pi!


## Command line version

After finishing and testing the setup, it is a good idea to boot without the gui to save resources. Some steps need to be taken to make the version without gui work:

copy the file load\_video.service to the systemd directory

    ~ $ sudo cp scripts/load_video.serivce /etc/systemd/system/load_video.service

Test the service

    ~ $ sudo systemctl start load_video.service

if it works, you can enable it to start at boot

    ~ $ sudo systemctl enable load_video.service

To make the Pi boot without gui you need to go the config->boot options->desktop/cli and select console autologin

