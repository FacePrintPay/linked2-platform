#!/data/data/com.termux/files/usr/bin/bash

echo "🔁 [1/6] Cleaning any old build..."
rm -rf .next out dist node_modules

echo "📦 [2/6] Installing dependencies..."
npm install

echo "🏗️  [3/6] Building project..."
npm run build || npm run vercel-build || echo "⚠️ Build failed. Check your build command!"

echo "🌐 [4/6] Preparing static export (if React)..."
npm run export || echo "ℹ️ No static export step needed for this project."

echo "☁️ [5/6] Deploying to Vercel..."
vercel --prod --yes

echo "✅ [6/6] Deployment Complete. Visit your Vercel URL to confirm!"
