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
