FROM steamcmd/steamcmd:latest

# Switch to root so we can write and chmod properly
USER root

# Set working directories and variables
ENV PIXARK_DIR=/home/steam/pixark
ENV ENTRYPOINT_SCRIPT=/home/steam/entrypoint.sh

# Make install directory
RUN mkdir -p ${PIXARK_DIR}

# Copy the script and make it executable
COPY entrypoint.sh ${ENTRYPOINT_SCRIPT}
RUN chmod +x ${ENTRYPOINT_SCRIPT}

# Optional: Set ownership back to steam user
RUN chown -R steam:steam ${PIXARK_DIR} ${ENTRYPOINT_SCRIPT}

# Switch back to the steam user
USER steam

# Set working directory and expose ports
WORKDIR ${PIXARK_DIR}
EXPOSE 27015/udp 27016/udp 7777/udp 7778/udp

# Run the script on container start
ENTRYPOINT ["/home/steam/entrypoint.sh"]