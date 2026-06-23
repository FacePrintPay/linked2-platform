#!/data/data/com.termux/files/usr/bin/bash

echo "🔁 [1/7] Cleaning and preparing environment..."
rm -rf node_modules build_trace.log
pkg install -y python ffmpeg git nodejs

echo "📦 [2/7] Installing NPM packages..."
npm install

echo "📜 [3/7] Creating WhisperSync fallback script..."
cat > whisper_sync.py <<EOF
def transcribe_and_parse():
    return "build project"
EOF

echo "🧠 [4/7] Creating BuildTraces agent..."
cat > build_traces.py <<EOF
import subprocess, datetime

def log_build(command="npm run build", logfile="build_trace.log"):
    timestamp = datetime.datetime.now().isoformat()
    with open(logfile, "a") as f:
        f.write(f"\\n\\n=== Build started at {timestamp} ===\\n")
        process = subprocess.Popen(
            command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT
        )
        for line in process.stdout:
            decoded = line.decode("utf-8")
            f.write(decoded)
            print(decoded, end="")
        process.wait()
        f.write(f"\\n=== Build ended
