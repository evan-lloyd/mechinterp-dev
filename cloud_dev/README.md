Configured with the following environment variables:
* `TAILSCALE_AUTH_KEY`: Generate a reusable ephemeral auth key from the [Tailscale admin console](https://login.tailscale.com/admin/settings/keys). Should be stored as a secret on your cloud provider.
* `TAILSCALE_HOST_NAME`: Hostname for the machine on your Tailscale VPN.
* `JUPYTER_TOKEN`: If set, use this as the Jupyter Lab server token. Useful (in combination with `TAILSCALE_HOST_NAME`) so you can have a consistent bookmark or remembered server in VSCode. Should be stored as a secret on your cloud provider.
* `WANDB_API_KEY`: If using W&B, generate an [API key](https://wandb.ai/authorize) and store as a secret on your cloud provider.
* `HF_TOKEN`: If using Hugging Face Hub, generate an [access token](https://huggingface.co/settings/tokens) and store as a secret on your cloud provider.
* `GOOGLE_DRIVE_CLIENT_ID`, `GOOGLE_DRIVE_CLIENT_SECRET`: if set, set up Google Drive integration for use with [rclone](https://rclone.org/). Documenting how to set this up is currently TODO, as I haven't yet figured out how to streamline the process.
