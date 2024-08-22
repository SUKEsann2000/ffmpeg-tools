@echo off
echo Hello.
echo This program will convert video file to mp3 file.
echo;

echo Please specify the video file as the first argument and the mp3 file as the second argument.
pause

set path=%~dp0ffmpeg;%PATH%

echo;
echo ffmpegVersionCheck...
ffmpeg -version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
	echo ERROR: There is no ffmpeg path.
	pause
	exit /b 1
)
echo;

echo -----converter-----
if not exist %1 (
	echo ERROR: There isn't mp4 file
	pause
	exit /b 1
)

echo "%~nx1" was loaded
echo Full:"%~f1"

echo;
echo -----ffmpeg-----
ffmpeg -i "%~f1" -q:a 1 "%~dp1\%~n1.mp3"
pause
echo;

echo -----converter-----
echo Thank you for using
pause