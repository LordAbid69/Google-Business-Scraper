@echo off
title GMaps Scraper - Windows Builder
color 0B
echo.
echo  ============================================
echo    GMaps Scraper - Windows EXE Builder
echo  ============================================
echo.

:: Check Node.js
where node >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo  ERROR: Node.js is not installed!
    echo.
    echo  1. Go to https://nodejs.org
    echo  2. Download the LTS version
    echo  3. Install it, then re-run this script
    echo.
    pause
    exit /b 1
)
echo  [OK] Node.js:
node --version
echo.

:: Install npm packages
echo  [1/3] Installing packages...
echo        Downloads Playwright + Chromium (~200MB). May take a few minutes.
echo.
call npm install
if %errorlevel% neq 0 (
    echo  ERROR: npm install failed. Check internet connection.
    pause
    exit /b 1
)

:: Install Playwright Chromium
echo.
echo  [2/3] Downloading Chromium for Playwright...
call npx playwright install chromium
if %errorlevel% neq 0 (
    echo  WARNING: playwright install had issues but continuing...
)

:: Build Windows EXE only
echo.
echo  [3/3] Building Windows installer EXE...
call npx electron-builder --win --x64
if %errorlevel% neq 0 (
    echo  ERROR: Build failed. See errors above.
    pause
    exit /b 1
)

echo.
echo  ============================================
echo   SUCCESS! Windows EXE ready at:
echo   Desktop\New folder\GMaps Scraper Setup.exe
echo  ============================================
echo.
pause
