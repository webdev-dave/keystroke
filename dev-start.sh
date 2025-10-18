#!/bin/bash
# React Native Daily Development Script
# Run this each time you want to start developing

echo "🚀 Starting React Native development..."

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

# Start Metro in background
npm start &
METRO_PID=$!

echo "⏳ Waiting for Metro to be ready..."
# Wait for Metro to start (check if port 8081 is listening)
for i in {1..30}; do
  if netstat -an | grep -q ":8081.*LISTENING" 2>/dev/null || \
     powershell.exe -Command "Get-NetTCPConnection -LocalPort 8081 -State Listen -ErrorAction SilentlyContinue" 2>/dev/null | grep -q "8081"; then
    echo "✅ Metro is ready!"
    break
  fi
  sleep 1
done

echo "🚀 Launching app on Android..."
npx react-native run-android --no-packager

echo ""
echo "✅ App launched! Metro commands:"
echo "  - Press Ctrl+C to stop Metro"
echo "  - In emulator: Ctrl+M for dev menu, RR to reload"
echo ""

# Keep script running to show Metro logs
wait $METRO_PID

