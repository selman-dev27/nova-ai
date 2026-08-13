@echo off
setlocal
cd /d "%~dp0"
where gradle >nul 2>nul
if errorlevel 1 (
  echo Gradle PATH uzerinde bulunamadi.
  echo Android Studio ile bu klasoru acip Build APK secenegini kullanin.
  exit /b 1
)
gradle assembleDebug
if errorlevel 1 exit /b 1
echo APK: app\build\outputs\apk\debug\app-debug.apk
