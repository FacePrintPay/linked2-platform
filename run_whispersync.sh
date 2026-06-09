#!/data/data/com.termux/files/usr/bin/bash

cd ~/aikre8tive/linkto || exit 1

# Confirm presence of whisper_sync.py
if [ ! -f whisper_sync.py ]; then
  echo "❌ Missing whisper_sync.py! Please add it to ~/aikre8tive/linkto/"
  exit 1
fi

# Ensure input directory exists
mkdir -p input

# Create empty transcript log if it doesn't exist
touch transcripts.log

clear
echo ""
echo "╔════════════════════════════════════════╗"
echo "║         🚀 WHISPERSYNC MONITOR         ║"
echo "╚════════════════════════════════════════╝"
echo ""
echo "📡 Listening for audio files in ./input/"
echo "🎧 Drop .wav or .mp3 files into ~/aikre8tive/linkto/input/"
echo "🧠 Transcriptions will go into transcripts.log"
echo ""

# Run the Python script in the background
nohup python3 whisper_sync.py >> sync_runtime.log 2>&1 &

# Show live transcript log
echo "📖 Live Transcript Log:"
echo "---------------------------------------------"
tail -f transcripts.log
