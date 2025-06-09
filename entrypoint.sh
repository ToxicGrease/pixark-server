#!/bin/bash
set -e

SESSION_NAME="${SESSION_NAME:-MyPixARKServer}"
MAX_PLAYERS="${MAX_PLAYERS:-10}"
SERVER_PASSWORD="${SERVER_PASSWORD:-}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-admin123}"

/home/steam/steamcmd/steamcmd.sh +login anonymous \
    +force_install_dir /pixark \
    +app_update 824360 validate \
    +quit

cd /pixark/ShooterGame/Binaries/Linux

./PixARKServer.sh "Ocean?listen?Port=7777?QueryPort=27015?SessionName=${SESSION_NAME}?MaxPlayers=${MAX_PLAYERS}?ServerPassword=${SERVER_PASSWORD}?ServerAdminPassword=${ADMIN_PASSWORD}" -server -log
