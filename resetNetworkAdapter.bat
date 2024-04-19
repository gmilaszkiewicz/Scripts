@echo off
Rem Skrypt resetujący kartę sieciową po 5 nieudanych pingach
Rem The script resets the network card after 5 failed ping attempts

setlocal enabledelayedexpansion

set server=1.1.1.1
set max_attempts=5
set attempts=0

:pingloop
ping %server% -n 1 | find "TTL"
if not errorlevel 1 (
    set attempts=0
) else (
    set /a attempts+=1
	echo %attempts%
    if !attempts! geq %max_attempts% (
		set attempts=0
		netsh interface set interface "Ethernet" Disable 
		netsh interface set interface "Ethernet" Enable 
        echo reset
		echo reset > reset.txt
    )
)
timeout /t 10 > nul
goto :pingloop


