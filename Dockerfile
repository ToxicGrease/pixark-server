FROM cm2network/steamcmd:latest

ENV PIXARK_DIR=/home/steam/pixark

RUN mkdir -p ${PIXARK_DIR}

# Install PixARK on build
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous \
    +force_install_dir ${PIXARK_DIR} \
    +app_update 824360 validate \
    +quit

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR ${PIXARK_DIR}
EXPOSE 27015/udp 27016/udp 7777/udp 7778/udp

ENTRYPOINT ["/entrypoint.sh"]
