@echo off

whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 powershell -Command "try { start-process %~f0 -verb runas } catch { Write-Host 'Error: ' $_.Exception.Message; pause }"
 exit
)

reg delete "HKEY_CLASSES_ROOT\*\shell\video2mp3"
echo �t�@�C���͎����ō폜���Ă�
pause