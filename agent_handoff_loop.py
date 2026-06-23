from whisper_sync import transcribe_and_parse
from build_traces import log_build

cmd = transcribe_and_parse()
if "build" in cmd.lower():
    log_build("npm run build")
elif "deploy" in cmd.lower():
    log_build("vercel --prod")
else:
    print("🤖 No build or deploy command recognized.")
