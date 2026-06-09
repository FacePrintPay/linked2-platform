#!/data/data/com.termux/files/usr/bin/bash

echo "🔁 [1/5] Syncing GitHub Remote..."
git remote remove origin 2>/dev/null
git remote add origin https://github.com/TheKre8tive/Linked2-platform.git
git branch -M main

echo "📦 [2/5] Adding Files..."
git add .
git commit -m '🔥 Finalized BashIt LINQ2 Platform Deployment'

echo "☁️ [3/5] Pushing to GitHub..."
git push -u origin main

echo "🚀 [4/5] Deploying to Vercel..."
vercel --prod --confirm

echo "✅ [5/5] Deployment Complete. Visit: https://linked2.vercel.app"
