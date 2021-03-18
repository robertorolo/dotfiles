#!/bin/bash

echo "Sincronizando da nuvem para o computador - baixar"
echo "*** Sincronizando da nuvem para o computador - baixar ***" >> /home/void/rclone.log
rclone -v sync google-drive:/ /home/void/google_drive --log-file=/home/void/rclone.log
echo ==================================== >> /home/void/rclone.log
