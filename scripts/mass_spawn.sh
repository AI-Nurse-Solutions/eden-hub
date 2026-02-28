#!/bin/bash

# Robert's Mass Spawner
# Spawns 9 incubators starting from port 8001

for i in {1..9}
do
   NAME="incubator-$(printf "%02d" $i)"
   PORT=$((8000 + i))
   echo "🚀 Launching $NAME on port $PORT..."
   ./eden_hub/scripts/spawn.sh "$NAME" "$PORT"
done

echo "✨ All 9 Incubators have been initialized in the EDEN Hub!"
