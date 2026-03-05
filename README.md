# GMaps Scraper — Windows + Mac

## Quick Summary

| Platform | Build script | Output file | Built on |
|----------|-------------|-------------|---------|
| Windows  | `BUILD_WINDOWS.bat` | `GMaps Scraper Setup.exe` | Windows PC |
| Mac      | `BUILD_MAC.sh`      | `GMaps Scraper.dmg`       | Mac only   |

---

## For Windows

1. Make sure Node.js is installed → https://nodejs.org (LTS version)
2. Double-click **`BUILD_WINDOWS.bat`**
3. EXE appears at: `Desktop\New folder\GMaps Scraper Setup.exe`

---

## For Mac

### Option A — You have a Mac (recommended)
1. Copy this whole folder to your Mac
2. Open Terminal, `cd` into the folder for example - cd C:\Users\laptop villa\Desktop\New folder
3. Run: `chmod +x BUILD_MAC.sh && ./BUILD_MAC.sh`
4. Two DMG files appear in `Desktop/New folder/`:
   - `GMaps Scraper-1.0.0.dmg` → Intel Macs
   - `GMaps Scraper-1.0.0-arm64.dmg` → Apple Silicon (M1/M2/M3)
5.Apple menu → About This Mac → check chip)
