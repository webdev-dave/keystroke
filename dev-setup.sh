#!/bin/bash
# Keystroke Development Setup Script
# Run this once after cloning or creating the project

echo "🎹 Setting up Keystroke development environment..."

# 1. Create Android local.properties
echo "📁 Creating android/local.properties..."
echo "sdk.dir=C:\\\\Users\\\\elido\\\\AppData\\\\Local\\\\Android\\\\Sdk" > android/local.properties

# 2. Install dependencies (if needed)
if [ ! -d "node_modules" ]; then
  echo "📦 Installing npm packages..."
  npm install
fi

# 3. Check if emulator is running
echo "📱 Checking for Android emulator..."
EMULATOR_COUNT=$("$ANDROID_HOME/platform-tools/adb.exe" devices | grep -c "emulator")

if [ $EMULATOR_COUNT -eq 0 ]; then
  echo "⚠️  No emulator detected. Starting emulator..."
  "$ANDROID_HOME/emulator/emulator.exe" -avd Medium_Phone_API_36.1 &
  echo "⏳ Waiting 20 seconds for emulator to boot..."
  sleep 20
else
  echo "✅ Emulator already running"
fi

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Run: npm start (in this terminal)"
echo "  2. Open new terminal and run: npm run android"

