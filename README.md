# ⚛️ React Native 0.76 Windows Development Template

A production-ready React Native template optimized for Windows development with one-command startup, auto-cleanup, and an optimized dev workflow.

**Target Platform:** Android (iOS ready)  
**React Native:** 0.76.6 (TypeScript)  
**OS:** Windows 10/11

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
# Start everything (auto-kills old Metro, starts emulator, launches app)
npm run dev

# That's it! One command does everything automatically.
```

**What `npm run dev` does:**

1. Kills any old Metro instances
2. Starts Android emulator (if not running)
3. Starts Metro bundler
4. Waits for Metro to be ready
5. Automatically builds and launches the app on Android

**No need to press 'a' or run any other commands!**

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

### Option 1: All-in-One (Recommended)

1. **Start Everything**: `npm run dev` (does everything automatically)
2. **Code**: Edit TypeScript/JavaScript files
3. **Hot Reload**: Save files → changes appear automatically

### Option 2: Manual Control

1. **Start Metro**: `npm start` (keep running in one terminal)
2. **Build & Install**: `npm run android` (in another terminal)
3. **Code**: Edit TypeScript/JavaScript files
4. **Hot Reload**: Save files → changes appear automatically

### Useful Commands While Developing

- **Manual Reload**: Double-tap **R** in emulator, or `npm run dev:reload`
- **Dev Menu**: Press **Ctrl+M** in emulator, or `npm run dev:menu`
- **DevTools**: Press **j** in Metro terminal

---

## 🔧 Advanced Commands (Git Bash)

### Emulator Management

```bash
# List available emulators
"$ANDROID_HOME/emulator/emulator.exe" -list-avds

# Start specific emulator
"$ANDROID_HOME/emulator/emulator.exe" -avd YOUR_AVD_NAME &

# Check connected devices
"$ANDROID_HOME/platform-tools/adb.exe" devices

# Restart app
"$ANDROID_HOME/platform-tools/adb.exe" shell am force-stop com.YOUR_PACKAGE_NAME
"$ANDROID_HOME/platform-tools/adb.exe" shell am start -n com.YOUR_PACKAGE_NAME/.MainActivity
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

### Metro Bundler Crashes

- **Already fixed**: `metro.config.js` excludes Android build folders
- If it still crashes, run: `npm run dev:kill` then restart

### Build Failures

1. Ensure `android/local.properties` exists:
   ```
   sdk.dir=C:\\Users\\YOUR_USERNAME\\AppData\\Local\\Android\\Sdk
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

### Hot Reload Not Working

1. Check Metro is running and connected
2. Try manual reload: Double-tap **R** in emulator
3. Force reload: `npm run dev:reload`
4. Restart everything: `npm run dev`

---

## 📁 Project Structure

```
rn-windows-template/
├── android/                          # Android native code
│   ├── app/
│   │   ├── build.gradle             # App-level Gradle config
│   │   └── src/main/
│   │       ├── AndroidManifest.xml  # Permissions & app config
│   │       └── java/                # Kotlin native code
│   ├── build.gradle                 # Project-level Gradle config
│   └── local.properties             # SDK path (not in git)
├── App.tsx                          # Main app component
├── babel.config.js                  # Babel config
├── metro.config.js                  # Metro config (excludes build folders)
├── package.json                     # Dependencies & npm scripts
├── dev-setup.sh                     # First time setup script
└── dev-start.sh                     # Daily dev startup script
```

---

## 📚 Important Files

### `metro.config.js`

Configured to exclude Android build folders (prevents crashes):

```js
blockList: [
  /node_modules\/.*\/android\/build\/.*/,
  /node_modules\/.*\/android\/.cxx\/.*/,
  /android\/app\/build\/.*/,
  /android\/build\/.*/,
];
```

### `android/local.properties`

**Not in git** - contains SDK path (created by `dev-setup.sh`):

```
sdk.dir=C:\\Users\\YOUR_USERNAME\\AppData\\Local\\Android\\Sdk
```

### `android/app/src/main/AndroidManifest.xml`

Contains app permissions. Add permissions here as needed:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<!-- Add more permissions as needed -->
```

---

## 💡 Pro Tips

- **Keep Metro running** in one terminal always - don't restart unless necessary
- **Only run `npm run android`** after changing native code (Java/Kotlin/Gradle/manifests)
- **Use `npm start -- --reset-cache`** after adding/removing npm packages
- **Git Bash works better** than PowerShell for React Native development
- **Use npm commands** (`npm run dev`, `npm run dev:*`) - they work in any terminal
- **Hot reload is your friend** - most JS/TS changes appear instantly without rebuilding

---

## 🛠️ What Makes This Template Special

- ✅ **One-command startup** - `npm run dev` does everything
- ✅ **Auto Metro cleanup** - Kills old instances automatically
- ✅ **Auto app launch** - No need to press 'a' in Metro
- ✅ **Optimized Metro config** - Excludes build folders to prevent crashes
- ✅ **Windows-optimized scripts** - Works with Git Bash on Windows
- ✅ **Utility commands** - Kill, reload, menu shortcuts
- ✅ **Clean build command** - Nuclear option when things break
- ✅ **Production-ready** - TypeScript, ESLint, Jest configured

---

## 🔗 Customization

### Update Package Name

1. **Update `package.json`**: Change `name` field
2. **Update `app.json`**: Change `name` and `displayName`
3. **Update Android package**: Follow [React Native rename guide](https://reactnative.dev/docs/0.60/upgrading#manual-upgrades)

### Update Emulator Name

In `dev-setup.sh` and `dev-start.sh`, replace `Medium_Phone_API_36.1` with your AVD name:

```bash
# Find your AVD name
"$ANDROID_HOME/emulator/emulator.exe" -list-avds

# Update scripts with your AVD name
```

### Add Native Dependencies

After installing packages with native code:

```bash
# Install package
npm install package-name

# Clean cache and rebuild (native changes)
npm run dev:clean
npm run android
```

---

## 🔗 Resources

- [React Native Docs](https://reactnative.dev/docs/getting-started)
- [React Native Troubleshooting](https://reactnative.dev/docs/troubleshooting)
- [Metro Bundler](https://metrobundler.dev/)
- [Android Studio Setup](https://reactnative.dev/docs/set-up-your-environment)

---

## 📄 License

This template is free to use for any purpose. No attribution required.

---

**Happy coding! 🚀**
