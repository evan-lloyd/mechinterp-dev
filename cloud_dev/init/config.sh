#!/bin/bash
echo "$JUPYTER_TOKEN" > /init/jupyter_token
echo "$WANDB_API_KEY" > /init/wandb_api_key

if [[ -n "$GOOGLE_DRIVE_CLIENT_ID" && -n "$GOOGLE_DRIVE_CLIENT_SECRET" ]]; then
    mkdir /root/.config/rclone
    cp /init/rclone.conf /root/.config/rclone/rclone.conf
    echo "client_id = $GOOGLE_DRIVE_CLIENT_ID" >> /root/.config/rclone/rclone.conf
    echo "client_secret = $GOOGLE_DRIVE_CLIENT_SECRET" >> /root/.config/rclone/rclone.conf
    echo "  client_id: $GOOGLE_DRIVE_CLIENT_ID" >> /init/pydrive.yaml
    echo "  client_secret: $GOOGLE_DRIVE_CLIENT_SECRET" >> /init/pydrive.yaml
fi
