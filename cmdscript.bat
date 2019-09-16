::XCOPY E:\sysbackups E:\BackUp\sysbackups\ /E /I /Y
::C:\HyperVBackup.v3\HyperVBackup.exe -l "debian-gitlab,debian-redmine" -o E:\BackUp\sysbackups\backuphyperv 1> E:\BackUp\sysbackups\backuphyperv\log_out.txt 2> E:\BackUp\sysbackups\backuphyperv\log_err.txt 


::C:\HVBackup1.0.1\HVBackup.exe -l "debian-gitlab" -o E:\BackUp\sysbackups\backuphyperv 1> E:\BackUp\sysbackups\backuphyperv\log_out.txt 2> E:\BackUp\sysbackups\backuphyperv\log_err.txt 


C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe C:\Hyper-V-Backup.ps1 -BackupTo E:\BackUp\sysbackups\backuphyperv -List C:\vms.txt  -Keep 30 -Compress -L E:\tmp




::удаление старых бекапов отменяю чтобы проверить как они удаляются от строки выше
::@echo off
::setlocal enableextensions enabledelayedexpansion
::for /f "skip=6 delims=" %%i in ('dir "E:\BackUp\sysbackups\backuphyperv\*" /b /a:-d /o:-d 2^>nul') do  del /f /q E:\BackUp\sysbackups\backuphyperv\"%%i"
::endlocal
::exit /b 0

C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe C:\CheckBackup.ps1
