# mechinterp-dev
Assorted utilities for mechanistic interpretability development.

## [codesync](https://github.com/evan-lloyd/mechinterp-dev/tree/main/codesync)
[Docker image](https://hub.docker.com/repository/docker/elloyd/codesync/general) to set up one-way file synchronization from the local machine to a remote host, which must be accessible via SSH. I prefer this workflow over something like remote code editing, because it means that synchronization issues with the remote end can never wipe out my local changes.

## [colab]((https://github.com/evan-lloyd/mechinterp-dev/tree/main/colab)
[Docker image](https://hub.docker.com/repository/docker/elloyd/colab/general) to act as a "local runtime" for Google Colab, with Tailscale integration allowing this to be used with cloud hardware.
