@echo off
Rem Skrypt importuje wszyskie profile wifi (nazwy sieci i hasła) z folderu C:\przyklad - aby wyeksporotwać profile należy użyć komendy "netsh wlan export profile key=clear"
Rem The script imports all wifi profiles (network names and passwords) from the folder C:\przyklad - to export profiles use the command "netsh wlan export profile key=clear"

setlocal enabledelayedexpansion

rem Ustaw ścieżkę do folderu zawierającego pliki XML
set "folder_path=C:\przyklad"

rem Iteruj przez pliki XML w folderze
for %%i in ("%folder_path%\*.xml") do (
    echo Importowanie: %%i
    netsh wlan add profile filename="%%i" user=all
)

echo Wszystkie pliki zostały zaimportowane.

endlocal
pause