@echo off
cd /d "%~dp0"
call npx.cmd --yes jupyter-book@2.1.7 start
pause
