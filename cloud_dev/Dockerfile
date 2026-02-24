# 12.8.0 seems to be the most-supported version on runpod at the moment; may want to tweak if using a different
# provider!
FROM nvidia/cuda:12.8.0-runtime-ubuntu24.04

RUN apt update -y && apt upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y wget openssh-server curl git tmux rsync p7zip-full jq vim

RUN wget -O - https://tailscale.com/install.sh | sh
RUN curl https://rclone.org/install.sh | bash
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

ENV PATH=/root/.local/bin:$PATH \
    UV_CACHE_DIR=/root/.cache/uv \
    UV_LINK_MODE=symlink \
    TERMINFO_DIRS=/etc/terminfo:/lib/terminfo:/usr/share/terminfo \
    HF_HOME=/workspace/hf

# Bake in env vars so they'll be present when we SSH into a remote container
RUN env > /etc/environment
RUN mkdir /cloud-dev
RUN echo "cd /cloud-dev" >> "/root/.bashrc"

# Build a dummy uv project so we can pre-cache common python packages
WORKDIR /base_uv_env
COPY base_uv_env ./
RUN uv python install `head -n 1 .python-version`
RUN uv sync --no-install-project

COPY init/ /init/

ENTRYPOINT [ "/init/tailscale_init.sh" ]
