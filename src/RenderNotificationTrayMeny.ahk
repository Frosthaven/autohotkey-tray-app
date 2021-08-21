; set the icon
Try Menu, Tray, Icon, %A_ScriptDir%\app\app.png

; set the header
Menu, Tray, NoStandard

; monitor profile switcher
; Menu, Tray, Add, 5120x1440 (Native), SetMonitorsNative
; try Menu, Tray, Icon, 5120x1440 (Native), C:\Windows\System32\SHELL32.DLL, 35
; Menu, Tray, Add, 1920x1080 (Parsec), SetMonitorsParsec
; try Menu, Tray, Icon, 1920x1080 (Parsec), C:\Windows\System32\SHELL32.DLL, 35
; Menu, Tray, Add

; restart features
Menu, Tray, Add, Restart Explorer, RestartExplorer
try Menu, Tray, Icon, Restart Explorer, C:\Windows\EXPLORER.EXE, 0

; Menu, Tray, Add, Restart RGB Features, RestartRGBFeatures
; try Menu, Tray, Icon, Restart RGB Features, C:\Windows\System32\SHELL32.DLL, 239

; Menu, Tray, Add, Restart Windows Features, RestartWindowsFeatures
; try Menu, Tray, Icon, Restart Windows Features, C:\Windows\System32\SHELL32.DLL, 239

; script control
Menu, Tray, Add
Menu, Tray, Add, Open Folder, OpenFolder
try Menu, Tray, Icon, Open Folder, C:\Windows\System32\SHELL32.DLL, 206
Menu, Tray, Add, Edit With Code, EditWithCode
try Menu, Tray, Icon, Edit With Code, %A_ScriptDir%\app\code.ico, 0
Menu, Tray, Add, Edit Hotkeys, EditHotkeys
try Menu, Tray, Icon, Edit Hotkeys, C:\Windows\System32\SHELL32.DLL, 134
Menu, Tray, Add, Reload, Reload
try Menu, Tray, Icon, Reload, C:\Windows\System32\SHELL32.DLL, 239
Menu, Tray, Add, Exit, Exit
try Menu, Tray, Icon, Exit, C:\Windows\System32\SHELL32.DLL, 132
Menu, Tray, Add, Dismiss This Menu, DoNothing
try Menu, Tray, Icon, Dismiss This Menu, C:\Windows\System32\SHELL32.DLL, 248

; app label at bottom of tray menu to prevent overlap issues
Menu, Tray, Add
Menu, Tray, Add, autohotkey-tray-app, OpenRepo
try Menu, Tray, Icon, autohotkey-tray-app, %A_ScriptDir%\app\github.ico, 0
Menu, Tray, Tip,autohotkey-tray-app

Return
