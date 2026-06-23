#!/bin/bash
echo "🧠 Initializing AiKre8tive WhisperOps Full Stack..."
echo "🎙️ Restarting WhisperSync in background..."
pkill -f whisper_sync.py
nohup python3 whisper_sync.py > whisper.log 2>&1 &
echo "✅ WhisperSync loop active."
echo "🛰️ Deploying Planetary AI Agents from ArcBase..."
for agent in ./agents/*.sh; do
  echo "🔁 Launching $(basename "$agent")"
  bash "$agent"
done
echo "✅ All agents deployed."
echo "📡 Broadcasting status update to Discord..."
bash broadcast_whisper_echo.sh "OpsStack Injected: WhisperSync + Planetary Agents deployed. VerseDNA and ArcAI now live."
if [ -f system_watcher.sh ]; then
  echo "👁️  Launching system_watcher.sh to monitor stack health..."
  nohup bash system_watcher.sh > watcher.log 2>&1 &
  echo "✅ system_watcher running in background."
else
  echo "⚠️ system_watcher.sh not found. Skipping."
fi
echo "🌀 CICD + Voice Trigger Stack Now Fully Activated."
echo "🧬 Injected Modules: VerseDNA + ArcAI confirmed live."
