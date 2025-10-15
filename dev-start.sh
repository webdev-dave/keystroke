#!/bin/bash
# Keystroke Daily Development Script
# Run this each time you want to start developing

echo "🎹 Starting Keystroke development..."

# Kill any existing Metro bundler on port 8081
echo "🧹 Cleaning up old Metro instances..."
# Use PowerShell to find and kill process on port 8081 (Windows compatible)
powershell.exe -Command "Get-Process -Name node -ErrorAction SilentlyContinue | Where-Object { (Get-NetTCPConnection -OwningProcess \$_.Id -ErrorAction SilentlyContinue).LocalPort -eq 8081 } | Stop-Process -Force -ErrorAction SilentlyContinue" 2>/dev/null || true
sleep 2

# Check if emulator is running
EMULATOR_COUNT=$("$ANDROID_HOME/platform-tools/adb.exe" devices | grep -c "emulator")

if [ $EMULATOR_COUNT -eq 0 ]; then
  echo "📱 Starting Android emulator..."
  "$ANDROID_HOME/emulator/emulator.exe" -avd Medium_Phone_API_36.1 &
  echo "⏳ Waiting for emulator to boot..."
  sleep 20
else
  echo "✅ Emulator already running"
fi

echo "🚀 Starting Metro bundler..."
echo ""
echo "Metro will start now. After it's ready:"
echo "  - Press 'a' to run on Android"
echo "  - Press 'r' to reload"
echo "  - Press 'j' to open DevTools"
echo "  - Press 'd' to open Dev Menu"
echo ""

# Start Metro (foreground - keeps running)
npm start

