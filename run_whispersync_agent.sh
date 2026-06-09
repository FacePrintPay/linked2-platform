#!/data/data/com.termux/files/usr/bin/bash

echo "🔁 [1/7] Cleaning and preparing environment..."
pkg update -y && pkg upgrade -y
pkg install -y python ffmpeg git nodejs

echo "📦 [2/7] Installing NPM packages..."
npm install

echo "📜 [3/7] Creating WhisperSync fallback script..."
cat > whisper_sync.py <<'PYEOF'
def transcribe_and_parse():
    return input("🎙️ Whisper (simulated): ")
PYEOF

echo "🧠 [4/7] Creating BuildTraces agent..."
cat > build_traces.py <<'PYEOF'
import subprocess, datetime

def log_build(command):
    with open("build_trace.log", "a") as f:
        f.write(f"\\n=== Build started at {datetime.datetime.now().isoformat()} ===\\n")
        process = subprocess.Popen(
            command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT
        )
        for line in process.stdout:
            decoded = line.decode("utf-8")
            f.write(decoded)
            print(decoded, end="")
        process.wait()
        f.write(f"\\n=== Build ended at {datetime.datetime.now().isoformat()} ===\\n")
PYEOF

echo "🔄 [5/7] Creating Agent Handoff Loop..."
cat > agent_handoff_loop.py <<'PYEOF'
from whisper_sync import transcribe_and_parse
from build_traces import log_build

cmd = transcribe_and_parse()
if "build" in cmd.lower():
    log_build("npm run build")
elif "deploy" in cmd.lower():
    log_build("vercel --prod")
else:
    print("🤖 No build or deploy command recognized.")
PYEOF

echo "🏗️ [6/7] Running build agent..."
python3 agent_handoff_loop.py

echo "☁️ [7/7] Pushing build log to GitHub..."
git config --global user.name "Cygel White"
git config --global user.email "cygel.co@gmail.com"
git add -f build_trace.log
git commit -m "🤖 Build trace from WhisperSync agent"
git push origin main

echo "✅ Done! Trace synced and build complete."
