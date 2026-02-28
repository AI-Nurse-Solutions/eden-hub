#!/bin/bash

# EDEN Hub Health Dashboard
echo "==========================================="
echo "   🛡️  EDEN HUB ORCHESTRATION STATUS  🛡️"
echo "==========================================="
printf "%-15s %-10s %-10s %-10s\n" "INCUBATOR" "PORT" "STATUS" "RESPONSE"
echo "-------------------------------------------"

for i in {1..9}
do
   NAME="incubator-$(printf "%02d" $i)"
   PORT=$((8000 + i))
   
   # Check if container is running
   IS_RUNNING=$(docker ps --filter "name=$NAME" --format "{{.Status}}")
   
   if [ -z "$IS_RUNNING" ]; then
       STATUS="❌ DOWN"
       RESPONSE="N/A"
   else
       STATUS="✅ UP"
       # Get HTTP response
       RESPONSE=$(curl -s --max-time 1 http://localhost:$PORT | grep -o '"status":"[^"]*"' | cut -d'"' -f4)
       if [ -z "$RESPONSE" ]; then RESPONSE="ERR"; fi
   fi

   printf "%-15s %-10s %-10s %-10s\n" "$NAME" "$PORT" "$STATUS" "$RESPONSE"
done
echo "==========================================="
