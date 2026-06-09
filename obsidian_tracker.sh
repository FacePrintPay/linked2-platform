#!/bin/bash
echo "🧠 Initializing Obsidian Web Tracker..."
mkdir -p logs/obsidian
for agent_log in ./agents/*.sh; do
  name=$(basename "$agent_log" .sh)
  log_file="logs/obsidian/${name}_log.txt"
  nohup bash "$agent_log" > "$log_file" 2>&1 &
  echo "📡 Logging $name to $log_file"
done
if [ -f web/obsidian_dashboard.html ]; then
  echo "🌐 Serving Obsidian Tracker UI at http://localhost:4000"
  nohup python3 -m http.server 4000 --directory web > logs/obsidian/server.log 2>&1 &
fi
echo "✅ Obsidian Tracker running. Logs in logs/obsidian/"
