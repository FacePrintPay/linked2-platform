export default function Home() {
  return (
    <div className="bg-black text-lime-400 min-h-screen p-6 font-mono">
      <h1 className="text-3xl">🧠 ARC.AI Ops Console</h1>
      <p className="mt-4">Welcome to your AI deployment dashboard.</p>
      <ul className="list-disc ml-6 mt-4 space-y-2">
        <li>🎙️ WhisperSync: <span id="whisper-status">Active</span></li>
        <li>🖥️ Terminal: <span id="term-status">Live</span></li>
        <li>👽 Planetary Agents: <span id="agent-status">Online</span></li>
      </ul>
      <div className="mt-6">
        <a className="text-blue-400 underline" href="https://github.com/TheKre8tive">View Repo</a>
      </div>
    </div>
  );
}

<a href="https://github.com/TheKre8tive/Linked2-platform.git" target="_blank" rel="noopener noreferrer" className="text-blue-400 underline mt-4 block">View Code on GitHub</a>
