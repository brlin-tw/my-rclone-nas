#!/usr/bin/env bash
# Mount NAS to mountpoint
nohup rclone mount --vfs-cache-mode full NAS: ~/nas &>rclone.out &
disown %1
exit 0

