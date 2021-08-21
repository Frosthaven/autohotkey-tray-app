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
Menu, Tray, Add, Edit With Code, OpenFolderWithCode
try Menu, Tray, Icon, Edit With Code, C:\Windows\System32\SHELL32.DLL, 134
; Menu, Tray, Add, Edit, EditThisScript
; try Menu, Tray, Icon, Edit, C:\Windows\System32\SHELL32.DLL, 134
Menu, Tray, Add, Reload, Reload
try Menu, Tray, Icon, Reload, C:\Windows\System32\SHELL32.DLL, 239
Menu, Tray, Add, Exit, Exit
try Menu, Tray, Icon, Exit, C:\Windows\System32\SHELL32.DLL, 132
Menu, Tray, Add, Dismiss This Menu, DoNothing
try Menu, Tray, Icon, Dismiss This Menu, C:\Windows\System32\SHELL32.DLL, 248

; app label at bottom of tray menu to prevent overlap issues
Menu, Tray, Add
Menu, Tray, Add, [Global Hotkeys], DoNothing
try Menu, Tray, Icon, [Global Hotkeys], C:\Windows\System32\SHELL32.DLL, 163
Menu, Tray, Tip, Global Hotkeys

Return
