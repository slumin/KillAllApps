@echo off
chcp 65001 >nul
title KillAllApps v1.1
setlocal EnableDelayedExpansion

:: Enable ANSI escape codes
for /F "delims=" %%e in ('echo prompt $E^|cmd') do set "ESC=%%e"

:: Enable Virtual Terminal Processing (for ANSI codes)
reg add "HKCU\Console" /f /v VirtualTerminalLevel /t REG_DWORD /d 1 >nul 2>&1

:menu
cls
echo.

:: Define rainbow color codes
set "color1=%ESC%[38;2;255;0;0m"       :: Red
set "color2=%ESC%[38;2;255;127;0m"     :: Orange
set "color3=%ESC%[38;2;255;255;0m"     :: Yellow
set "color4=%ESC%[38;2;0;255;0m"       :: Green
set "color5=%ESC%[38;2;0;0;255m"       :: Blue
set "color6=%ESC%[38;2;75;0;130m"      :: Indigo
set "color7=%ESC%[38;2;148;0;211m"     :: Violet
set "reset=%ESC%[0m"

:: Add top border

:: Display the ASCII art with rainbow gradient
echo                   %color1%     ▄ •▄ ▪  ▄▄▌  ▄▄▌              %reset%
echo                   %color2%     █▌▄▌▪██ ██•  ██•              %reset%
echo                   %color3%     ▐▀▀▄·▐█·██▪  ██▪              %reset%
echo                   %color4%     ▐█.█▌▐█▌▐█▌▐▌▐█▌▐▌            %reset%
echo                   %color5%     ·▀  ▀▀▀▀.▀▀▀ .▀▀▀             %reset%
echo                   %color6%          ▄▄▄· ▄▄▌  ▄▄▌            %reset%
echo                   %color7%         ▐█ ▀█ ██•  ██•            %reset%
echo                   %color1%         ▄█▀▀█ ██▪  ██▪            %reset%
echo                   %color2%         ▐█ ▪▐▌▐█▌▐▌▐█▌▐▌          %reset%
echo                   %color3%          ▀  ▀ .▀▀▀ .▀▀▀           %reset%
echo                   %color4%              ▄▄▄·  ▄▄▄· ▄▄▄·.▄▄ · %reset%
echo                   %color5%             ▐█ ▀█ ▐█ ▄█▐█ ▄█▐█ ▀. %reset%
echo                   %color6%             ▄█▀▀█  ██▀· ██▀·▄▀▀▀█▄%reset%
echo                   %color7%             ▐█ ▪▐▌▐█▪·•▐█▪·•▐█▄▪▐█%reset%
echo                   %color1%              ▀  ▀ .▀   .▀    ▀▀▀▀ %reset%
echo                   %color4%Made by Lunch%reset%
echo.

:: Menu Options
echo                              %color5%1.%reset% %color4%Start killing resource stealers%reset%
echo                              %color5%2.%reset% %color4%Exit%reset%
echo.
set /p choice=Please enter your choice [1-2]: 

if "%choice%"=="1" (
    goto kill_processes
) else if "%choice%"=="2" (
    exit
) else (
    echo %color3%Invalid choice. Please try again.%reset%
    timeout /t 2 >nul
    goto menu
)

:kill_processes
cls
echo.
echo %color4%     Closing resource stealing applications...%reset%
echo.

REM List of essential system processes to exclude, separated by commas
set "essential_processes=SystemIdleProcess,System,Registry,smss.exe,csrss.exe,wininit.exe,winlogon.exe,services.exe,lsass.exe,svchost.exe,explorer.exe,spoolsv.exe,taskhostw.exe,dwm.exe,fontdrvhost.exe,sihost.exe,ctfmon.exe,ShellExperienceHost.exe,SearchUI.exe,StartMenuExperienceHost.exe,RuntimeBroker.exe,ApplicationFrameHost.exe,TextInputHost.exe,audiodg.exe,fontdrvhost.exe,cmd.exe,conhost.exe,powershell.exe,taskeng.exe,taskmgr.exe,CloseNonEssentialApps.bat"

REM Initialize counter
set "process_count=0"

REM Get the list of running processes for the current user in CSV format
for /F "skip=1 tokens=1 delims=," %%A in ('tasklist /FI "USERNAME eq %USERNAME%" /FO CSV /NH') do (
    set "process_name=%%~A"
    set "process_name=!process_name:"=!"
    call :IsEssentialProcess "!process_name!"
    if "!IS_ESSENTIAL!"=="false" (
        echo %color4%Terminating !process_name!%reset%
        taskkill /F /IM "!process_name!" >nul 2>&1
        set /A process_count+=1
    )
)

echo.
echo %color4%     Total resource stealers terminated: %process_count%%reset%
echo.
echo %color4%     Your system has been cleansed.%reset%
echo.
echo %color4%Press Enter to exit...%reset%
pause >nul
exit /b

:IsEssentialProcess
set "IS_ESSENTIAL=false"
for %%E in (%essential_processes%) do (
    if /I "%~1"=="%%~E" (
        set "IS_ESSENTIAL=true"
        goto :eof
    )
)
goto :eof
