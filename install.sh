#!/bin/bash
APPDIR="$HOME/.local/share/simple-shooter-server"
ZIP_URL="https://drive.google.com/uc?export=download&id=1pGhRYJxymjfEDKbxtI-hJdsNHH-y4vKI"

if [ ! -d "$APPDIR" ]; then
  echo "Installing Simple Shooter Server..."
  mkdir -p "$APPDIR"
  cd "$APPDIR"

  # Download with confirmation token handling
  CONFIRM=$(curl -sc /tmp/gcookie "https://drive.google.com/uc?export=download&id=1pGhRYJxymjfEDKbxtI-hJdsNHH-y4vKI" | grep -o 'confirm=[^&]*' | sed 's/confirm=//')
  curl -Lb /tmp/gcookie "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=1pGhRYJxymjfEDKbxtI-hJdsNHH-y4vKI" -o server.zip

  unzip -o server.zip
  rm server.zip

  chmod +x start.sh

  echo "Installation complete."
fi

echo "Starting Simple Shooter Server..."
cd "$APPDIR"
./start.sh
