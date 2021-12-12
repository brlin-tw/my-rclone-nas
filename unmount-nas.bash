#!/usr/bin/env bash
# Mount NAS to mountpoint
set -e
trap "printf '\n\n    Program failed.\n\n'" ERR
read -ar occupying_processes <<< "$(lsof -t +D nas 2>/dev/null)"
if test "${#occupying_processes[@]}" -gt 0; then
    kill "${occupying_processes[@]}"
fi
sleep 1
pkill rclone || true
fusermount -u nas || true
exit 0
