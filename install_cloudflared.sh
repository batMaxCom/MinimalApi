#!/data/data/com.termux/files/usr/bin/bash

set -e  # Остановиться при ошибке

echo "🔍 Определение архитектуры..."

ARCH=$(uname -m)

case "$ARCH" in
    aarch64)
        FILE="cloudflared-linux-arm64"
        ;;
    armv7l|armv8l)
        FILE="cloudflared-linux-arm"
        ;;
    x86_64)
        FILE="cloudflared-linux-amd64"
        ;;
    i686)
        FILE="cloudflared-linux-386"
        ;;
    *)
        echo "❌ Неизвестная архитектура: $ARCH"
        exit 1
        ;;
esac

echo "📥 Скачивание подходящей версии: $FILE ..."
curl -LO "https://github.com/cloudflare/cloudflared/releases/latest/download/$FILE"

echo "🔧 Настройка прав на выполнение..."
chmod +x "$FILE"

echo "📦 Переименование в 'cloudflared'..."
mv "$FILE" cloudflared

echo "✅ Успешно! Запусти ./cloudflared --version, чтобы проверить."
