#!/bin/bash
(tailscaled --tun=userspace-networking 1>/dev/null 2>&1) &
tailscale up --authkey=$TAILSCALE_AUTH_KEY --hostname=$TAILSCALE_HOST_NAME --ssh > /dev/null 2>&1

/datalab/run.sh &
sleep infinity
