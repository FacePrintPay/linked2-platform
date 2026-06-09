#!/data/data/com.termux/files/usr/bin/bash
echo "🛰️ Unified Mission Launch: All Planetary Agents"
cd ~/aikre8tive/backend/agents

for agent_file in *.py; do
    echo "-----------------------------------------------"
    echo "🚀 Launching: $agent_file"
    python $agent_file
    echo "✅ Completed: $agent_file"
    echo "-----------------------------------------------"
done

echo "🌌 All agents have finished their mission cycles."
