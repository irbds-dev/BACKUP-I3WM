#!/bin/bash

# Player ativo (pega o primeiro disponível)
player=$(playerctl -l 2>/dev/null | head -n 1)

# Sai se não houver player
[ -z "$player" ] && exit 0

# Pega artista e título
track=$(playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null)

# Sai se não estiver tocando nada
[ -z "$track" ] && exit 0

# Define ícone com base no player
icon="🎵"
if [[ "$player" == *"spotify"* ]]; then
  icon=""
elif [[ "$player" == *"firefox"* || "$player" == *"chromium"* || "$player" == *"brave"* ]]; then
  icon=""
fi

# Trunca se for muito longo
max_length=60
if [ ${#track} -gt $max_length ]; then
  track="${track:0:$max_length}..."
fi

# Saída final
echo "$icon $track"

