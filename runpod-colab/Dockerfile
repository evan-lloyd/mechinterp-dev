FROM us-docker.pkg.dev/colab-images/public/runtime:latest

RUN wget -O - https://tailscale.com/install.sh | sh

RUN mkdir -p /init
COPY init.sh /init/init.sh
RUN chmod +x /init/init.sh
RUN env > /etc/environment

ENTRYPOINT [ "/init/init.sh" ]
