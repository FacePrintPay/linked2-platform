#!/data/data/com.termux/files/usr/bin/bash
echo "🚀 LAUNCHING TOTAL RECALL ULTRASYNC..."

cd ~/aikre8tive/linkto || exit 1

# ✅ Ensure directories
mkdir -p pages public/assets components logs

# ✅ Inject index.js for live UI
cat <<EOF > pages/index.js
export default function Home() {
  return (
    <div className="bg-black text-lime-400 min-h-screen p-6 font-mono">
      <h1 className="text-3xl">🧠 AiKre8tive Ops Console</h1>
      <p className="mt-4">Welcome to your AI deployment dashboard.</p>
      <ul className="list-disc ml-6 mt-4 space-y-2">
        <li>🎙️ WhisperSync: <span id="whisper-status">Active</span></li>
