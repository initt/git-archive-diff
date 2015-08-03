@echo off
cd %appdata%\..\local\Atlassian\SourceTree\git_local\

SET REPO=%1
SET NEW_SHA=%2
SET OLD_SHA=%3

if "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
  SET COMSPEC=%WINDIR%\SysWOW64\cmd.exe
)

SET BIN=bin

if NOT EXIST %REPO%\nul goto EOF
if EXIST %BIN%bash.exe goto startbash

:startbash
call %COMSPEC% /c %BIN%\bash --login -i -c "git-archive-diff.sh %REPO:\=/% %NEW_SHA% %OLD_SHA%"

:EOF