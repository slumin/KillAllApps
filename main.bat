@echo off
title KillAllApps v1.1 - Halloween Edition
setlocal EnableDelayedExpansion
chcp 65001 >nul
mode con: cols=110 lines=40

:: Enable ANSI escape codes
for /F "delims=" %%e in ('echo prompt $E^|cmd') do set "ESC=%%e"
reg add "HKCU\Console" /f /v VirtualTerminalLevel /t REG_DWORD /d 1 >nul 2>&1

:: Define color codes
set "color1=%ESC%[38;2;255;165;0m"     :: Orange
set "color2=%ESC%[38;2;128;0;128m"     :: Purple
set "color3=%ESC%[38;2;255;0;0m"       :: Red
set "color4=%ESC%[38;2;200;0;0m"       :: Dark Red
set "color5=%ESC%[38;2;150;0;0m"       :: Deeper Red
set "reset=%ESC%[0m"

:menu
cls
echo.

:: Display new Halloween ASCII art
echo %color1%                                      ▓▓▓▓              ████                                            
echo %color1%                                      ██▓▓▓▓          ▓▓▓▓██                                            
echo %color1%                                      ██▓▓▒▒██      ██▓▓▒▒██                                            
echo %color1%                                      ██▓▓▓▓▓▓██████▓▓▓▓▒▒██                                            
echo %color1%                              ██▓▓    ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒██    ▓▓▓▓                                    
echo %color1%                              ░░░░██  ██▓▓▓▓░░▓▓▓▓▓▓░░▓▓▒▒██  ▓▓░░░░                                    
echo %color1%                                  ░░  ██▓▓▓▓  ▓▓▓▓██  ▓▓▒▒██  ░░                                        
echo %color1%                              ██████  ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒██  ██████                                    
echo %color1%                                        ██▓▓▓▓▓▓▓▓▓▓▓▓▒▒██              ██▓▓              ▓▓██          
echo %color1%                                        ░░██████████████░░              ██▓▓▓▓          ▓▓▓▓██          
echo %color1%                            ██████      ██▓▓▓▓▓▓▓▓▓▓▒▒▒▒██              ██▓▓▒▒██      ██▓▓▒▒██          
echo %color1%                          ██▓▓▓▓██    ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒██              ██▓▓▓▓▓▓██████▓▓▓▓▒▒██          
echo %color1%                          ██▓▓██      ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒██      ████    ██▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▒▒██    ████  
echo %color1%                          ██▓▓██    ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒██          ██  ██▓▓██  ▓▓▓▓▓▓  ▓▓▒▒██  ██      
echo %color1%                          ██▓▓██  ██▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒██              ██▓▓██  ▓▓▓▓▓▓  ▓▓▒▒██          
echo %color1%                          ██▓▓██    ██▓▓▓▓▓▓▒▒▒▒▒▒▓▓▓▓▒▒██      ██████  ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒██  ██████  
echo %color1%                          ██▓▓██    ██▓▓▓▓▓▓▓▓▒▒▒▒▒▒██▒▒██                ██▓▓▓▓▓▓▓▓▓▓▓▓▒▒██            
echo %color1%                            ██▓▓▓▓  ██▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▓▓██            ▓▓▓▓██████████████████            
echo %color1%                            ██▓▓██  ██▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▓▓██          ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒██          
echo %color1%                              ████████▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒██          ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒██        
echo %color1%                            ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒██    ▓▓▓▓▓▓▓▓████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒██      
echo %color1%                        ▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒████▓▓▓▓▓▓▓▓▓▓▓▓▒▒██      
echo %color1%                      ▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒░░░░▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▓▓▒▒░░░░▒▒░░▒▒▒▒▒▒▒▒██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    
echo %color1%                    ▓▓▒▒░░░░▒▒▒▒░░▒▒░░░░░░▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒░░▒▒▒▒░░░░░░▒▒▒▒▒▒██▓▓▓▓▓▓▓▓▓▓▒▒██  

:: Display additional ASCII text (shades of red)
echo %color3% ██ ▄█▀ ██▓ ██▓     ██▓        ▄▄▄       ██▓     ██▓        ▄▄▄       ██▓███   ██▓███    ██████ %reset%
echo %color3% ██▄█▒ ▓██▒▓██▒    ▓██▒       ▒████▄    ▓██▒    ▓██▒       ▒████▄    ▓██░  ██▒▓██░  ██▒▒██    ▒ %reset%
echo %color4%▓███▄░ ▒██▒▒██░    ▒██░       ▒██  ▀█▄  ▒██░    ▒██░       ▒██  ▀█▄  ▓██░ ██▓▒▓██░ ██▓▒░ ▓██▄   %reset%
echo %color4%▓██ █▄ ░██░▒██░    ▒██░       ░██▄▄▄▄██ ▒██░    ▒██░       ░██▄▄▄▄██ ▒██▄█▓▒ ▒▒██▄█▓▒ ▒  ▒   ██▒%reset%
echo %color5%▒██▒ █▄░██░░██████▒░██████▒    ▓█   ▓██▒░██████▒░██████▒    ▓█   ▓██▒▒██▒ ░  ░▒██▒ ░  ░▒██████▒▒%reset%
echo %color5%▒ ▒▒ ▓▒░▓  ░ ▒░▓  ░░ ▒░▓  ░    ▒▒   ▓▒█░░ ▒░▓  ░░ ▒░▓  ░    ▒▒   ▓▒█░▒▓▒░ ░  ░▒▓▒░ ░  ░▒ ▒▓▒ ▒ ░%reset%
echo %color5%░ ░▒ ▒░ ▒ ░░ ░ ▒  ░░ ░ ▒  ░     ▒   ▒▒ ░░ ░ ▒  ░░ ░ ▒  ░     ▒   ▒▒ ░░▒ ░     ░▒ ░     ░ ░▒  ░ ░%reset%
echo %color5%░ ░░ ░  ▒ ░  ░ ░     ░ ░        ░   ▒     ░ ░     ░ ░        ░   ▒   ░░       ░░       ░  ░  ░  %reset%
echo %color5%░  ░    ░      ░  ░    ░  ░         ░  ░    ░  ░    ░  ░         ░  ░                        ░  %reset%
                                                                                                

echo                                      %color2% Made By: %color5%Lunch

:: Menu Options
echo                              %color2%1.%reset% %color1%Start killing resource stealers%reset%
echo                                    %color2%2.%reset% %color1%View system info%reset%
echo                                    %color2%3.%reset% %color1%Game Mode%reset%
echo                                          %color2%4.%reset% %color1%Exit%reset%
echo.
set /p choice=Type your choice: 

if "%choice%"=="1" (
    goto kill_processes
) else if "%choice%"=="2" (
    goto view_info
) else if "%choice%"=="3" (
    goto kill_but_game
) else if "%choice%"=="4" (
    exit
) else (
    echo %color2%Invalid choice. Please try again.%reset%
    timeout /t 2 >nul
    goto menu
)

:view_info
cls
echo.
echo %color1%     System Information:%reset%
echo.

:: List running processes first
echo %color1%     Running Processes:%reset%
tasklist /FO TABLE

:: CPU Usage
for /f "tokens=2 delims==" %%A in ('wmic cpu get loadpercentage /value') do set "cpu_load=%%A"
echo %color1%     CPU Usage: %cpu_load%%reset%

:: Memory Usage
for /f "tokens=2 delims==" %%A in ('wmic OS get TotalVisibleMemorySize /value') do set "total_mem=%%A"
for /f "tokens=2 delims==" %%A in ('wmic OS get FreePhysicalMemory /value') do set "free_mem=%%A"

:: Convert KB to GB for display
set /A total_mem_gb=%total_mem%/1048576
set /A free_mem_gb=%free_mem%/1048576

:: Calculate used memory percentage
set /A used_mem=%total_mem%-%free_mem%
set /A mem_usage=(%used_mem%*100)/%total_mem%

echo %color1%     Memory Usage: %mem_usage%%reset%
echo %color1%     Free Memory: %free_mem_gb% GB of %total_mem_gb% GB%reset%
echo.
echo %color2%Press Enter to return to the menu...%reset%
pause >nul
goto menu

:kill_but_game
cls
echo.
echo %color1%     Enter the name of the game process (without .exe):%reset%
set /p game_name=Game Name: 
cls
echo %color1%     Closing all non-essential processes except %game_name%.exe...%reset%
echo.

REM Initialize counter
set "process_count=0"

REM Get the list of running processes
for /F "skip=1 tokens=1 delims=," %%A in ('tasklist /FO CSV /NH') do (
    set "process_name=%%~A"
    set "process_name=!process_name:"=!"
    call :IsEssentialProcess "!process_name!"
    if "!IS_ESSENTIAL!"=="false" (
        if /I "!process_name!" neq "!game_name!.exe" (
            echo %color1%Terminating !process_name!%reset%
            taskkill /F /IM "!process_name!" >nul 2>&1
            set /A process_count+=1
        )
    )
)

echo.
echo %color1%     Total processes terminated (excluding %game_name%.exe): %process_count%%reset%
echo.
echo %color1%     All non-essential processes except your game have been closed.%reset%
echo.
echo %color2%Press Enter to exit...%reset%
pause >nul
exit /b

:kill_processes
cls
echo.
echo %color1%     Closing resource stealing applications...%reset%
echo.

REM List of essential system processes to exclude
set "essential_processes=SystemIdleProcess,System,Registry,smss.exe,csrss.exe,wininit.exe,winlogon.exe,services.exe,lsass.exe,svchost.exe,explorer.exe,spoolsv.exe,taskhostw.exe,dwm.exe,fontdrvhost.exe,sihost.exe,ctfmon.exe,ShellExperienceHost.exe,SearchUI.exe,StartMenuExperienceHost.exe,RuntimeBroker.exe,ApplicationFrameHost.exe,TextInputHost.exe,audiodg.exe,fontdrvhost.exe,cmd.exe,conhost.exe,powershell.exe,taskeng.exe,taskmgr.exe,CloseNonEssentialApps.bat"

REM Initialize counter
set "process_count=0"

REM Get the list of running processes for the current user in CSV format
for /F "skip=1 tokens=1 delims=," %%A in ('tasklist /FI "USERNAME eq %USERNAME%" /FO CSV /NH') do (
    set "process_name=%%~A"
    set "process_name=!process_name:"=!"
    call :IsEssentialProcess "!process_name!"
    if "!IS_ESSENTIAL!"=="false" (
        echo %color1%Terminating !process_name!%reset%
        taskkill /F /IM "!process_name!" >nul 2>&1
        set /A process_count+=1
    )
)

echo.
echo %color1%     Total resource stealers terminated: %process_count%%reset%
echo.
echo %color1%     Your system has been cleansed.%reset%
echo.
echo %color2%Press Enter to exit...%reset%
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
