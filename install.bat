@echo off
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 @powershell start-process %~0 -verb runas
 exit
)

echo ���̃v���O�����̓��W�X�g����ύX���邱�ƂŉE�N���b�N���j���[�ɒǉ��ł��邯�ǂǂ�����H
:RESTART
set /p yn_check="Which do you like (y/n)"
IF %yn_check:Y=Y%==Y (
	rem ���W�X�g���ύX����Ȃ�
	reg add "HKEY_CLASSES_ROOT\*\shell\video2mp3" /ve /d "video�̃t�@�C����mp3�ɕϊ�"
	echo %~dp0"video-2-mp3.bat %%1"
	reg add "HKEY_CLASSES_ROOT\*\shell\video2mp3\command" /ve /d "%~dp0video-2-mp3.bat %%1"
	pause
) ELSE IF %yn_check:N=N%==N  (
	rem ���W�X�g���ύX�Ȃ�
	
) ELSE (
  echo "sorry, please type y/n"
GOTO RESTART
)