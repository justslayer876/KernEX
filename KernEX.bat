@echo off

echo KernEX (beta)

set /p input=

if %input%==badcommand goto com0

if %input%==ver goto com1

if %input%==help goto com2

if %input%==ping goto com3

if %input%==ping/noti goto com4

if %input%==ping/msgbox goto com5

if %input%==ping/txtbox goto com6

if %input%==exit goto com7

:com0

echo command not found try help
pause
KernEX.bat

:com1

echo KernEX (beta) V0.1
pause
KernEX.bat

:com2

echo Commands:
echo ver
echo ping ((/noti)(/msgbox)(/txtbox)) (May take a while to load)
echo exit
pause
KernEX.bat

:com3

echo please add one of the following:
echo /noti
echo /msgbox
echo /txtbox
pause
KernEX.bat

:com4

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'KernEX', 'Notification ping test.', [System.Windows.Forms.ToolTipIcon]::None)}"
pause
KernEX.bat

:com5

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Message box ping test.', 'KernEX', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
pause
KernEX.bat

:com6

powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('This is a text box ping test! Type whatever you like!', 'KernEX')}" > %TEMP%\out.tmp
set /p OUT=<%TEMP%\out.tmp
set msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You have entered: %OUT%', 'KernEX');}"
powershell -Command %msgBoxArgs%
pause
KernEX.bat

:com7

echo closing...