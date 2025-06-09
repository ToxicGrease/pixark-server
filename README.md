# PixARK Dedicated Server - Docker

A Docker image to run a PixARK Dedicated Server using SteamCMD.

## Usage

```bash
docker run -d \
  -p 27015:27015/udp \
  -p 27016:27016/udp \
  -p 7777:7777/udp \
  -p 7778:7778/udp \
  -e SESSION_NAME="GreaseArk" \
  -e MAX_PLAYERS=20 \
  -e SERVER_PASSWORD="" \
  -e ADMIN_PASSWORD="supersecret" \
  ghcr.io/ToxicGrease/pixark-server:latest
