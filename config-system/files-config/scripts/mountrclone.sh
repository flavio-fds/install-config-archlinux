#!/bin/bash
#
#rclone mount \
#--config=/home/$USER/.config/rclone/rclone.conf \
#--allow-other --allow-non-empty \
#--buffer-size 256M --dir-cache-time 24h \
#--drive-chunk-size 512M --vfs-read-chunk-size 128M \
#--vfs-read-chunk-size-limit off \
#--vfs-cache-mode writes \
#-v drive: /home/$USER/drive/
#
nohup /usr/bin/rclone mount -v drive: /home/$USER/drive/ &
