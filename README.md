# 🎹 Keystroke - Piano Keyboard Vision App

A React Native mobile app that lets you draw a piano keyboard on paper, point your phone camera at it, and play notes by touching the drawn keys with a bright orange fingertip/glove.

**Target Platform:** Android  
**Tech Stack:** React Native 0.76.6 (TypeScript), react-native-vision-camera, react-native-worklets-core

---

## 🚀 Quick Start

### First Time Setup

```bash
# Run setup (creates local.properties, installs deps, starts emulator)
npm run dev:setup

# Or manually with bash script (Git Bash only)
chmod +x dev-setup.sh dev-start.sh
./dev-setup.sh
```

### Daily Development

```bash
# Start everything (auto-kills old Metro, starts emulator if needed)
npm run dev

# Or manually:
# Terminal 1: npm start
# Terminal 2: npm run android
```

---

## 📦 NPM Commands

### Core Commands

```bash
npm run dev                # Start dev environment (auto-kills old Metro)
npm run dev:setup          # First time setup
npm start                  # Start Metro bundler only
npm run android            # Build and run on Android
npm start -- --reset-cache # Start Metro with clean cache
```

### Utility Commands

```bash
npm run dev:kill           # Kill Metro bundler
npm run dev:reload         # Reload app without rebuilding (RR)
npm run dev:menu           # Open React Native dev menu
npm run dev:clean          # Clean build (nuclear option)
```

---

## 🎯 Development Workflow

1. **Start Metro**: `npm start` (keep running in one terminal)
2. **Build & Install**: `npm run android` (first time or after native changes)
3. **Code**: Edit TypeScript/JavaScript files
4. **Hot Reload**: Save files → changes appear automatically
5. **Manual Reload**: Double-tap **R** in emulator, or `npm run dev:reload`
6. **Dev Menu**: Press **Ctrl+M** in emulator, or `npm run dev:menu`
7. **DevTools**: Press **j** in Metro terminal

---

## 🔧 Advanced Commands (Git Bash)

### Emulator Management

```bash
# List available emulators
"$ANDROID_HOME/emulator/emulator.exe" -list-avds

# Start specific emulator
"$ANDROID_HOME/emulator/emulator.exe" -avd Medium_Phone_API_36.1 &

# Check connected devices
"$ANDROID_HOME/platform-tools/adb.exe" devices

# Restart app
"$ANDROID_HOME/platform-tools/adb.exe" shell am force-stop com.keystroke_rn_v0_76
"$ANDROID_HOME/platform-tools/adb.exe" shell am start -n com.keystroke_rn_v0_76/com.keystroke_rn_v0_76.MainActivity
```

### Debugging

```bash
# View Android logs (logcat)
"$ANDROID_HOME/platform-tools/adb.exe" logcat

# View React Native logs (filtered)
"$ANDROID_HOME/platform-tools/adb.exe" logcat | grep ReactNative

# Open dev menu manually
"$ANDROID_HOME/platform-tools/adb.exe" shell input keyevent 82
```

### Clean Build (When Things Break)

```bash
# Clean Android build
cd android && ./gradlew clean && cd ..

# Clean Metro cache
npm start -- --reset-cache

# Nuclear option - clean everything
rm -rf node_modules android/build android/app/build
npm install
cd android && ./gradlew clean && cd ..
```

---

## ⚠️ Troubleshooting

### White Screen on App Launch

1. Check `babel.config.js` includes worklets plugin: `plugins: ['react-native-worklets-core/plugin']`
2. Restart Metro with clean cache: `npm start -- --reset-cache`
3. Force reload app: `npm run dev:reload` or double-tap **R** in emulator

### Metro Bundler Crashes

- Already fixed: `metro.config.js` excludes Android build folders
- If it still crashes, run: `npm run dev:kill` then restart

### Build Failures

1. Ensure `android/local.properties` exists:
   ```
   sdk.dir=C:\\Users\\elido\\AppData\\Local\\Android\\Sdk
   ```
2. Clean build: `npm run dev:clean`
3. Check Android SDK is installed at `%ANDROID_HOME%`

### Port 8081 Already in Use

```bash
# Use npm command to kill Metro
npm run dev:kill

# Or manually (Git Bash)
lsof -ti:8081 | xargs kill -9
pkill -f metro
```

### App Not Connecting to Metro

1. Check emulator is running: `"$ANDROID_HOME/platform-tools/adb.exe" devices`
2. Reload app: `npm run dev:reload`
3. Restart Metro: Kill it and run `npm start`

---

## 📁 Project Structure

```
keystroke_rn_v0_76/
├── android/                          # Android native code
│   ├── app/
│   │   ├── build.gradle             # App-level Gradle config
│   │   └── src/main/
│   │       ├── AndroidManifest.xml  # Permissions & app config
│   │       └── java/                # Kotlin native code
│   ├── build.gradle                 # Project-level Gradle config
│   └── local.properties             # SDK path (not in git)
├── App.tsx                          # Main app component
├── babel.config.js                  # Babel config (includes worklets plugin)
├── metro.config.js                  # Metro config (excludes build folders)
├── package.json                     # Dependencies & npm scripts
├── dev-setup.sh                     # First time setup script
└── dev-start.sh                     # Daily dev startup script
```

---

## 📚 Important Files

### `babel.config.js`

**Must include worklets plugin** for react-native-vision-camera to work:

```js
plugins: ['react-native-worklets-core/plugin'];
```

### `metro.config.js`

Configured to exclude Android build folders (prevents crashes):

```js
blockList: [
  /node_modules\/.*\/android\/build\/.*/,
  /node_modules\/.*\/android\/.cxx\/.*/,
];
```

### `android/local.properties`

**Not in git** - contains SDK path:

```
sdk.dir=C:\\Users\\elido\\AppData\\Local\\Android\\Sdk
```

### `android/app/src/main/AndroidManifest.xml`

Contains app permissions (camera, etc.)

---

## 💡 Pro Tips

- **Keep Metro running** in one terminal always - don't restart unless necessary
- **Only run `npm run android`** after changing native code (Java/Kotlin/Gradle/manifests)
- **Use `npm start -- --reset-cache`** after adding/removing npm packages
- **Git Bash works better** than PowerShell for React Native development
- **Use npm commands** (`npm run dev`, `npm run dev:*`) - they work in any terminal (PowerShell, Git Bash, CMD)
- **Hot reload is your friend** - most JS/TS changes appear instantly without rebuilding

---

## 🏗️ What We've Built So Far

- ✅ Fresh React Native 0.76.6 project
- ✅ react-native-vision-camera installed
- ✅ react-native-worklets-core configured
- ✅ Babel plugin for worklets
- ✅ Metro config optimized
- ✅ Android local.properties setup
- ✅ Development scripts (dev-setup.sh, dev-start.sh)
- ✅ NPM command shortcuts
- ✅ App successfully running on emulator

---

## 🎯 Next Steps (TODO)

1. Configure camera permissions in AndroidManifest.xml
2. Create basic Camera component using react-native-vision-camera
3. Add frame processor with orange color detection
4. Implement orange object tracking algorithm
5. Choose and install audio library for piano notes
6. Map detected finger position to keyboard regions (8 zones: C-D-E-F-G-A-B-C)
7. Play corresponding notes when finger touches each zone
8. Add visual feedback/overlay showing detection
9. Performance optimization for real-time processing

---

## 🔗 Resources

- [React Native Docs](https://reactnative.dev/docs/getting-started)
- [Vision Camera Docs](https://react-native-vision-camera.com/)
- [Worklets Core](https://github.com/margelo/react-native-worklets-core)
- [React Native Troubleshooting](https://reactnative.dev/docs/troubleshooting)
