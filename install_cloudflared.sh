#!/data/data/com.termux/files/usr/bin/bash

echo "📥 Скачивание cloudflared для Linux ARM..."
curl -LO https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm

echo "🔧 Настройка прав..."
chmod +x cloudflared-linux-arm

echo "📦 Переименование в 'cloudflared'..."
mv cloudflared-linux-arm cloudflared

echo "✅ Г