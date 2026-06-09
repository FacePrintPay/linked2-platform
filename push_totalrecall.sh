#!/bin/bash
echo "📡 Preparing Total Recall sync to GitHub + Vercel..."
git add .
git commit -m "🧠 Injected Total Recall Ops Stack (Mr. GTTP) - Obsidian + Whisper + Agents"
git push origin main
vercel --prod --confirm
echo "🎙️ Total Recall Echo now live on GitHub + Vercel."
