; SetMonitorsNative:
;   RunWait, %comspec% /c "c:\Standalone\monitor-profile-switcher\MonitorSwitcher.exe -load:c:\Standalone\monitor-profile-switcher\native.xml"
;   ;Sleep, 5000
;   RestartWindowsFeatures()
;   Return

; SetMonitorsParsec:
;   RunWait, %comspec% /c "c:\Standalone\monitor-profile-switcher\MonitorSwitcher.exe -load:c:\Standalone\monitor-profile-switcher\parsec.xml"
;   ;Sleep, 5000
;   ;RestartWindowsFeatures()
;   Return

RestartExplorer:
  Process, Close, explorer.exe
  Return

Reload:
  Reload
  Return

; OpenMultilauncherFolder:
;    Run "C:/_github/multilauncher/configs/"
;   Return

; OpenDeckEngineFolder:
;   Run "c:/_github/deck-engine/"
;   Return

OpenFolder:
  Run %A_ScriptDir%
  Return

OpenFolderWithCode:
  Run, %comspec% /c "code %A_ScriptDir%",,Hide
  WinWait, ahk_class ConsoleWindowClass
  Process, Close, cmd.exe
  DetectHiddenWindows, On
  Return

; EditThisScript:
;   Run, edit "%A_ScriptFullPath%"
;   Return

RemoveTooltip:
  ToolTip
  Return

DoNothing:
  Return

Exit:
  ExitApp
  Return
