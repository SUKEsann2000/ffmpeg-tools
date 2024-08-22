@echo off
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 @powershell start-process %~0 -verb runas
 exit
)

echo このプログラムはレジストリを変更することで右クリックメニューに追加できるけどどうする？
:RESTART
set /p yn_check="Which do you like (y/n)"
IF %yn_check:Y=Y%==Y (
	rem レジストリ変更するなら
	reg add "HKEY_CLASSES_ROOT\*\shell\video2mp3" /ve /d "videoのファイルをmp3に変換"
	echo %~dp0"video-2-mp3.bat %%1"
	reg add "HKEY_CLASSES_ROOT\*\shell\video2mp3\command" /ve /d "%~dp0video-2-mp3.bat %%1"
	pause
) ELSE IF %yn_check:N=N%==N  (
	rem レジストリ変更なし
	
) ELSE (
  echo "sorry, please type y/n"
GOTO RESTART
)