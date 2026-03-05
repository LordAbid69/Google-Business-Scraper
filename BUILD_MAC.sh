#!/bin/bash

echo ""
echo "============================================"
echo "  GMaps Scraper - Mac DMG Builder"
echo "  Run this script ON a Mac to build the .dmg"
echo "============================================"
echo ""

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "ERROR: Node.js is not installed!"
    echo ""
    echo "  1. Go to https://nodejs.org"
    echo "  2. Download the LTS version"
    echo "  3. Install it, then re-run this script"
    echo ""
    exit 1
fi

echo "[OK] Node.js: $(node --version)"
echo ""

# Install packages
echo "[1/3] Installing packages..."
echo "      Downloads Playwright + Chromium (~200MB). May take a few minutes."
echo ""
npm install
if [ $? -ne 0 ]; then
    echo "ERROR: npm install failed. Check internet connection."
    exit 1
fi

# Install Playwright Chromium
echo ""
echo "[2/3] Downloading Chromium for Playwright..."
npx playwright install chromium
if [ $? -ne 0 ]; then
    echo "WARNING: playwright install had issues but continuing..."
fi

# Build Mac DMG
echo ""
echo "[3/3] Building Mac DMG..."
echo "      Builds for both Intel (x64) and Apple Silicon (arm64)"
npx electron-builder --mac
if [ $? -ne 0 ]; then
    echo "ERROR: Build failed. See errors above."
    exit 1
fi

echo ""
echo "============================================"
echo " SUCCESS! Mac DMG ready."
echo ""
echo " Output folder: Desktop/New folder/"
echo " Files created:"
echo "   GMaps Scraper-x.x.x.dmg        (Intel Mac)"
echo "   GMaps Scraper-x.x.x-arm64.dmg  (Apple Silicon M1/M2/M3)"
echo ""
echo " Your client double-clicks the DMG, drags"
echo " the app to Applications, and it's ready."
echo " No installs needed on their Mac."
echo "============================================"
echo ""
