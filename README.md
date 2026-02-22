# mechinterp-dev
Assorted utilities for mechanistic interpretability development.

# [cloud_dev](https://github.com/evan-lloyd/mechinterp-dev/tree/main/clouddev)
echo "$JUPYTER_TOKEN" > /init/jupyter_token
echo "$WANDB_API_KEY" > /init/wandb_api_key

if [[ -n "$GOOGLE_DRIVE_CLIENT_ID" && -n "$GOOGLE_DRIVE_CLIENT_SECRET" ]]; then

Docker image for running mechinterp experiments on cloud hardware. Connects to a [Tailscale](https://tailscale.com/) VPN on startup. I use this in combination with [codesync](#codesync) to set up a remote environment that runs my code as if it were on my local network. Configured with the following environment variables:
* `TAILSCALE_AUTH_KEY`: Generate a reusable ephemeral auth key from the [Tailscale admin console](https://login.tailscale.com/admin/settings/keys). Should be stored as a secret on your cloud provider.
* `TAILSCALE_HOST_NAME`: Hostname for the machine on your Tailscale VPN.
* `JUPYTER_TOKEN`: If set, use this as the Jupyter Lab server token. Useful (in combination with `TAILSCALE_HOST_NAME`) so you can have a consistent bookmark or remembered server in VSCode. Should be stored as a secret on your cloud provider.
* `WANDB_API_KEY`: If using W&B, generate an [API key](https://wandb.ai/authorize) and store as a secret on your cloud provider.
* `HF_TOKEN`: If using Hugging Face Hub, generate an [access token](https://huggingface.co/settings/tokens) and store as a secret on your cloud provider.
* `GOOGLE_DRIVE_CLIENT_ID`, `GOOGLE_DRIVE_CLIENT_SECRET`: if set, set up Google Drive integration for use with [rclone](https://rclone.org/). Documenting how to set this up is currently TODO, as I haven't yet figured out how to streamline the process.

# [codesync](https://github.com/evan-lloyd/mechinterp-dev/tree/main/codesync)
[Docker image](https://hub.docker.com/repository/docker/elloyd/codesync/general) to set up one-way file synchronization from the local machine to a remote host, which must be accessible via SSH. I prefer this workflow over something like remote code editing, because it means that synchronization issues with the remote end can never wipe out my local changes.

# [colab](https://github.com/evan-lloyd/mechinterp-dev/tree/main/colab)
[Docker image](https://hub.docker.com/repository/docker/elloyd/colab/general) to act as a "local runtime" for Google Colab, with Tailscale integration allowing this to be used with cloud hardware.
