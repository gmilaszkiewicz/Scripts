@echo off
Rem Skrypt zapisujący zapamiętane w systemie hasła wifi do pliku wifi.txt
Rem A script that saves WiFi passwords saved in the system to the wifi.txt file

setlocal enabledelayedexpansion

for /F "tokens=2 delims=:" %%a in ('netsh wlan show profile') do (
	set wifi_pwd=
	for /F "tokens=2 delims=: usebackq" %%F IN (`netsh wlan show profile %%a key^=clear ^| find "Key Content"`) do (
		set wifi_pwd=%%F
	) 
	echo %%a :!wifi_pwd! >>wifi.txt
)
