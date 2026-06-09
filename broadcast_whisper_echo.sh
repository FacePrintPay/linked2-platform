#!/bin/bash
WEBHOOK_URL="https://discord.com/api/webhooks/your_webhook_id/your_webhook_token"  # 🔁 Replace with your real Discord webhook
VOICE_MSG="$1"
JSON=$(cat <<EOF
{
  "username": "WhisperOps Bot",
  "content": "**🎙️ Whisper Echo**\n> $VOICE_MSG\n\n*They can try to imitate… but they'll **never** replicate.*\n— **Mr. GTTP**  (#GTP_001 · VerseDNA_Alpha)"
}
EOF
)
curl -H "Content-Type: application/json" -X POST -d "$JSON" "$WEBHOOK_URL"
echo "✅ Discord voice echo sent."
