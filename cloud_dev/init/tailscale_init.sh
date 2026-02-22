#!/bin/bash
/init/config.sh
tailscaled --tun=userspace-networking &
tailscale up --authkey=$TAILSCALE_AUTH_KEY --hostname=$TAILSCALE_HOST_NAME --ssh
sleep infinity
