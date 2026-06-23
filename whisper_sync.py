import os, whisper, shutil
from datetime import datetime

model = whisper.load_model("base")
INPUT_DIR = "input/"
ARCHIVE_DIR = "archive/"
LOG_FILE = "transcripts.log"
TRIGGERS = ["deploy", "summary", "push"]

os.makedirs(INPUT_DIR, exist_ok=True)
os.makedirs(ARCHIVE_DIR, exist_ok=True)

def log(text, fname):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(LOG_FILE, "a") as f:
        f.write(f"\n[{timestamp}] {fname}:\n{text}\n")
    print(f"✅ Logged: {fname}")

def archive(fname):
    src = os.path.join(INPUT_DIR, fname)
    dst = os.path.join(ARCHIVE_DIR, f"{datetime.now().strftime('%Y%m%d_%H%M%S')}_{fname}")
    shutil.move(src, dst)
    print(f"📦 Archived: {fname}")

def trigger_actions(text):
    for trig in TRIGGERS:
        if trig in text.lower():
            print(f"🚨 Trigger Detected: [{trig}] → Executing hook...")
            os.system(f"echo '🧠 Agent Trigger [{trig}] activated!'")

print("🎙️ WhisperSync v2 Running...")

while True:
    for fname in os.listdir(INPUT_DIR):
        if not fname.lower().endswith((".mp3", ".wav", ".txt")):
            continue

        print(f"🔍 Processing: {fname}")
        full_path = os.path.join(INPUT_DIR, fname)

        if fname.endswith((".mp3", ".wav")):
            result = model.transcribe(full_path)
            text = result["text"]
        else:
            with open(full_path, "r") as f:
                text = f.read()

        log(text, fname)
        trigger_actions(text)
        archive(fname)
